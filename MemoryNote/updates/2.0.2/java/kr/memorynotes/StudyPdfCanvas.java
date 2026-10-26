package kr.memorynotes;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.util.AtomicFile;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewParent;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;

/** Fullscreen, fitted PDF page. All public operations must run on the UI thread.
 * Pan is measured in view pixels; zoom is relative to the fitted page size.
 * setPage transfers ownership of its bitmap. Never recycle that bitmap externally.
 */
public final class StudyPdfCanvas extends View {
    private static final int NAVIGATE = 0, SELECT = 1, PEN = 2, ERASER = 3;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Paint inkPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint selectionPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final ArrayList<Stroke> strokes = new ArrayList<Stroke>();
    private final ArrayList<ArrayList<Stroke>> history = new ArrayList<ArrayList<Stroke>>();
    private final ScaleGestureDetector scaleDetector;
    private Bitmap page;
    private File inkFile;
    private float scale = 1, offsetX, offsetY;
    private int mode, inkColor = Color.rgb(30, 90, 220);
    private float inkThickness = 3;
    private RectF selection;
    private Stroke active;
    private ArrayList<Stroke> beforeGesture;
    private boolean dirty, gesture, blocked, changed, inkLoadFailed;
    private int pointerId = -1, dragHandle = -1;
    private float lastX, lastY, startX, startY;
    private long lastError;
    private boolean viewportLocked, fingerGesture, swipeEligible;
    private Runnable previousPage, nextPage;
    private float downX, downY, downPanX, downPanY;

    private static final class Stroke {
        int color;
        float width;
        final ArrayList<Float> points = new ArrayList<Float>();
        Stroke(int color, float width) { this.color = color; this.width = width; }
    }

    public StudyPdfCanvas(Context context) {
        super(context);
        setBackgroundColor(Color.rgb(35, 38, 43));
        setFocusable(true);
        inkPaint.setStyle(Paint.Style.STROKE);
        inkPaint.setStrokeCap(Paint.Cap.ROUND);
        inkPaint.setStrokeJoin(Paint.Join.ROUND);
        scaleDetector = new ScaleGestureDetector(context, new ScaleGestureDetector.SimpleOnScaleGestureListener() {
            @Override public boolean onScaleBegin(ScaleGestureDetector detector) {
                cancelEdit();
                blocked = true;
                return page != null && !viewportLocked;
            }
            @Override public boolean onScale(ScaleGestureDetector detector) {
                if (page == null || viewportLocked) return false;
                float old = actualScale();
                float imageX = (detector.getFocusX() - left()) / old;
                float imageY = (detector.getFocusY() - top()) / old;
                scale = clamp(scale * detector.getScaleFactor(), 1, 8);
                float next = actualScale();
                offsetX = detector.getFocusX() - (getWidth() - page.getWidth() * next) / 2f - imageX * next;
                offsetY = detector.getFocusY() - Math.max(0, (getHeight() - page.getHeight() * next) / 2f) - imageY * next;
                constrainPan();
                invalidate();
                return true;
            }
        });
    }

    public void setPage(Bitmap bitmap, File file, float zoom, float panX, float panY) {
        swipeEligible = false;
        cancelEdit();
        if (!saveInk()) {
            if (bitmap != null && bitmap != page && !bitmap.isRecycled()) bitmap.recycle();
            return; // Keep unsaved work accessible when storage fails.
        }
        if (page != null && page != bitmap && !page.isRecycled()) page.recycle();
        page = bitmap;
        inkFile = file;
        scale = finite(zoom) ? clamp(zoom, 1, 8) : 1;
        offsetX = finite(panX) ? panX : 0;
        offsetY = finite(panY) ? panY : 0;
        selection = null;
        strokes.clear();
        history.clear();
        dirty = false;
        inkLoadFailed = false;
        loadInk();
        constrainPan();
        invalidate();
    }

    public void setMode(int value) {
        swipeEligible = false;
        if (value < NAVIGATE || value > ERASER) throw new IllegalArgumentException("Unknown PDF tool");
        cancelEdit();
        mode = value;
        releaseParent();
        invalidate();
    }
    public void setInk(int color, float thickness) {
        inkColor = color;
        if (finite(thickness)) inkThickness = clamp(thickness, .5f, 40);
    }
    public void setViewportLocked(boolean locked) {
        cancelEdit();
        swipeEligible = false;
        viewportLocked = locked;
        releaseParent();
    }
    public boolean isViewportLocked() { return viewportLocked; }
    public void setPageTurnListener(Runnable previous, Runnable next) {
        previousPage = previous;
        nextPage = next;
    }
    public float zoom() { return scale; }
    public float panX() { return offsetX; }
    public float panY() { return offsetY; }
    public void clearSelection() { selection = null; invalidate(); }
    public boolean hasSelection() {
        return page != null && selection != null && selection.width() * page.getWidth() > 3
                && selection.height() * page.getHeight() > 3;
    }
    public void flush() { cancelEdit(); saveInk(); }
    /** After flush, a true result means navigation should wait for storage recovery. */
    public boolean hasUnsavedInk() { return dirty; }
    /** Explicit permanent release; transient detach does not recycle the page. */
    public void dispose() {
        cancelEdit();
        if (!saveInk()) return;
        if (page != null && !page.isRecycled()) page.recycle();
        page = null;
        strokes.clear();
        history.clear();
        selection = null;
        releaseParent();
        invalidate();
    }
    public void undoInk() {
        if (protectUnreadableInk()) return;
        cancelEdit();
        if (history.isEmpty()) {
            if (strokes.isEmpty()) return;
            strokes.remove(strokes.size() - 1);
        } else {
            strokes.clear();
            strokes.addAll(history.remove(history.size() - 1));
        }
        dirty = true;
        saveInk();
        invalidate();
    }
    public void clearInk() {
        if (protectUnreadableInk()) return;
        cancelEdit();
        if (strokes.isEmpty()) return;
        remember(new ArrayList<Stroke>(strokes));
        strokes.clear();
        dirty = true;
        saveInk();
        invalidate();
    }

    public Bitmap cropSelection() {
        if (!hasSelection() || page.isRecycled()) return null;
        int x = Math.max(0, (int) Math.floor(selection.left * page.getWidth()));
        int y = Math.max(0, (int) Math.floor(selection.top * page.getHeight()));
        int right = Math.min(page.getWidth(), (int) Math.ceil(selection.right * page.getWidth()));
        int bottom = Math.min(page.getHeight(), (int) Math.ceil(selection.bottom * page.getHeight()));
        if (right - x <= 3 || bottom - y <= 3) return null;
        try {
            Bitmap result = Bitmap.createBitmap(right - x, bottom - y, Bitmap.Config.ARGB_8888);
            Canvas c = new Canvas(result);
            c.drawColor(Color.WHITE);
            c.translate(-x, -y);
            c.drawBitmap(page, 0, 0, paint);
            drawInk(c);
            return result;
        } catch (OutOfMemoryError error) {
            error("Not enough memory to crop this selection.");
            return null;
        }
    }

    private float fit() {
        if (page == null || getWidth() <= 0 || getHeight() <= 0) return 1;
        return (float) getWidth() / page.getWidth();
    }
    private float actualScale() { return fit() * scale; }
    private float left() { return (getWidth() - page.getWidth() * actualScale()) / 2f + offsetX; }
    private float top() { return Math.max(0, (getHeight() - page.getHeight() * actualScale()) / 2f) + offsetY; }
    private float nx(float x) { return clamp((x - left()) / (page.getWidth() * actualScale()), 0, 1); }
    private float ny(float y) { return clamp((y - top()) / (page.getHeight() * actualScale()), 0, 1); }
    private boolean inside(float x, float y) {
        return x >= left() && y >= top() && x <= left() + page.getWidth() * actualScale()
                && y <= top() + page.getHeight() * actualScale();
    }
    private void constrainPan() {
        if (page == null || getWidth() <= 0 || getHeight() <= 0) return;
        float maxX = Math.max(0, (page.getWidth() * actualScale() - getWidth()) / 2f);
        float maxY = Math.max(0, page.getHeight() * actualScale() - getHeight());
        offsetX = clamp(offsetX, -maxX, maxX);
        offsetY = clamp(offsetY, -maxY, 0);
    }
    @Override protected void onSizeChanged(int w, int h, int oldw, int oldh) { constrainPan(); }
    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (page == null || page.isRecycled()) return;
        canvas.save();
        canvas.translate(left(), top());
        canvas.scale(actualScale(), actualScale());
        canvas.drawBitmap(page, 0, 0, paint);
        canvas.clipRect(0, 0, page.getWidth(), page.getHeight());
        drawInk(canvas);
        if (active != null) drawStroke(canvas, active);
        canvas.restore();
        if (selection != null) {
            RectF rect = new RectF(left() + selection.left * page.getWidth() * actualScale(),
                    top() + selection.top * page.getHeight() * actualScale(),
                    left() + selection.right * page.getWidth() * actualScale(),
                    top() + selection.bottom * page.getHeight() * actualScale());
            // Draw in view pixels so the outline stays readable at every zoom level.
            selectionPaint.setStyle(Paint.Style.FILL);
            selectionPaint.setColor(0x263498FF);
            canvas.drawRect(rect, selectionPaint);
            selectionPaint.setStyle(Paint.Style.STROKE);
            selectionPaint.setStrokeWidth(dp(7));
            selectionPaint.setColor(Color.WHITE);
            canvas.drawRect(rect, selectionPaint);
            selectionPaint.setStrokeWidth(dp(4));
            selectionPaint.setColor(0xFF102A43);
            canvas.drawRect(rect, selectionPaint);
            selectionPaint.setStrokeWidth(dp(2));
            selectionPaint.setColor(0xFF007AFF);
            canvas.drawRect(rect, selectionPaint);
            drawSelectionHandle(canvas, rect.left, rect.top);
            drawSelectionHandle(canvas, rect.right, rect.top);
            drawSelectionHandle(canvas, rect.left, rect.bottom);
            drawSelectionHandle(canvas, rect.right, rect.bottom);
        }
    }
    private void drawSelectionHandle(Canvas canvas, float x, float y) {
        selectionPaint.setStyle(Paint.Style.FILL);
        selectionPaint.setColor(Color.WHITE);
        canvas.drawCircle(x, y, dp(9), selectionPaint);
        selectionPaint.setColor(0xFF102A43);
        canvas.drawCircle(x, y, dp(7), selectionPaint);
        selectionPaint.setColor(0xFF007AFF);
        canvas.drawCircle(x, y, dp(5), selectionPaint);
        selectionPaint.setColor(Color.WHITE);
        canvas.drawCircle(x, y, dp(2), selectionPaint);
    }
    private void drawInk(Canvas canvas) { for (Stroke stroke : strokes) drawStroke(canvas, stroke); }
    private void drawStroke(Canvas canvas, Stroke stroke) {
        if (stroke.points.size() < 2) return;
        inkPaint.setColor(stroke.color);
        inkPaint.setStrokeWidth(stroke.width * page.getWidth());
        float x = stroke.points.get(0) * page.getWidth(), y = stroke.points.get(1) * page.getHeight();
        if (stroke.points.size() == 2) {
            inkPaint.setStyle(Paint.Style.FILL);
            canvas.drawCircle(x, y, inkPaint.getStrokeWidth() / 2f, inkPaint);
            inkPaint.setStyle(Paint.Style.STROKE);
            return;
        }
        Path path = new Path();
        path.moveTo(x, y);
        for (int i = 2; i < stroke.points.size(); i += 2)
            path.lineTo(stroke.points.get(i) * page.getWidth(), stroke.points.get(i + 1) * page.getHeight());
        canvas.drawPath(path, inkPaint);
    }

    @Override public boolean onTouchEvent(MotionEvent event) {
        if (page == null || page.isRecycled()) return false;
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN && event.getToolType(0) != MotionEvent.TOOL_TYPE_FINGER
                && (mode == PEN || mode == ERASER)) protectUnreadableInk();
        if (action == MotionEvent.ACTION_DOWN) {
            blocked = false;
            gesture = true;
            pointerId = event.getPointerId(0);
            fingerGesture = event.getToolType(0) == MotionEvent.TOOL_TYPE_FINGER;
            swipeEligible = fingerGesture && mode != SELECT;
            downX = event.getX(); downY = event.getY();
            downPanX = offsetX; downPanY = offsetY;
            ViewParent parent = getParent();
            if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
        }
        // Cancel before the detector can interpret a two-finger gesture.
        if (event.getPointerCount() > 1) { swipeEligible = false; cancelEdit(); blocked = true; }
        scaleDetector.onTouchEvent(event);
        if (action == MotionEvent.ACTION_CANCEL) {
            swipeEligible = false; cancelEdit(); blocked = false; gesture = false; releaseParent(); invalidate(); return true;
        }
        if (blocked) {
            if (action == MotionEvent.ACTION_UP) { blocked = false; gesture = false; releaseParent(); }
            return true;
        }
        int index = event.findPointerIndex(pointerId);
        if (index < 0) { swipeEligible = false; cancelEdit(); releaseParent(); return true; }
        float x = event.getX(index), y = event.getY(index);
        if (action == MotionEvent.ACTION_DOWN) {
            lastX = x; lastY = y;
            if (mode == SELECT) {
                dragHandle = hitHandle(x, y);
                if (dragHandle >= 0) {
                    startX = (dragHandle == 0 || dragHandle == 2) ? selection.right : selection.left;
                    startY = (dragHandle == 0 || dragHandle == 1) ? selection.bottom : selection.top;
                } else if (inside(x, y)) {
                    startX = nx(x); startY = ny(y);
                    selection = new RectF(startX, startY, startX, startY);
                } else { gesture = false; }
            } else if (!fingerGesture && !inkLoadFailed && (mode == PEN || mode == ERASER) && inside(x, y)) {
                beforeGesture = new ArrayList<Stroke>(strokes);
                changed = false;
                if (mode == PEN) {
                    active = new Stroke(inkColor, dp(inkThickness) / actualScale() / page.getWidth());
                    addPoint(x, y);
                } else erase(x, y);
            }
        } else if (action == MotionEvent.ACTION_MOVE && gesture) {
            if (mode == NAVIGATE || (fingerGesture && (mode == PEN || mode == ERASER))) {
                if (!viewportLocked) {
                    offsetX += x - lastX; offsetY += y - lastY; constrainPan();
                }
            } else if (mode == SELECT && selection != null) {
                selection.set(Math.min(startX, nx(x)), Math.min(startY, ny(y)), Math.max(startX, nx(x)), Math.max(startY, ny(y)));
            } else if (mode == PEN && active != null) {
                for (int h = 0; h < event.getHistorySize(); h++)
                    addPoint(event.getHistoricalX(index, h), event.getHistoricalY(index, h));
                addPoint(x, y);
            } else if (mode == ERASER && beforeGesture != null) {
                eraseLine(lastX, lastY, x, y);
            }
            lastX = x; lastY = y;
        } else if (action == MotionEvent.ACTION_UP) {
            // UP may carry the only changed position on a quick drag. Commit it
            // before the minimum-size check rather than dropping a valid selection.
            if (gesture && mode == SELECT && selection != null)
                selection.set(Math.min(startX, nx(x)), Math.min(startY, ny(y)),
                        Math.max(startX, nx(x)), Math.max(startY, ny(y)));
            if (mode == PEN && active != null) {
                addPoint(x, y); strokes.add(active); active = null; changed = true;
            }
            if (beforeGesture != null && changed) { remember(beforeGesture); dirty = true; saveInk(); }
            beforeGesture = null;
            if (selection != null && !hasSelection()) selection = null;
            gesture = false;
            releaseParent();
            Runnable turn = null;
            if (swipeEligible && isPageSwipe(x - downX, y - downY, dp(80)))
                turn = x > downX ? previousPage : nextPage;
            swipeEligible = false;
            if (turn != null) {
                // A rejected edge turn leaves exactly the viewport the gesture started with.
                offsetX = downPanX;
                offsetY = downPanY;
                turn.run();
            } else performClick();
        }
        invalidate();
        return true;
    }
    @Override public boolean performClick() { super.performClick(); return true; }
    private void addPoint(float x, float y) {
        float px = nx(x), py = ny(y);
        int n = active.points.size();
        if (n >= 2 && active.points.get(n - 2) == px && active.points.get(n - 1) == py) return;
        active.points.add(px); active.points.add(py);
    }
    private int hitHandle(float x, float y) {
        if (selection == null) return -1;
        int closest = -1;
        double nearest = dp(22);
        for (int i = 0; i < 4; i++) {
            float hx = left() + ((i == 0 || i == 2) ? selection.left : selection.right) * page.getWidth() * actualScale();
            float hy = top() + (i < 2 ? selection.top : selection.bottom) * page.getHeight() * actualScale();
            double distance = Math.hypot(x - hx, y - hy);
            if (distance <= nearest) { nearest = distance; closest = i; }
        }
        return closest;
    }
    private void eraseLine(float ax, float ay, float bx, float by) {
        int count = Math.max(1, (int) Math.ceil(Math.hypot(bx - ax, by - ay) / dp(6)));
        for (int i = 1; i <= count; i++) erase(ax + (bx - ax) * i / count, ay + (by - ay) * i / count);
    }
    private void erase(float vx, float vy) {
        float x = (vx - left()) / actualScale(), y = (vy - top()) / actualScale();
        for (int s = strokes.size() - 1; s >= 0; s--) {
            Stroke stroke = strokes.get(s);
            float radius = dp(14) / actualScale() + stroke.width * page.getWidth() / 2;
            boolean hit = false;
            for (int i = 0; i < stroke.points.size(); i += 2) {
                float bx = stroke.points.get(i) * page.getWidth(), by = stroke.points.get(i + 1) * page.getHeight();
                float ax = i == 0 ? bx : stroke.points.get(i - 2) * page.getWidth();
                float ay = i == 0 ? by : stroke.points.get(i - 1) * page.getHeight();
                float dx = bx - ax, dy = by - ay;
                float t = dx * dx + dy * dy == 0 ? 0 : clamp(((x - ax) * dx + (y - ay) * dy) / (dx * dx + dy * dy), 0, 1);
                if (Math.hypot(x - ax - t * dx, y - ay - t * dy) <= radius) { hit = true; break; }
            }
            if (hit) { strokes.remove(s); changed = true; }
        }
    }
    private void cancelEdit() {
        swipeEligible = false;
        active = null;
        if (beforeGesture != null) { strokes.clear(); strokes.addAll(beforeGesture); beforeGesture = null; }
        if (gesture && mode == SELECT) selection = null;
        gesture = false;
        changed = false;
        invalidate();
    }
    private void remember(ArrayList<Stroke> previous) {
        history.add(previous);
        if (history.size() > 30) history.remove(0);
    }
    private void releaseParent() {
        ViewParent parent = getParent();
        if (parent != null) parent.requestDisallowInterceptTouchEvent(false);
    }
    @Override protected void onDetachedFromWindow() {
        cancelEdit(); saveInk(); releaseParent(); super.onDetachedFromWindow();
    }

    private boolean saveInk() {
        if (inkLoadFailed) return true; // Preserve unreadable originals byte for byte.
        if (!dirty) return true;
        if (inkFile == null) { error("PDF 필기를 저장할 페이지 정보가 없습니다."); return false; }
        AtomicFile file = new AtomicFile(inkFile);
        FileOutputStream out = null;
        try {
            File parent = inkFile.getParentFile();
            if (parent != null && !parent.isDirectory() && !parent.mkdirs()) throw new java.io.IOException("Cannot create ink directory");
            JSONObject root = new JSONObject();
            root.put("version", 1);
            JSONArray data = new JSONArray();
            for (Stroke stroke : strokes) {
                JSONObject item = new JSONObject();
                item.put("color", stroke.color); item.put("width", stroke.width);
                JSONArray points = new JSONArray();
                for (Float point : stroke.points) points.put(point.doubleValue());
                item.put("points", points); data.put(item);
            }
            root.put("strokes", data);
            byte[] bytes = root.toString().getBytes("UTF-8");
            out = file.startWrite();
            out.write(bytes);
            file.finishWrite(out);
            dirty = false;
            return true;
        } catch (Exception exception) {
            if (out != null) file.failWrite(out);
            error("PDF 필기 저장에 실패했습니다. 저장 공간을 확인해 주세요.");
            return false;
        }
    }
    private void loadInk() {
        if (inkFile == null) return;
        AtomicFile file = new AtomicFile(inkFile);
        if (!inkFile.exists() && !new File(inkFile.getPath() + ".bak").exists()) return;
        ArrayList<Stroke> loaded = new ArrayList<Stroke>();
        try {
            FileInputStream input = file.openRead();
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            try {
                byte[] buffer = new byte[8192]; int count;
                while ((count = input.read(buffer)) != -1) {
                    if (bytes.size() + count > 32 * 1024 * 1024) throw new java.io.IOException("Ink file too large");
                    bytes.write(buffer, 0, count);
                }
            } finally { input.close(); }
            JSONObject root = new JSONObject(new String(bytes.toByteArray(), "UTF-8"));
            if (root.getInt("version") != 1) throw new java.io.IOException("Unknown ink version");
            JSONArray data = root.getJSONArray("strokes");
            for (int i = 0; i < data.length(); i++) {
                JSONObject item = data.getJSONObject(i);
                float width = (float) item.getDouble("width");
                if (!finite(width) || width <= 0 || width > 1) throw new java.io.IOException("Invalid ink width");
                Stroke stroke = new Stroke(item.getInt("color"), width);
                JSONArray points = item.getJSONArray("points");
                if (points.length() < 2 || points.length() % 2 != 0) throw new java.io.IOException("Invalid ink points");
                for (int j = 0; j < points.length(); j++) {
                    float p = (float) points.getDouble(j);
                    if (!finite(p) || p < 0 || p > 1) throw new java.io.IOException("Invalid ink coordinate");
                    stroke.points.add(p);
                }
                loaded.add(stroke);
            }
            strokes.addAll(loaded);
        } catch (Exception exception) { error("이 페이지의 필기를 읽지 못했습니다. 원본 필기 파일은 유지됩니다."); }
    }
    private boolean protectUnreadableInk() {
        if (!inkLoadFailed) return false;
        error("필기 파일을 읽지 못해 원본을 보호하고 있습니다. 이 페이지의 필기는 수정할 수 없습니다.");
        return true;
    }
    /** Pure distance gate; tool/mode/multitouch eligibility is checked by the caller. */
    public static boolean isPageSwipe(float dx, float dy, float minimumDistance) {
        return !Float.isNaN(dx) && !Float.isNaN(dy) && !Float.isInfinite(dx)
                && !Float.isInfinite(dy) && minimumDistance > 0
                && Math.abs(dx) >= minimumDistance && Math.abs(dx) >= 1.5f * Math.abs(dy);
    }
    private float dp(float value) { return value * getResources().getDisplayMetrics().density; }
    private static float clamp(float v, float min, float max) { return Math.max(min, Math.min(max, v)); }
    private static boolean finite(float v) { return !Float.isNaN(v) && !Float.isInfinite(v); }
    private void error(String message) {
        long now = android.os.SystemClock.uptimeMillis();
        if (lastError == 0 || now - lastError > 2500) Toast.makeText(getContext(), message, Toast.LENGTH_LONG).show();
        lastError = now;
    }
}
