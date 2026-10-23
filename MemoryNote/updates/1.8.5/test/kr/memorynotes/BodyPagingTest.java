package kr.memorynotes;
import android.view.*;import android.widget.*;import java.util.*;
public class BodyPagingTest {
 static int checks;static void check(boolean ok,String s){checks++;if(!ok)throw new AssertionError(s);}
 static void shell(MainActivity a){a.root=new LinearLayout(a);LinearLayout header=new LinearLayout(a);header.addView(new View());a.root.addView(header);ViewGroup toolbar=new ViewGroup();toolbar.addView(new Button());a.root.addView(toolbar);ViewGroup body=new ViewGroup();ViewGroup ink=new ViewGroup();a.content=new LinearLayout(a);a.content.addView(new View());ink.addView(a.content);body.addView(ink);a.root.addView(body,2,new LinearLayout.LayoutParams(-1,0,1));NoteSwipe.clear(a);}
 static class A extends MainActivity {Note opened;void detail(Note n){opened=n;shell(this);NoteSwipe.bind(this,n);}}
 static class R extends ReviewScreen {MainActivity a;int shows;R(MainActivity a){this.a=a;}void show(){shows++;shell(a);NoteSwipe.bindReview(a,this);}}
 static Note n(String s){Note n=new Note();n.id=s;return n;}
 static SwipePager pager(MainActivity a){return (SwipePager)a.root.getChildAt(2);}
 static void drag(MainActivity a,int delta){SwipePager p=pager(a);check(p.dispatchTouchEvent(new MotionEvent(0,500,400)),"down retained by body");check(p.dispatchTouchEvent(new MotionEvent(2,500+delta,405)),"horizontal body motion captured");p.dispatchTouchEvent(new MotionEvent(2,500+delta,405));p.dispatchTouchEvent(new MotionEvent(1,500+delta,405));}
 public static void main(String[] args){
  A a=new A();shell(a);ViewGroup list=new ViewGroup();Note one=n("1"),two=n("2"),three=n("3");for(Note n:Arrays.asList(one,two,three)){NoteSwipe.card(a,list,n);list.addView(new View());}a.detail(one);
  check(a.root.getChildCount()==3,"no new header or navigation region");check(((ViewGroup)a.root.getChildAt(0)).getChildCount()==1,"original header unchanged");
  ViewGroup.LayoutParams rootParams=pager(a).getLayoutParams();check(rootParams.width==-1&&rootParams.height==0&&((LinearLayout.LayoutParams)rootParams).weight==1,"original weighted viewport retained");check(pager(a).getChildAt(0).getLayoutParams().width==-1&&pager(a).getChildAt(0).getLayoutParams().height==-1,"original scroll body fills viewport");
  drag(a,-100);check(a.opened==two,"next detail");drag(a,100);check(a.opened==one,"previous detail");drag(a,100);check(a.opened==one,"first detail boundary");
  SwipePager p=pager(a);p.dispatchTouchEvent(new MotionEvent(0,500,400));check(!p.dispatchTouchEvent(new MotionEvent(2,505,500)),"vertical scroll passed");
  MotionEvent pen=new MotionEvent(0,500,400);pen.tool=2;p.dispatchTouchEvent(pen);pen.action=2;pen.x=300;check(!p.dispatchTouchEvent(pen),"S Pen passed");
  p.dispatchTouchEvent(new MotionEvent(0,500,400));MotionEvent pinch=new MotionEvent(2,440,405);pinch.count=2;check(!p.dispatchTouchEvent(pinch),"pinch passed");
  R r=new R(a);r.notes=new ArrayList<>();for(int i=0;i<102;i++)r.notes.add(n("review"+i));r.index=0;r.revealed=true;r.show();drag(a,-100);check(r.index==1&&!r.revealed&&r.shows==2,"review next survives real shell clear/rebind");drag(a,100);check(r.index==0,"review previous");
  for(int i=1;i<102;i++)drag(a,-100);check(r.index==101,"all 102 review pages reachable");drag(a,-100);check(r.index==101,"last review boundary");check(((ViewGroup)a.root.getChildAt(0)).getChildCount()==1,"no header growth after 102 pages");
  // Buttons are not captured by the pager.
  ViewGroup body=(ViewGroup)pager(a).getChildAt(0);body.addView(new Button());p=pager(a);p.dispatchTouchEvent(new MotionEvent(0,500,400));check(!p.dispatchTouchEvent(new MotionEvent(2,440,405)),"button input passed");
  // Real UI body follows the drag, and cancels back to zero without navigation.
  body.children.remove(body.children.size()-1);p.dispatchTouchEvent(new MotionEvent(0,500,400));check(p.dispatchTouchEvent(new MotionEvent(2,520,400)),"small drag begins");p.dispatchTouchEvent(new MotionEvent(2,520,400));check(body.translationX==0,"body stays stationary before commit");p.dispatchTouchEvent(new MotionEvent(3,520,400));check(body.translationX==0&&r.index==101,"cancel restores body");
  System.out.println("PASS: "+checks+" body paging, original layout, 102-page review, scroll, stylus, pinch, button and cancellation checks");
 }
}
