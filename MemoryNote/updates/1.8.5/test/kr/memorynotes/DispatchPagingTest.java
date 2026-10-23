package kr.memorynotes;
import android.view.*;import android.widget.*;
/** Exercises dispatchTouchEvent rather than calling the interception callbacks directly. */
public class DispatchPagingTest {
 static void check(boolean ok,String msg){if(!ok)throw new AssertionError(msg);}
 static class A extends MainActivity {Note opened;void detail(Note n){opened=n;}}
 static class GreedyScroll extends ViewGroup {int downs,cancels,ups;public boolean dispatchTouchEvent(MotionEvent e){if(e.action==0){downs++;getParent().requestDisallowInterceptTouchEvent(true);}if(e.action==3)cancels++;if(e.action==1)ups++;return true;}}
 public static void main(String[] args){
  A a=new A();a.root=new LinearLayout(a);a.root.addView(new View());ViewGroup toolbar=new ViewGroup();toolbar.addView(new Button());a.root.addView(toolbar);GreedyScroll child=new GreedyScroll();a.content=new LinearLayout(a);child.addView(a.content);a.root.addView(child,2,new LinearLayout.LayoutParams(-1,0,1));
  ViewGroup list=new ViewGroup();Note n1=new Note();n1.id="1";Note n2=new Note();n2.id="2";
  NoteSwipe.card(a,list,n1);list.addView(new View());NoteSwipe.card(a,list,n2);list.addView(new View());NoteSwipe.bind(a,n1);check(a.root.getChildAt(1)==toolbar,"pen toolbar must remain outside pager");check(a.root.getChildAt(2) instanceof SwipePager,"actual scroll body must be paged");SwipePager pager=(SwipePager)a.root.getChildAt(2);
  check(pager.dispatchTouchEvent(new MotionEvent(0,500,400)),"down owned by page hierarchy");
  pager.dispatchTouchEvent(new MotionEvent(2,400,405));pager.dispatchTouchEvent(new MotionEvent(1,390,405));
  check(a.opened==n2,"horizontal page must survive child requestDisallowInterceptTouchEvent");
  check(child.downs==1&&child.cancels==1&&child.ups==0,"child gets exactly one cancellation and no release click");
  // Tap and vertical drag are still passed to the original child.
  a.opened=null;pager.dispatchTouchEvent(new MotionEvent(0,500,400));pager.dispatchTouchEvent(new MotionEvent(1,500,400));check(child.ups==1&&a.opened==null,"tap retained");
  pager.dispatchTouchEvent(new MotionEvent(0,500,400));pager.dispatchTouchEvent(new MotionEvent(2,503,500));pager.dispatchTouchEvent(new MotionEvent(1,503,550));check(child.ups==2&&a.opened==null,"vertical retained");
  // A second finger must cancel paging even if it is lifted before the next MOVE.
  pager.dispatchTouchEvent(new MotionEvent(0,500,400));MotionEvent second=new MotionEvent(5,480,400);second.count=2;pager.dispatchTouchEvent(second);pager.dispatchTouchEvent(new MotionEvent(2,400,400));pager.dispatchTouchEvent(new MotionEvent(1,350,400));check(a.opened==null,"second finger cancels before next move");
  System.out.println("PASS: host event-dispatch hierarchy, child interception lock, cancellation, taps and vertical scroll");
 }
}
