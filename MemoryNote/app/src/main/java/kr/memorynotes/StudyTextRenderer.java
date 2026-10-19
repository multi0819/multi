package kr.memorynotes;

import android.graphics.Typeface;
import android.text.*;
import android.text.method.LinkMovementMethod;
import android.text.style.*;
import android.view.View;
import android.widget.*;
import java.util.*;

/** One consistent palette for reading, review and the editor. */
final class StudyTextRenderer {
 static TextView create(Ui u,String source,int size,boolean answer,boolean masked){
  TextView view=u.text("",size,u.ink);Set<Integer> opened=new HashSet<>();
  render(u,view,source,answer,masked,opened);InlineImages.bind(u,view,masked);return view;
 }
 private static void render(Ui u,TextView view,String source,boolean answer,boolean masked,Set<Integer> opened){
  SpannableStringBuilder text=new SpannableStringBuilder();
  for(StudyText.Part part:StudyText.parts(source,false,answer)){
   boolean conceal=masked&&part.kind==StudyText.CLOZE&&!opened.contains(part.sourceStart);
   int start=text.length();text.append(conceal?"[•••]":part.text);int end=text.length();
   int color=part.kind==StudyText.CLOZE?u.clozeColor:part.kind==StudyText.ANSWER?u.answerColor:u.ink;
   text.setSpan(new ForegroundColorSpan(color),start,end,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
   if(part.kind==StudyText.CLOZE){
    text.setSpan(new StyleSpan(Typeface.BOLD),start,end,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    if(conceal){text.setSpan(new BackgroundColorSpan(u.clozeTint),start,end,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
     text.setSpan(new ClickableSpan(){public void onClick(View v){opened.add(part.sourceStart);render(u,view,source,answer,masked,opened);}public void updateDrawState(TextPaint p){p.setColor(u.clozeColor);p.setUnderlineText(false);}},start,end,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);}
   }
  }
  view.setText(text,TextView.BufferType.SPANNABLE);InlineImages.apply(u,view,(Spannable)view.getText(),masked);if(masked)view.setMovementMethod(LinkMovementMethod.getInstance());
 }
 static void editor(Ui u,EditText e,boolean defaultAnswer){
  Runnable paint=()->{
   Editable text=e.getText();for(ForegroundColorSpan span:text.getSpans(0,text.length(),ForegroundColorSpan.class))text.removeSpan(span);
   for(StyleSpan span:text.getSpans(0,text.length(),StyleSpan.class))text.removeSpan(span);
   if(text.length()>0)text.setSpan(new ForegroundColorSpan(u.ink),0,text.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
   for(StudyText.Part part:StudyText.parts(text.toString(),false,defaultAnswer)){
    if(part.sourceStart==part.sourceEnd)continue;
    text.setSpan(new ForegroundColorSpan(part.kind==StudyText.CLOZE?u.clozeColor:part.kind==StudyText.ANSWER?u.answerColor:u.ink),part.sourceStart,part.sourceEnd,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    if(part.kind==StudyText.CLOZE)text.setSpan(new StyleSpan(Typeface.BOLD),part.sourceStart,part.sourceEnd,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
   }
   InlineImages.apply(u,e,text,false);
  };
  InlineImages.bind(u,e,false);
  e.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int st,int c,int a){}public void onTextChanged(CharSequence s,int st,int b,int c){}public void afterTextChanged(Editable text){paint.run();}});paint.run();
 }
}
