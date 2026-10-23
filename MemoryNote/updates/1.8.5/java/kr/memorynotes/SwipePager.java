package kr.memorynotes;
import android.view.*;import android.widget.*;
/** Observes dispatch only inside the existing body, before child interception flags. */
public final class SwipePager extends FrameLayout {
 private final MainActivity a;private final NoteSwipe nav;private final View body;private final SwipeGesture gesture;private boolean dragging,discard;
 public SwipePager(MainActivity a,NoteSwipe nav,View body){super(a);this.a=a;this.nav=nav;this.body=body;float density=a.getResources().getDisplayMetrics().density;gesture=new SwipeGesture(ViewConfiguration.get(a).getScaledTouchSlop()*2f,80*density);addView(body,new FrameLayout.LayoutParams(-1,-1));}
 private boolean blocked(View v,float x,float y){
  if(v.getVisibility()!=View.VISIBLE)return false;int[] p=new int[2];v.getLocationOnScreen(p);if(x<p[0]||y<p[1]||x>=p[0]+v.getWidth()||y>=p[1]+v.getHeight())return false;
  if(v instanceof Button||v instanceof EditText||v instanceof Spinner||v instanceof SeekBar||v instanceof HorizontalScrollView)return true;
  if(v.getClass().getSimpleName().equals("ImageMaskView")){try{java.lang.reflect.Field f=v.getClass().getDeclaredField("zoom");f.setAccessible(true);if(f.getFloat(v)>1)return true;}catch(Exception e){return true;}}
  if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=g.getChildCount()-1;i>=0;i--)if(blocked(g.getChildAt(i),x,y))return true;}return false;
 }
 @Override public boolean dispatchTouchEvent(MotionEvent e){
  int action=e.getActionMasked();
  if(action==MotionEvent.ACTION_DOWN){
   body.animate().cancel();body.setTranslationX(0);dragging=false;discard=false;
   boolean eligible=e.getPointerCount()==1&&e.getToolType(0)==MotionEvent.TOOL_TYPE_FINGER&&!blocked(body,e.getRawX(),e.getRawY());
   gesture.begin(e.getX(),e.getY(),e.getToolType(0),e.getPointerCount(),!eligible);
   // A short/empty body must still retain the stream for a horizontal swipe.
   return super.dispatchTouchEvent(e)||eligible;
  }
  if(!dragging&&(e.getPointerCount()!=1||e.getToolType(0)!=MotionEvent.TOOL_TYPE_FINGER))gesture.cancel();
  if(!dragging&&action==MotionEvent.ACTION_MOVE&&gesture.move(e.getX(),e.getY(),e.getToolType(0),e.getPointerCount())){
   // End the original child's gesture exactly once; no release click can follow.
   MotionEvent cancel=MotionEvent.obtain(e);cancel.setAction(MotionEvent.ACTION_CANCEL);super.dispatchTouchEvent(cancel);cancel.recycle();
   dragging=true;if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(true);return true;
  }
  if(dragging){
   if(e.getPointerCount()!=1||e.getToolType(0)!=MotionEvent.TOOL_TYPE_FINGER){discard=true;gesture.cancel();}
   if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL){
    int direction=action==MotionEvent.ACTION_UP&&!discard?gesture.finish(e.getX(),e.getY()):0;gesture.cancel();dragging=false;
    if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(false);
    if(direction!=0&&nav.go(a,direction))return true;body.animate().translationX(0).setDuration(140).start();
   }
   return true;
  }
  if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL)gesture.cancel();
  return super.dispatchTouchEvent(e);
 }
}
