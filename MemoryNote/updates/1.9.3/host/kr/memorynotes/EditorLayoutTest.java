package kr.memorynotes;
import android.view.*;import android.widget.*;
public class EditorLayoutTest {
 static int save,answer,cloze,paste,manage,pen,text;
 static LinearLayout col(MainActivity a){return new LinearLayout(a);}
 static void check(boolean b,String m){if(!b)throw new AssertionError(m);}
 static Button find(View v,String s){if(v instanceof Button&&((Button)v).getText().toString().equals(s))return (Button)v;if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++){Button b=find(g.getChildAt(i),s);if(b!=null)return b;}}return null;}
 static EditText field(MainActivity a,LinearLayout p,String title,String value){p.addView(a.u.text(title,13,0));EditText e=new EditText(a);e.setText(value);p.addView(e);return e;}
 static NoteEditor fixture(boolean dark,boolean existing,int selected){
  MainActivity a=new MainActivity();a.prefs.dark=dark;a.u=new Ui(a);a.root=col(a);a.content=col(a);
  a.root.addView(col(a));LinearLayout toolbar=col(a);a.root.addView(toolbar);a.root.addView(a.content);
  Button p=a.u.button("pen",new Runnable(){public void run(){pen++;}});p.setContentDescription("펜");toolbar.addView(p);
  Button t=a.u.button("text",new Runnable(){public void run(){text++;}});t.setContentDescription("텍스트 선택 모드");toolbar.addView(t);
  NoteEditor e=new NoteEditor();e.a=a;e.note=new Note();LinearLayout card=col(a);a.content.addView(card);
  e.subject=new Spinner(a);e.chapter=new Spinner(a);e.type=new Spinner(a);e.type.setSelection(selected);
  card.addView(e.subject);card.addView(e.chapter);card.addView(e.type);
  e.generalFields=col(a);card.addView(e.generalFields);e.title=field(a,e.generalFields,"제목","냉동 사이클");e.body=field(a,e.generalFields,"내용","[[답]] {{문구}} 그림 내용");
  e.generalFields.addView(a.u.button("선택한 전체 블록을 답으로 지정",new Runnable(){public void run(){answer++;}}));
  e.generalFields.addView(a.u.button("가림 문구 여러 개 설정",new Runnable(){public void run(){cloze++;}}));
  e.generalFields.addView(a.u.button("그림 붙여넣기",new Runnable(){public void run(){paste++;}}));
  e.generalFields.addView(a.u.button("본문 그림 확대 · 가림 · 삭제",new Runnable(){public void run(){manage++;}}));
  e.extras=col(a);card.addView(e.extras);e.question=field(a,e.extras,"문제","질문");e.answer=field(a,e.extras,"답","정답");
  e.extras.addView(a.u.button("문제의 가릴 단어 선택",new Runnable(){public void run(){cloze++;}}));e.extras.addView(a.u.button("정답의 가릴 단어 선택",new Runnable(){public void run(){cloze++;}}));
  e.mistakeFields=col(a);card.addView(e.mistakeFields);e.reason=field(a,e.mistakeFields,"틀린 점",existing?"단위 실수":"");e.caution=field(a,e.mistakeFields,"주의",existing?"분모 효율":"");
  LinearLayout opt=col(a);a.content.addView(opt);e.images=col(a);opt.addView(e.images);opt.addView(a.u.button("사진 · 태그 · 즐겨찾기  ▾",new Runnable(){public void run(){}}));
  a.content.addView(a.u.button("노트 저장",new Runnable(){public void run(){save++;}}));a.content.addView(a.u.button("작성 취소",new Runnable(){public void run(){}}));return e;
 }
 public static void main(String[] args){
  for(boolean dark:new boolean[]{false,true})for(boolean existing:new boolean[]{false,true})for(int type=0;type<3;type++){
   NoteEditor e=fixture(dark,existing,type);EditText original=e.body;String body=e.body.getText().toString();EditorLayout.attach(e);
   check(e.body==original&&body.equals(e.body.getText().toString()),"content was replaced");
   check(e.type.getSelectedItemPosition()==type&&e.type.getVisibility()==View.GONE,"type lost");
   check(e.a.root.getChildAt(1).getVisibility()==View.GONE,"pen toolbar not folded");
   check(e.reason.getVisibility()==(existing?View.VISIBLE:View.GONE),"existing mistake hidden");
   check(e.caution.getVisibility()==(existing?View.VISIBLE:View.GONE),"existing caution hidden");
   find(e.a.root,"틀린 점"+(existing?"  ▾":"  ▸")).performClick();check(e.reason.getVisibility()==(existing?View.GONE:View.VISIBLE),"fold action failed");
   find(e.a.root,"저장").performClick();find(e.a.root,"‹").performClick();check(e.leaves==1,"back does not use draft flow");
   find(e.a.root,"필기 ▾").performClick();check(e.a.root.getChildAt(1).getVisibility()==View.VISIBLE,"pen not opened");find(e.a.root,"필기 ▾").performClick();
   find(e.a.root,"문답").performClick();check(e.type.getSelectedItemPosition()==1,"type choice not delegated");check(e.switches==1&&e.activeType.equals("문답 카드"),"hidden spinner did not dispatch type change");
   find(e.a.root,"답 지정").performClick();find(e.a.root,"문구 가리기").performClick();
   find(e.a.root,"＋ 그림 ▾").performClick();PopupMenu.last.select(1);PopupMenu.last.select(2);PopupMenu.last.select(3);check(e.a.gallery==1,"gallery route failed");
   check(e.body.minLines==10&&e.answer.minLines==7,"writing area not enlarged");
  }
  check(save==12&&answer==12&&cloze==12&&paste==12&&manage==12&&pen==12&&text==24,"original callbacks not preserved");
  System.out.println("EditorLayoutTest: 12 theme/existing-note/type scenarios passed; content, callbacks, type selection, folds and pen controls preserved");
 }
}
