package kr.memorynotes;
import android.view.*;import android.widget.*;
public class ContentAnchorTest {
 static void check(boolean v,String m){if(!v)throw new AssertionError(m);}
 public static void main(String[] args){
  for(int extras=0;extras<4;extras++){
   MainActivity a=new MainActivity();a.root=new LinearLayout(a);a.root.addView(new View());
   for(int i=0;i<extras;i++)a.root.addView(new ViewGroup());
   ViewGroup scroll=new ViewGroup(),ink=new ViewGroup();a.content=new LinearLayout(a);ink.addView(a.content);scroll.addView(ink);LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-1,0,1);int bodyIndex=a.root.getChildCount();a.root.addView(scroll,bodyIndex,params);
   Note n=new Note();n.id="note";NoteSwipe.bind(a,n);
   check(a.root.getChildAt(bodyIndex) instanceof SwipePager,"actual content ancestor must be wrapped regardless of toolbar position");
   SwipePager pager=(SwipePager)a.root.getChildAt(bodyIndex);check(pager.getChildAt(0)==scroll,"original ScrollView retained");check(pager.getLayoutParams()==params,"exact root layout params preserved");
   int count=a.root.getChildCount();NoteSwipe.bind(a,n);check(a.root.getChildCount()==count&&a.root.getChildAt(bodyIndex)==pager,"rebinding does not nest extra pager");
  }
  System.out.println("PASS: actual content ancestry across 4 toolbar layouts; exact viewport parameters; idempotent binding");
 }
}
