package kr.memorynotes;
import android.view.*;import android.widget.*;
public class SwipeDistanceTest {
 static void check(boolean v,String s){if(!v)throw new AssertionError(s);}
 static class A extends MainActivity {Note opened;void detail(Note n){opened=n;}}
 static void swipe(SwipePager pager,int delta){pager.dispatchTouchEvent(new MotionEvent(0,500,400));pager.dispatchTouchEvent(new MotionEvent(2,500+delta,400));check(pager.getChildAt(0).translationX==0,"body and photos must remain stationary while dragging");pager.dispatchTouchEvent(new MotionEvent(1,500+delta,400));}
 public static void main(String[] args){
  for(int density=1;density<=3;density++){
   A a=new A();a.getResources().metrics.density=density;a.root=new LinearLayout(a);a.root.addView(new View());ViewGroup toolbar=new ViewGroup();a.root.addView(toolbar);a.content=new LinearLayout(a);ViewGroup scroll=new ViewGroup();scroll.addView(a.content);a.root.addView(scroll,2,new LinearLayout.LayoutParams(-1,0,1));
   Note n1=new Note();n1.id="1";Note n2=new Note();n2.id="2";ViewGroup list=new ViewGroup();NoteSwipe.card(a,list,n1);list.addView(new View());NoteSwipe.card(a,list,n2);list.addView(new View());NoteSwipe.bind(a,n1);SwipePager pager=(SwipePager)a.root.getChildAt(2);
   swipe(pager,-79*density);check(a.opened==null,"under 80dp must not navigate");swipe(pager,-80*density);check(a.opened==n2,"80dp must navigate on release");
  }
  System.out.println("PASS: stationary content and 80dp threshold at 3 display densities");
 }
}
