"""Exercise the real canvas touch code with isolated Android host doubles.

Run: python CanvasTextGestureTest.py
Requires a JDK and Android API23 jar. Finds workspace tools automatically;
JAVAC, JAVA and ANDROID_JAR environment variables can override discovery.
The production canvas is compiled against Android first, then exercised with
minimal host doubles. This verifies gesture state/coordinates, not rendering,
Android's native gesture detector, or the API35 text extraction implementation.
All generated files live in a fresh temporary directory and are removed on exit.
"""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
TOOLS = [p / "tools" for p in HERE.parents if (p / "tools").is_dir()]

def locate(env_name, command, relative):
    if os.environ.get(env_name):
        return os.environ[env_name]
    found = shutil.which(command) if command else None
    if found:
        return found
    for root in TOOLS:
        path = root / relative
        if path.is_file():
            return str(path)
    raise SystemExit("Cannot find " + env_name + "; set its environment variable.")

JAVAC = locate("JAVAC", "javac", "sdk/usr/lib/jvm/java-17-openjdk-amd64/bin/javac")
JAVA = locate("JAVA", "java", "sdk/usr/lib/jvm/java-17-openjdk-amd64/bin/java")
ANDROID = locate("ANDROID_JAR", None, "sdk/usr/share/java/com.android.android-23.jar")
ENV = dict(os.environ)
# The extracted javac launcher can use the installed JDK's shared libraries.
libs = [str(p) for p in Path("/usr/lib/jvm").glob("*/lib") if p.is_dir()]
ENV["LD_LIBRARY_PATH"] = os.pathsep.join(filter(None, [ENV.get("LD_LIBRARY_PATH", "")] + libs))

SOURCES = {
    'CanvasTextGestureTest.java': 'import kr.memorynotes.StudyPdfCanvas;import android.graphics.*;import android.view.MotionEvent;import java.util.*;import java.lang.reflect.*;\npublic class CanvasTextGestureTest {\nstatic int checks,turns;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}static void near(float a,float b,String m){check(Math.abs(a-b)<.0001,m+":"+a+" != "+b);}static class Listener implements StudyPdfCanvas.TextSelectionListener {ArrayList<float[]> events=new ArrayList<float[]>();int cancels;public void onSelection(float x,float y,float ex,float ey,boolean f){events.add(new float[]{x,y,ex,ey,f?1:0});}public void onCancelled(){cancels++;}}static void touch(StudyPdfCanvas c,int action,float x,float y,int count,int tool){c.onTouchEvent(new MotionEvent(action,x,y,count,tool));}static float[] last(Listener l){return l.events.get(l.events.size()-1);}static Object field(StudyPdfCanvas c,String f)throws Exception{Field x=StudyPdfCanvas.class.getDeclaredField(f);x.setAccessible(true);return x.get(c);}public static void main(String[]args)throws Exception{\nStudyPdfCanvas c=new StudyPdfCanvas(null);Listener l=new Listener();c.setTextSelectionListener(l);c.setPage(new Bitmap(),null,1,0,0);c.setMode(4);c.setPageTurnListener(new Runnable(){public void run(){turns++;}},new Runnable(){public void run(){turns++;}});\ntouch(c,0,200,200,1,1);touch(c,1,800,600,1,1);check(l.events.size()==2,"quick drag down+up");near(last(l)[0],.2f,"start x");near(last(l)[1],.1f,"start y");near(last(l)[2],.8f,"final x");near(last(l)[3],.3f,"final y");check(last(l)[4]==1,"UP finished");check(turns==0,"text never pages");check(!c.hasSelection(),"text never rectangle crop");\nc.setTextSelection(Arrays.asList(new RectF(.2f,.1f,.8f,.3f)),new PointF(.2f,.1f),new PointF(.8f,.3f));near(c.panY(),0,"results do not pan");touch(c,0,200,200,1,2);touch(c,2,100,100,1,2);touch(c,1,50,50,1,2);near(last(l)[0],.05f,"start handle drags independently");near(last(l)[2],.8f,"other endpoint fixed");\ntouch(c,0,900,900,1,1);touch(c,1,100,100,1,1);near(last(l)[0],.9f,"backwards start preserved");near(last(l)[2],.1f,"backwards end preserved");check(turns==0,"backward text never pages");\nint before=l.cancels;touch(c,0,500,300,1,1);touch(c,2,700,400,2,1);touch(c,1,700,400,1,1);check(l.cancels>before,"pinch cancels");check(field(c,"textHandleStart")==null,"pinch clears handles");int count=l.events.size();touch(c,2,800,500,1,1);check(l.events.size()==count,"pinch remainder cannot resurrect drag");\ntouch(c,0,-100,100,1,1);touch(c,1,500,500,1,1);check(l.events.size()==count,"outside page cannot begin");\ntouch(c,0,100,100,1,1);touch(c,1,300,300,1,1);c.setTextSelection(Arrays.asList(new RectF(-2,-3,2,3),new RectF(Float.NaN,0,1,1)),new PointF(-1,2),new PointF(1,0));ArrayList<?> rects=(ArrayList<?>)field(c,"textBounds");check(rects.size()==1,"invalid bound discarded");RectF clean=(RectF)rects.get(0);near(clean.left,0,"bound clamp left");near(clean.bottom,1,"bound clamp bottom");PointF handle=(PointF)field(c,"textHandleStart");near(handle.x,0,"handle clamp x");near(handle.y,1,"handle clamp y");\nbefore=l.cancels;c.setMode(2);check(l.cancels==before+1,"mode exit cancels");check(field(c,"textHandleStart")==null,"mode exit clears");c.setMode(4);touch(c,0,100,100,1,1);touch(c,1,300,300,1,1);before=l.cancels;c.setPage(new Bitmap(),null,1,0,0);check(l.cancels==before+1,"page switch cancels");\nc.setViewportLocked(true);touch(c,0,100,100,1,1);touch(c,1,900,900,1,1);check(last(l)[4]==1,"locked viewport allows text");near(c.panX(),0,"locked text leaves pan x");near(c.panY(),0,"locked text leaves pan y");c.setTextSelection(Arrays.asList(new RectF(.1f,.05f,.9f,.45f)),new PointF(.1f,.05f),new PointF(.9f,.45f));touch(c,0,900,900,1,1);touch(c,1,800,800,1,1);near(last(l)[0],.1f,"end handle keeps start");near(last(l)[2],.8f,"end handle moves");\ntouch(c,0,400,400,1,1);touch(c,1,400,400,1,1);near(last(l)[0],last(l)[2],"tap preserves equal x for word selection");near(last(l)[1],last(l)[3],"tap preserves equal y for word selection");\ntouch(c,0,200,200,1,1);before=l.cancels;touch(c,3,300,300,1,1);check(l.cancels==before+1,"ACTION_CANCEL notifies once");count=l.events.size();touch(c,1,600,600,1,1);check(l.events.size()==count,"cancel remainder does not commit");\ntouch(c,0,200,200,1,1);touch(c,1,400,400,1,1);before=l.cancels;c.dispose();check(l.cancels==before+1,"dispose cancels");System.out.println(checks+" text gesture assertions passed (host Android fakes)");}}\n',
    'android/content/res/Resources.java': 'package android.content.res;public class Resources {public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}',
    'android/graphics/Bitmap.java': 'package android.graphics;public class Bitmap {boolean recycled; public int getWidth(){return 1000;}public int getHeight(){return 2000;}public boolean isRecycled(){return recycled;}public void recycle(){recycled=true;}}',
    'android/graphics/Color.java': 'package android.graphics;public class Color {public static final int WHITE=-1;public static int rgb(int r,int g,int b){return 0xff000000|(r<<16)|(g<<8)|b;}}',
    'android/graphics/Paint.java': 'package android.graphics;public class Paint {public static final int ANTI_ALIAS_FLAG=1,FILTER_BITMAP_FLAG=2;public enum Style{STROKE,FILL}public enum Cap{ROUND}public enum Join{ROUND}public Paint(int f){}public void setStyle(Style s){}public void setStrokeCap(Cap c){}public void setStrokeJoin(Join j){}public void setColor(int c){}public void setStrokeWidth(float w){}public float getStrokeWidth(){return 1;}}',
    'android/graphics/PointF.java': 'package android.graphics;public class PointF {public float x,y;public PointF(float x,float y){this.x=x;this.y=y;}}',
    'android/graphics/RectF.java': 'package android.graphics;public class RectF {public float left,top,right,bottom;public RectF(float a,float b,float c,float d){set(a,b,c,d);}public RectF(RectF r){this(r.left,r.top,r.right,r.bottom);}public void set(float a,float b,float c,float d){left=a;top=b;right=c;bottom=d;}public float width(){return right-left;}public float height(){return bottom-top;}public float centerX(){return (left+right)/2;}public float centerY(){return (top+bottom)/2;}}',
    'android/util/DisplayMetrics.java': 'package android.util;public class DisplayMetrics {public float density=1;}',
    'android/view/MotionEvent.java': 'package android.view;public class MotionEvent {public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,TOOL_TYPE_FINGER=1;private int action,count,tool;private float x,y;public MotionEvent(int a,float x,float y,int count,int tool){action=a;this.x=x;this.y=y;this.count=count;this.tool=tool;}public int getActionMasked(){return action;}public int getToolType(int i){return tool;}public int getPointerId(int i){return 0;}public int getPointerCount(){return count;}public int findPointerIndex(int id){return 0;}public float getX(){return x;}public float getY(){return y;}public float getX(int i){return x;}public float getY(int i){return y;}public int getHistorySize(){return 0;}public float getHistoricalX(int i,int h){return x;}public float getHistoricalY(int i,int h){return y;}}',
    'android/view/ScaleGestureDetector.java': 'package android.view;public class ScaleGestureDetector {public interface OnScaleGestureListener {}public static class SimpleOnScaleGestureListener implements OnScaleGestureListener {public boolean onScaleBegin(ScaleGestureDetector d){return false;}public boolean onScale(ScaleGestureDetector d){return false;}}public ScaleGestureDetector(android.content.Context c,OnScaleGestureListener l){}public boolean onTouchEvent(MotionEvent e){return true;}public float getFocusX(){return 0;}public float getFocusY(){return 0;}public float getScaleFactor(){return 1;}}',
    'android/view/View.java': 'package android.view; public class View { public View(android.content.Context c){} public void setBackgroundColor(int c){}public void setFocusable(boolean b){} public void invalidate(){}public int getWidth(){return 1000;}public int getHeight(){return 1000;}public ViewParent getParent(){return null;}public android.content.Context getContext(){return null;}public android.content.res.Resources getResources(){return new android.content.res.Resources();} protected void onDraw(android.graphics.Canvas c){}protected void onSizeChanged(int w,int h,int a,int b){}protected void onDetachedFromWindow(){} public boolean onTouchEvent(MotionEvent e){return false;}public boolean performClick(){return true;}}',
}

with tempfile.TemporaryDirectory(prefix="canvas-text-gesture-") as temp:
    root = Path(temp)
    product = root / "product"
    hosts = root / "hosts"
    product_sources = [HERE / "java/kr/memorynotes/StudyPdfCanvas.java",
                       HERE / "StudyPdfCanvasGestureTest.java"]
    # Compile against the unmodified Android API jar before any host shadowing.
    subprocess.run([JAVAC, "--release", "8", "-encoding", "UTF-8", "-cp", ANDROID,
                    "-d", str(product), *map(str, product_sources)], env=ENV, check=True)
    paths = []
    for name, source in SOURCES.items():
        path = root / "src" / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding="utf-8")
        paths.append(str(path))
    subprocess.run([JAVAC, "--release", "8", "-encoding", "UTF-8", "-cp",
                    os.pathsep.join([ANDROID, str(product)]), "-d", str(hosts), *paths],
                   env=ENV, check=True)
    subprocess.run([JAVA, "-cp", os.pathsep.join([str(hosts), str(product), ANDROID]),
                    "CanvasTextGestureTest"], env=ENV, check=True)
    subprocess.run([JAVA, "-cp", os.pathsep.join([str(product), ANDROID]),
                    "StudyPdfCanvasGestureTest"], env=ENV, check=True)
