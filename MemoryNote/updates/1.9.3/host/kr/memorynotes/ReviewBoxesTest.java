package kr.memorynotes;import android.view.*;import android.widget.*;
public class ReviewBoxesTest {
 static void ok(boolean b,String s){if(!b)throw new AssertionError(s);}
 public static void main(String[] args){for(boolean revealed:new boolean[]{false,true}){
 MainActivity a=DetailTest.fixture(false,true);LinearLayout card=new LinearLayout(a);a.content.addView(card);TextView q=new TextView(a);q.setTag("ink:question");q.setText("질문 {{가린 문구}}");card.addView(q);
 TextView answer=new TextView(a);answer.setTag("ink:answer");answer.setText("정답");if(revealed){card.addView(a.u.text("정답 · 해설",13,0));card.addView(answer);}
 ReviewBoxes.apply(a);ok(a.content.findViewWithTag("ink:question")==q,"question replaced");ok("review:box".equals(((View)q.getParent()).getTag()),"question box missing");ok(q.getText().toString().contains("{{가린 문구}}"),"mask changed");
 if(revealed)ok(a.content.findViewWithTag("ink:answer")==answer&&"review:box".equals(((View)answer.getParent()).getTag()),"answer box missing");else ok(a.content.findViewWithTag("ink:answer")==null,"answer leaked before reveal");
 View parent=(View)q.getParent();ReviewBoxes.apply(a);ok(q.getParent()==parent,"repeat wraps");
 }
 MainActivity a=DetailTest.fixture(false,true);LinearLayout toolbar=(LinearLayout)a.root.getChildAt(1),palette=new LinearLayout(a);toolbar.addView(palette);Button purple=new Button(a);purple.setContentDescription("보라");palette.addView(purple);Button undo=new Button(a);palette.addView(undo);InkPage ink=new InkPage();ink.a=a;ThicknessControl.attach(ink);View slider=toolbar.findViewWithTag("ink:thickness");ok(slider.getParent().getParent()==palette,"width not beside colors");ok(palette.indexOfChild((View)slider.getParent())==palette.indexOfChild(purple)+1,"width placement");
 System.out.println("PASS: review boxes before/after reveal, preserved content/masks, idempotent wrapping, inline width beside colors");}
}
