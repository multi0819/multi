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
  SpannableStringBuilder text=format(u,source,answer,masked,opened,()->render(u,view,source,answer,masked,opened));
  view.setText(text,TextView.BufferType.SPANNABLE);InlineImages.apply(u,view,(Spannable)view.getText(),masked);if(masked)view.setMovementMethod(LinkMovementMethod.getInstance());
 }
 private static SpannableStringBuilder format(Ui u,String source,boolean answer,boolean masked,Set<Integer> opened,Runnable refresh){
  SpannableStringBuilder text=new SpannableStringBuilder();
  for(StudyText.Part part:StudyText.parts(source,false,answer)){
   boolean conceal=masked&&part.kind==StudyText.CLOZE&&!opened.contains(part.sourceStart);
   int start=text.length();text.append(conceal?"[•••]":part.text);int end=text.length();
   int color=part.kind==StudyText.CLOZE?u.clozeColor:part.kind==StudyText.ANSWER?u.answerColor:u.ink;
   text.setSpan(new ForegroundColorSpan(color),start,end,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
   if(part.kind==StudyText.CLOZE){
    text.setSpan(new StyleSpan(Typeface.BOLD),start,end,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    if(conceal){text.setSpan(new BackgroundColorSpan(u.clozeTint),start,end,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
     text.setSpan(new ClickableSpan(){public void onClick(View v){opened.add(part.sourceStart);refresh.run();}public void updateDrawState(TextPaint p){p.setColor(u.clozeColor);p.setUnderlineText(false);}},start,end,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);}
   }
  }
  return text;
 }
 /** Read-only content uses actual image views so image height participates in layout. */
 static View content(Ui u,String source,int size,boolean answer,boolean masked){
  if(InlineImageText.files(source).isEmpty())return create(u,source,size,answer,masked);
  LinearLayout document=u.col();Set<Integer> opened=new HashSet<>();Runnable[] rebuild=new Runnable[1];
  rebuild[0]=()->{
   document.removeAllViews();SpannableStringBuilder text=format(u,source,answer,masked,opened,()->rebuild[0].run());
   java.util.regex.Matcher matcher=InlineImageText.PATTERN.matcher(text);int from=0;
   while(matcher.find()){
    appendText(u,document,text.subSequence(from,matcher.start()),size);
    String file=matcher.group(1);org.json.JSONObject image=null;
    for(int i=0;i<u.pictures.length();i++){org.json.JSONObject item=u.pictures.optJSONObject(i);if(item!=null&&file.equals(item.optString("file"))){image=item;break;}}
    if(image==null){image=new org.json.JSONObject();try{image.put("file",file);image.put("masks",new org.json.JSONArray());}catch(org.json.JSONException ignored){}}
    final org.json.JSONObject selected=image;
    ImageMaskView picture=new ImageMaskView(u.a,image,masked,false);
    document.addView(picture,new LinearLayout.LayoutParams(-1,u.dp(280)));
    if(u.a instanceof MainActivity)document.addView(u.button("사진 확대",()->ImageMaskView.dialog((MainActivity)u.a,selected,false,()->{},masked)));
    from=matcher.end();
   }
   appendText(u,document,text.subSequence(from,text.length()),size);
  };
  rebuild[0].run();return document;
 }
 private static void appendText(Ui u,LinearLayout parent,CharSequence text,int size){
  if(text.length()==0)return;TextView view=u.text("",size,u.ink);view.setText(text,TextView.BufferType.SPANNABLE);view.setMovementMethod(LinkMovementMethod.getInstance());parent.addView(view,new LinearLayout.LayoutParams(-1,-2));
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
