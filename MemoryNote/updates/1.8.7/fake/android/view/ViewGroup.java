package android.view;
import java.util.*;public class ViewGroup extends View implements ViewParent {private View touchTarget;public boolean disallow;
 @Override public boolean dispatchTouchEvent(MotionEvent e){
  if(e.action==0){disallow=false;touchTarget=null;}
  boolean intercept=(touchTarget!=null||e.action==0)?(!disallow&&onInterceptTouchEvent(e)):true;
  boolean result=false;
  if(touchTarget!=null&&intercept){MotionEvent c=MotionEvent.obtain(e);c.setAction(3);touchTarget.dispatchTouchEvent(c);touchTarget=null;return true;}
  if(touchTarget!=null)result=touchTarget.dispatchTouchEvent(e);
  else if(!intercept&&e.action==0){for(int i=children.size()-1;i>=0;i--)if(children.get(i).dispatchTouchEvent(e)){touchTarget=children.get(i);result=true;break;}}
  if(touchTarget==null){result=onTouchEvent(e)||result;}
  if(e.action==1||e.action==3){touchTarget=null;disallow=false;}return result;
 }
public void requestDisallowInterceptTouchEvent(boolean b){disallow=b;if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(b);}public boolean onInterceptTouchEvent(MotionEvent e){return false;}public boolean onTouchEvent(MotionEvent e){return false;}public static class LayoutParams {public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}public ArrayList<View> children=new ArrayList<>();public int indexOfChild(View v){return children.indexOf(v);}public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}public void addView(View v,int i){addView(v,i,new LayoutParams(-1,-2));}public void addView(View v){v.parent=this;children.add(v);}public void addView(View v,int index,LayoutParams p){v.setLayoutParams(p);v.parent=this;children.add(index,v);}public void removeViewAt(int i){children.remove(i).parent=null;}}
