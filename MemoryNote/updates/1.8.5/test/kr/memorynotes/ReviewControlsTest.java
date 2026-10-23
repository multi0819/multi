package kr.memorynotes;
import android.widget.*;
public class ReviewControlsTest {
 static class R extends ReviewScreen {int shows;void show(){shows++;}}
 public static void main(String[] args){MainActivity a=new MainActivity();a.content=new LinearLayout(a);a.u=new Ui(a);R r=new R();r.index=5;r.revealed=true;ReviewControls.addHide(a,r);if(a.content.getChildCount()!=1)throw new AssertionError("one rehide button");if(!a.content.getChildAt(0).performClick())throw new AssertionError("click handler missing");if(r.revealed||r.index!=5||r.shows!=1)throw new AssertionError("rehide same problem without recording rating or skipping");System.out.println("PASS: rehide button click hides current answer, retains index and redraws once");}
}
