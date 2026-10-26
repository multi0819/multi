package kr.memorynotes;
import android.view.*;import android.widget.*;
public final class CompactStudyMetadata {
 public static void apply(NoteEditor e){LinearLayout card=(LinearLayout)e.generalFields.getParent();
  for(Spinner s:new Spinner[]{e.subject,e.chapter,e.type})if(s.getParent() instanceof ViewGroup)((ViewGroup)s.getParent()).removeView(s);
  while(card.getChildCount()>0&&card.getChildAt(0)!=e.generalFields)card.removeView(card.getChildAt(0));
  LinearLayout row=new LinearLayout(e.a);row.setOrientation(0);String[] names={"과목","단원","유형"};Spinner[] spinners={e.subject,e.chapter,e.type};
  for(int i=0;i<3;i++){LinearLayout col=new LinearLayout(e.a);col.setOrientation(1);TextView label=e.a.u.text(names[i],11,e.a.u.muted);col.addView(label);spinners[i].setVisibility(View.VISIBLE);spinners[i].setMinimumHeight(e.a.u.dp(42));col.addView(spinners[i],new LinearLayout.LayoutParams(-1,-2));row.addView(col,new LinearLayout.LayoutParams(0,-2,1));}
  card.addView(row,0,new LinearLayout.LayoutParams(-1,-2));
 }
}
