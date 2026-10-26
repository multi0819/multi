package kr.memorynotes;
import android.view.*;import android.widget.*;
public class DetailTest {
 static int edits,reviews,reads,favorites,converts,deletes,backs,refreshes;
 static void ok(boolean b,String s){if(!b)throw new AssertionError(s);}
 static Button find(View v,String s){if(v instanceof Button&&((Button)v).getText().toString().equals(s))return (Button)v;if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++){Button b=find(g.getChildAt(i),s);if(b!=null)return b;}}return null;}
 static MainActivity fixture(boolean dark,boolean speech){MainActivity a=new MainActivity();a.u=new Ui(a);a.prefs.dark=dark;a.root=new LinearLayout(a);a.content=new LinearLayout(a);a.root.addView(new LinearLayout(a));LinearLayout ink=new LinearLayout(a);a.root.addView(ink);a.root.addView(a.content);a.backAction=new Runnable(){public void run(){backs++;}};
  String[] names={"수정","☆ 즐겨찾기","이 노트 복습","오답노트로 전환","노트 삭제","▶ 이 문제 읽어주기"};for(int i=0;i<(speech?6:5);i++){final int n=i;a.content.addView(a.u.button(names[i],new Runnable(){public void run(){if(n==0)edits++;if(n==1)favorites++;if(n==2)reviews++;if(n==3)converts++;if(n==4)deletes++;if(n==5)reads++;}}));}return a;}
 public static void main(String[] args){
  for(boolean dark:new boolean[]{false,true})for(boolean speech:new boolean[]{false,true}){
   MainActivity a=fixture(dark,speech);DetailLayout.attach(a,new Note());find(a.root,"수정").performClick();find(a.root,"이 노트 복습").performClick();find(a.root,"☆ 즐겨찾기").performClick();find(a.root,"‹").performClick();
   if(speech)find(a.root,"▶ 읽어주기").performClick();else ok(find(a.root,"▶ 읽어주기")==null,"must preserve image exclusion");
   Button del=find(a.root,"노트 삭제");ok(((View)del.getParent()).getVisibility()==View.GONE,"delete not folded");find(a.root,"더 보기 ▾").performClick();ok(((View)del.getParent()).getVisibility()==View.VISIBLE,"more failed");del.performClick();find(a.root,"오답노트로 전환").performClick();
   ok(a.root.getChildAt(1).getVisibility()==View.GONE,"toolbar not folded");find(a.root,"필기 ▾").performClick();ok(a.root.getChildAt(1).getVisibility()==View.VISIBLE,"pen toggle failed");
  }
  MainActivity a=fixture(false,true);InkPage ink=new InkPage();ink.a=a;Runnable[] r={new Runnable(){public void run(){refreshes++;}}};EraseMenu.show(ink,r);android.app.AlertDialog.last.select(0);ok(ink.enabled&&ink.eraser&&refreshes==1,"eraser mode broken");EraseMenu.show(ink,r);android.app.AlertDialog.last.select(1);ok(a.u.confirms==1&&ink.clears==0,"must ask before clearing");a.u.pending.run();ok(ink.clears==1,"clear action not connected");
  ok(edits==4&&reviews==4&&favorites==4&&reads==2&&converts==4&&deletes==4&&backs==4,"action callbacks changed");
  System.out.println("PASS: 4 detail layout scenarios, image/TTS exclusion, original callbacks, eraser mode and confirmed-clear routing");
 }
}
