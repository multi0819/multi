package kr.memorynotes;

import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.*;
import android.widget.*;
import java.util.ArrayList;

/** Rearranges the current native editor without replacing fields or their listeners. */
public final class EditorLayout {
 private final NoteEditor e;
 private final MainActivity a;
 private final Ui u;
 private final boolean dark;
 private EditorLayout(NoteEditor editor){e=editor;a=e.a;u=a.u;dark=a.getPreferences(0).getBoolean("dark",false);}
 public static void attach(NoteEditor editor){new EditorLayout(editor).build();}
 private int dp(float n){return u.dp(n);}
 private LinearLayout column(){LinearLayout v=new LinearLayout(a);v.setOrientation(LinearLayout.VERTICAL);return v;}
 private LinearLayout row(){LinearLayout v=new LinearLayout(a);v.setOrientation(LinearLayout.HORIZONTAL);v.setGravity(Gravity.CENTER_VERTICAL);return v;}
 private void detach(View v){if(v!=null&&v.getParent() instanceof ViewGroup)((ViewGroup)v.getParent()).removeView(v);}
 private void weighted(LinearLayout row,View child){detach(child);LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,-2,1);p.setMargins(dp(3),dp(3),dp(3),dp(3));row.addView(child,p);}
 private GradientDrawable shape(int color){GradientDrawable s=new GradientDrawable();s.setColor(color);s.setCornerRadius(dp(12));return s;}
 private Button color(Button b,int role){
  b.setAllCaps(false);b.setTextSize(13*u.scale);b.setTypeface(null,Typeface.BOLD);
  b.setTextColor(EditorPalette.foreground(dark,role));b.setBackgroundTintList(null);
  b.setBackground(shape(EditorPalette.background(dark,role)));
  b.setMinimumWidth(0);b.setMinWidth(0);b.setMinHeight(dp(46));b.setMinimumHeight(dp(46));
  b.setPadding(dp(10),dp(9),dp(10),dp(9));b.setFocusable(false);
  return b;
 }
 private Button button(String title,int role,final Runnable action){return color(u.button(title,action),role);}
 private TextView label(String text,int role){TextView t=u.text(text,13,EditorPalette.foreground(dark,role));t.setTypeface(null,Typeface.BOLD);t.setPadding(dp(4),dp(10),0,dp(6));return t;}
 private ArrayList<View> children(ViewGroup p){ArrayList<View> out=new ArrayList<View>();for(int i=0;i<p.getChildCount();i++)out.add(p.getChildAt(i));return out;}
 private Button findButton(ViewGroup p,String text){for(View v:children(p)){if(v instanceof Button&&((Button)v).getText().toString().contains(text))return (Button)v;if(v instanceof ViewGroup){Button found=findButton((ViewGroup)v,text);if(found!=null)return found;}}return null;}
 private void build(){
  final Button save=findButton(a.content,"노트 저장");
  Button cancel=findButton(a.content,"작성 취소");
  if(save==null)return;
  detach(save);detach(cancel);save.setText("저장");color(save,EditorPalette.SAVE);
  final LinearLayout header=(LinearLayout)a.root.getChildAt(0);
  final View penTools=a.root.getChildAt(1);
  // The original pen/text actions retain the InkPage state and repaint callback.
  final Button pen=findByDescription(penTools,"펜");
  final Button text=findByDescription(penTools,"텍스트 선택 모드");
  if(text!=null)text.performClick();
  penTools.setVisibility(View.GONE);
  header.removeAllViews();header.setPadding(dp(16),dp(7),dp(16),dp(7));
  LinearLayout top=row();
  Button back=button("‹",EditorPalette.NEUTRAL,new Runnable(){public void run(){e.leave();}});
  back.setTextSize(26);back.setContentDescription("뒤로 가기 · 임시저장");
  top.addView(back,new LinearLayout.LayoutParams(dp(46),dp(46)));
  LinearLayout heading=column();heading.setPadding(dp(12),0,dp(4),0);
  TextView title=u.text("노트 작성",18,u.ink);title.setTypeface(null,Typeface.BOLD);heading.addView(title);
  heading.addView(u.text("자동 임시저장",11,u.muted));
  top.addView(heading,new LinearLayout.LayoutParams(0,-2,1));
  final Button ink=button("필기 ▾",EditorPalette.NEUTRAL,new Runnable(){public void run(){
   boolean open=penTools.getVisibility()!=View.VISIBLE;penTools.setVisibility(open?View.VISIBLE:View.GONE);
   if(open&&pen!=null)pen.performClick();else if(!open&&text!=null)text.performClick();
  }});
  LinearLayout.LayoutParams ip=new LinearLayout.LayoutParams(-2,-2);ip.setMargins(0,0,dp(8),0);top.addView(ink,ip);
  top.addView(save,new LinearLayout.LayoutParams(dp(72),-2));header.addView(top);
  compactMetadata();
  setupGeneralTools();
  setupCardTools();
  foldField(e.reason,"틀린 점",EditorPalette.CLOZE);
  foldField(e.caution,"주의사항",EditorPalette.CAUTION);
  Button optional=findButton(a.content,"사진 · 태그");
  if(optional!=null){optional.setText("추가 옵션  ·  사진 / 태그 / 즐겨찾기  ▾");color(optional,EditorPalette.NEUTRAL);}
  Button gallery=findButton(a.content,"갤러리에서");if(gallery!=null){gallery.setText("＋ 사진 첨부");color(gallery,EditorPalette.IMAGE);}
  styleField(e.body,10);styleField(e.question,5);styleField(e.answer,7);
  e.title.setTextSize(19*u.scale);e.title.setTypeface(null,Typeface.BOLD);
 }
 private Button findByDescription(View root,String description){
  if(root instanceof Button&&description.contentEquals(root.getContentDescription()==null?"":root.getContentDescription()))return (Button)root;
  if(root instanceof ViewGroup)for(View v:children((ViewGroup)root)){Button b=findByDescription(v,description);if(b!=null)return b;}
  return null;
 }
 private void styleField(EditText field,int lines){field.setMinLines(lines);field.setPadding(dp(14),dp(12),dp(14),dp(12));field.setGravity(Gravity.TOP|Gravity.START);}
 private void compactMetadata(){
  LinearLayout card=(LinearLayout)e.generalFields.getParent();
  detach(e.subject);detach(e.chapter);detach(e.type);detach(e.generalFields);detach(e.extras);detach(e.mistakeFields);
  card.removeAllViews();card.setPadding(dp(12),dp(8),dp(12),dp(14));
  LinearLayout metadata=row();
  LinearLayout subject=column(),chapter=column();
  subject.addView(label("과목",EditorPalette.NEUTRAL));chapter.addView(label("단원",EditorPalette.NEUTRAL));
  e.subject.setMinimumHeight(dp(48));e.chapter.setMinimumHeight(dp(48));
  subject.addView(e.subject,new LinearLayout.LayoutParams(-1,-2));chapter.addView(e.chapter,new LinearLayout.LayoutParams(-1,-2));
  weighted(metadata,subject);weighted(metadata,chapter);card.addView(metadata);
  e.type.setVisibility(View.GONE);card.addView(e.type);
  card.addView(label("노트 유형",EditorPalette.NEUTRAL));
  final LinearLayout types=row();
  final String[] names={"일반","문답","오답"};
  final String[] values={"일반 노트","문답 카드","오답노트"};
  final Button[] tabs=new Button[3];
  for(int i=0;i<3;i++){
   final int selected=i;
   tabs[i]=button(names[i],EditorPalette.NEUTRAL,new Runnable(){public void run(){
    e.type.setSelection(selected);
    // GONE Spinner does not lay out, so dispatch the model change explicitly.
    e.switchType(values[selected]);
    for(int n=0;n<tabs.length;n++)color(tabs[n],n==selected?EditorPalette.ANSWER:EditorPalette.NEUTRAL);
   }});weighted(types,tabs[i]);
  }
  int current=e.type.getSelectedItemPosition();if(current>=0&&current<3)color(tabs[current],EditorPalette.ANSWER);
  card.addView(types);card.addView(e.generalFields);card.addView(e.extras);card.addView(e.mistakeFields);
 }
 private void setupGeneralTools(){
  final Button answer=findButton(e.generalFields,"선택한 전체");
  final Button cloze=findButton(e.generalFields,"가림 문구");
  final Button paste=findButton(e.generalFields,"그림 붙여넣기");
  final Button manage=findButton(e.generalFields,"본문 그림");
  detach(answer);detach(cloze);detach(paste);detach(manage);
  for(View v:children(e.generalFields))if(v instanceof TextView&&!(v instanceof EditText)&&!(v instanceof Button)&&((TextView)v).getText().toString().startsWith("답은 파랑"))detach(v);
  LinearLayout tools=row();
  final Button picture=button("＋ 그림 ▾",EditorPalette.IMAGE,new Runnable(){public void run(){}});
  picture.setOnClickListener(new View.OnClickListener(){public void onClick(View v){
   PopupMenu menu=new PopupMenu(a,picture);menu.getMenu().add(0,1,0,"복사한 그림 붙여넣기");menu.getMenu().add(0,2,1,"갤러리에서 가져오기");menu.getMenu().add(0,3,2,"본문 그림 가림 · 삭제");
   menu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener(){public boolean onMenuItemClick(MenuItem item){
    if(item.getItemId()==1&&paste!=null)paste.performClick();else if(item.getItemId()==2){if(e.images.getParent() instanceof View)((View)e.images.getParent()).setVisibility(View.VISIBLE);a.chooseImages();}else if(item.getItemId()==3&&manage!=null)manage.performClick();return true;
   }});menu.show();
  }});
  if(answer!=null){answer.setText("답 지정");color(answer,EditorPalette.ANSWER);weighted(tools,answer);}
  if(cloze!=null){cloze.setText("문구 가리기");color(cloze,EditorPalette.CLOZE);weighted(tools,cloze);}
  weighted(tools,picture);e.generalFields.addView(tools);
 }
 private void setupCardTools(){
  Button question=findButton(e.extras,"문제의 가릴"),answer=findButton(e.extras,"정답의 가릴");
  if(question!=null){question.setText("문제 문구 가리기");color(question,EditorPalette.CLOZE);}
  if(answer!=null){answer.setText("정답 문구 가리기");color(answer,EditorPalette.CLOZE);}
  for(View v:children(e.extras))if(v instanceof TextView&&!(v instanceof EditText)&&!(v instanceof Button)&&((TextView)v).getText().toString().startsWith("복습할 때는"))detach(v);
 }
 private void foldField(final EditText field,String title,int role){
  LinearLayout parent=(LinearLayout)field.getParent();int index=parent.indexOfChild(field);
  View label=index>0?parent.getChildAt(index-1):null;
  if(label instanceof TextView&&!(label instanceof EditText)){parent.removeView(label);index--;}
  detach(field);
  final LinearLayout box=column();
  final Button toggle=button(title,role,new Runnable(){public void run(){}});
  final String name=title;
  final boolean open=EditorPalette.initiallyOpen(field.getText());
  field.setVisibility(open?View.VISIBLE:View.GONE);toggle.setText(name+(open?"  ▾":"  ▸"));
  toggle.setOnClickListener(new View.OnClickListener(){public void onClick(View v){boolean show=field.getVisibility()!=View.VISIBLE;field.setVisibility(show?View.VISIBLE:View.GONE);toggle.setText(name+(show?"  ▾":"  ▸"));}});
  box.addView(toggle,new LinearLayout.LayoutParams(-1,-2));box.addView(field,new LinearLayout.LayoutParams(-1,-2));
  LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(-1,-2);lp.setMargins(0,dp(10),0,0);parent.addView(box,index,lp);
 }
}
