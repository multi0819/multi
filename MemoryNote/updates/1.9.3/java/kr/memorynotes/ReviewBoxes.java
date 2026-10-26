package kr.memorynotes;
import android.view.*;
import android.widget.*;
public final class ReviewBoxes {
 public static void apply(MainActivity a){
  View primary=a.content.findViewWithTag("ink:question");if(primary==null)primary=a.content.findViewWithTag("ink:body");
  if(primary==null)return;
  // Retain every rendered/masked view and its ink anchor, but remove the extra enclosing card padding.
  View card=primary;while(card.getParent() instanceof View&&card.getParent()!=a.content)card=(View)card.getParent();
  if(card.getParent()==a.content){card.setPadding(0,0,0,0);card.setBackgroundColor(0x00000000);}
  wrap(a,"question","문제 · 질문",0);wrap(a,"answer","정답 · 해설",0);wrap(a,"body","내용",0);
  wrap(a,"mine","내 답",3);wrap(a,"reason","틀린 점",1);wrap(a,"caution","주의사항",2);
  new DetailLayout(a).styleSections(a.content);
 }
 static void wrap(MainActivity a,String key,String title,int role){
  View field=a.content.findViewWithTag("ink:"+key);if(field==null||!(field.getParent() instanceof LinearLayout))return;
  LinearLayout parent=(LinearLayout)field.getParent();if("review:box".equals(parent.getTag()))return;
  int index=parent.indexOfChild(field);
  if(index>0&&parent.getChildAt(index-1) instanceof TextView){TextView old=(TextView)parent.getChildAt(index-1);String label=old.getText().toString();if(label.equals("정답 · 해설")||label.equals("내 답")||label.equals("틀린 이유")||label.equals("다음에 확인할 것")){parent.removeView(old);index--;}}
  parent.removeView(field);LinearLayout body=a.u.section(parent,title,role);body.setTag("review:box");
  View outer=(View)body.getParent();parent.removeView(outer);LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(-1,-2);lp.setMargins(0,a.u.dp(5),0,a.u.dp(12));parent.addView(outer,index,lp);
  // Match the detail screen's readable body size while preserving spans, masks, images and listeners.
  textSize(field,18*a.u.scale);body.addView(field,new LinearLayout.LayoutParams(-1,-2));
 }
 static void textSize(View v,float size){if(v instanceof TextView)((TextView)v).setTextSize(size);if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++)textSize(g.getChildAt(i),size);}}
}
