package kr.memorynotes;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.*;
import android.widget.*;
import java.util.ArrayList;
public final class DetailLayout {
 final MainActivity a;final Ui u;final boolean dark;
 DetailLayout(MainActivity a){this.a=a;u=a.u;dark=a.getPreferences(0).getBoolean("dark",false);}
 public static void attach(MainActivity a,Note n){new DetailLayout(a).build(n);}
 int dp(float n){return u.dp(n);}
 ArrayList<View> children(ViewGroup p){ArrayList<View> v=new ArrayList<View>();for(int i=0;i<p.getChildCount();i++)v.add(p.getChildAt(i));return v;}
 void detach(View v){if(v!=null&&v.getParent() instanceof ViewGroup)((ViewGroup)v.getParent()).removeView(v);}
 LinearLayout row(){LinearLayout v=new LinearLayout(a);v.setOrientation(0);v.setGravity(Gravity.CENTER_VERTICAL);return v;}
 LinearLayout col(){LinearLayout v=new LinearLayout(a);v.setOrientation(1);return v;}
 Button find(View root,String s){if(root instanceof Button&&((Button)root).getText().toString().contains(s))return (Button)root;if(root instanceof ViewGroup)for(View v:children((ViewGroup)root)){Button b=find(v,s);if(b!=null)return b;}return null;}
 Button description(View root,String s){if(root instanceof Button&&s.contentEquals(root.getContentDescription()==null?"":root.getContentDescription()))return (Button)root;if(root instanceof ViewGroup)for(View v:children((ViewGroup)root)){Button b=description(v,s);if(b!=null)return b;}return null;}
 Button color(Button b,int role){b.setAllCaps(false);b.setTextSize(13*u.scale);b.setTypeface(null,Typeface.BOLD);b.setTextColor(EditorPalette.foreground(dark,role));b.setBackgroundTintList(null);GradientDrawable bg=new GradientDrawable();bg.setColor(EditorPalette.background(dark,role));bg.setCornerRadius(dp(12));b.setBackground(bg);b.setMinimumWidth(0);b.setMinWidth(0);b.setMinimumHeight(dp(46));b.setMinHeight(dp(46));b.setPadding(dp(10),dp(9),dp(10),dp(9));return b;}
 Button button(String s,int role,Runnable r){return color(u.button(s,r),role);}
 void weighted(LinearLayout row,View v){detach(v);LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,-2,1);p.setMargins(dp(3),dp(4),dp(3),dp(4));row.addView(v,p);}
 void build(Note n){
  Button edit=find(a.content,"수정"),favorite=find(a.content,"즐겨찾기"),read=find(a.content,"읽어주기"),review=find(a.content,"이 노트 복습"),convert=find(a.content,"오답노트로"),delete=find(a.content,"노트 삭제");
  if(edit==null||review==null)return;
  ViewGroup oldActionRow=(ViewGroup)edit.getParent();
  for(Button b:new Button[]{edit,favorite,read,review,convert,delete})detach(b);
  if(oldActionRow!=a.content&&oldActionRow.getChildCount()==0)detach(oldActionRow);
  LinearLayout header=(LinearLayout)a.root.getChildAt(0);final View toolbar=a.root.getChildAt(1);
  final Button pen=description(toolbar,"펜"),text=description(toolbar,"텍스트 선택 모드");
  if(text!=null)text.performClick();toolbar.setVisibility(View.GONE);
  header.removeAllViews();header.setPadding(dp(16),dp(7),dp(16),dp(7));LinearLayout top=row();
  Button back=button("‹",0,new Runnable(){public void run(){if(a.backAction!=null)a.backAction.run();}});back.setTextSize(26);back.setContentDescription("뒤로 가기");top.addView(back,new LinearLayout.LayoutParams(dp(46),dp(46)));
  LinearLayout heading=col();heading.setPadding(dp(12),0,dp(6),0);String title="문답 카드".equals(n.type)?"문답 노트":n.title;TextView name=u.text(title,18,u.ink);name.setTypeface(null,Typeface.BOLD);name.setMaxLines(2);heading.addView(name);TextView meta=u.text(a.meta(n),11,u.muted);meta.setMaxLines(2);heading.addView(meta);top.addView(heading,new LinearLayout.LayoutParams(0,-2,1));
  Button ink=button("필기 ▾",0,new Runnable(){public void run(){boolean open=toolbar.getVisibility()!=View.VISIBLE;toolbar.setVisibility(open?View.VISIBLE:View.GONE);if(open&&pen!=null)pen.performClick();else if(!open&&text!=null)text.performClick();}});LinearLayout.LayoutParams ip=new LinearLayout.LayoutParams(-2,-2);ip.setMargins(0,0,dp(8),0);top.addView(ink,ip);
  edit.setText("수정");color(edit,EditorPalette.ANSWER);top.addView(edit,new LinearLayout.LayoutParams(dp(72),-2));header.addView(top);
  styleSections(a.content);
  LinearLayout primary=row();review.setText("이 노트 복습");color(review,EditorPalette.SAVE);weighted(primary,review);if(read!=null){read.setText("▶ 읽어주기");color(read,EditorPalette.IMAGE);weighted(primary,read);}a.content.addView(primary);
  LinearLayout secondary=row();if(favorite!=null){color(favorite,EditorPalette.CLOZE);weighted(secondary,favorite);}
  final LinearLayout extra=col();final Button more=button("더 보기 ▾",0,new Runnable(){public void run(){}});more.setOnClickListener(new View.OnClickListener(){public void onClick(View v){boolean open=extra.getVisibility()!=View.VISIBLE;extra.setVisibility(open?View.VISIBLE:View.GONE);more.setText(open?"더 보기 ▴":"더 보기 ▾");}});weighted(secondary,more);a.content.addView(secondary);
  if(convert!=null){color(convert,EditorPalette.CLOZE);extra.addView(convert,new LinearLayout.LayoutParams(-1,-2));}if(delete!=null){color(delete,EditorPalette.CAUTION);extra.addView(delete,new LinearLayout.LayoutParams(-1,-2));}extra.setVisibility(View.GONE);a.content.addView(extra);
 }
 void styleSections(ViewGroup p){
  for(View v:children(p))if(v instanceof LinearLayout){LinearLayout section=(LinearLayout)v;
   if(section.getChildCount()>0&&section.getChildAt(0) instanceof TextView){TextView title=(TextView)section.getChildAt(0);String s=title.getText().toString();int role=s.contains("정답")?EditorPalette.SAVE:s.contains("문제")?EditorPalette.ANSWER:s.contains("주의")?EditorPalette.CAUTION:s.contains("틀린")?EditorPalette.CLOZE:-1;
    if(role>=0){title.setTextColor(EditorPalette.foreground(dark,role));title.setBackground(shape(EditorPalette.background(dark,role)));}}
   styleSections(section);
  }
 }
 GradientDrawable shape(int c){GradientDrawable d=new GradientDrawable();d.setColor(c);d.setCornerRadius(dp(10));return d;}
}
