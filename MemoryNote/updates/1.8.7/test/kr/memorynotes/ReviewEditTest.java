package kr.memorynotes;
import java.util.*;import android.widget.*;
public class ReviewEditTest {
 static void check(boolean b,String s){if(!b)throw new AssertionError(s);}
 static class A extends MainActivity {Note detailed,edited;void detail(Note n){detailed=n;}void edit(Note n){edited=n;}}
 static class R extends ReviewScreen {int shows;void show(){shows++;}}
 public static void main(String[] args)throws Exception{
  A a=new A();a.content=new LinearLayout(a);a.u=new Ui(a);R r=new R();r.notes=new ArrayList<>();Note n=new Note();n.id="same";n.question="{{문제}}";n.answer="{{정답}}";r.notes.add(n);r.revealed=true;
  ReviewActions.addRevealControl(a,r);check(a.content.getChildCount()==1,"cloze button present after answer");a.content.getChildAt(0).performClick();check(!ReviewFlow.masked(r)&&r.shows==1,"second button opens cloze without changing index");
  a.content=new LinearLayout(a);ReviewActions.addRevealControl(a,r);a.content.getChildAt(0).performClick();check(!r.revealed&&ReviewFlow.masked(r),"third button hides both");
  java.lang.reflect.Field f=ReviewActions.class.getDeclaredField("editing");f.setAccessible(true);Map<MainActivity,ReviewScreen> map=(Map<MainActivity,ReviewScreen>)f.get(null);map.put(a,r);
  Note saved=new Note();saved.id="same";saved.answer="수정된 정답";ReviewActions.afterSave(a,saved);check(r.notes.get(0)==saved&&!r.revealed&&r.index==0&&r.shows==3,"save returns to same review with new content hidden");check(a.detailed==null,"review save avoids detail screen");
  ReviewActions.afterSave(a,saved);check(a.detailed==saved,"ordinary save retains detail behavior");map.put(a,r);ReviewActions.clear(a);check(map.isEmpty(),"leaving clears pending return");
  System.out.println("PASS: cloze reveal/rehide clicks, same-item edit return, ordinary save and pending cleanup");
 }
}
