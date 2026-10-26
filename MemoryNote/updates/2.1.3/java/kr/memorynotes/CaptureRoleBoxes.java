package kr.memorynotes;
import android.text.*;
import android.view.*;
import android.widget.*;
import java.util.ArrayList;
import java.util.List;

/** A presentation-only grouping of the existing renderer output, including its live masks. */
public final class CaptureRoleBoxes {
 private final MainActivity a;
 private final LinearLayout field;
 private final TextView originalText;
 private boolean updating,pending;
 private CaptureRoleBoxes(MainActivity a,LinearLayout field,TextView text){this.a=a;this.field=field;originalText=text;}
 public static void apply(MainActivity a){
  View rendered=a.content.findViewWithTag("ink:body");
  if(rendered==null||!(rendered.getParent() instanceof LinearLayout))return;
  if(rendered instanceof LinearLayout&&"문제·지문·풀이 영역".equals(((LinearLayout)rendered).getContentDescription()))return;
  if(!containsHeading(rendered))return;
  LinearLayout field;TextView original=null;
  if(rendered instanceof LinearLayout)field=(LinearLayout)rendered;
  else if(rendered instanceof TextView){
   original=(TextView)rendered;LinearLayout parent=(LinearLayout)rendered.getParent();int index=parent.indexOfChild(rendered);
   ViewGroup.LayoutParams lp=rendered.getLayoutParams();parent.removeView(rendered);field=a.u.col();field.setTag("ink:body");rendered.setTag(null);parent.addView(field,index,lp);field.addView(rendered);
  }else return;
  // Drop only the previous standard '내용' section shell, retaining the ink anchor itself.
  unwrapContentSection(field);
  field.setContentDescription("문제·지문·풀이 영역");
  final CaptureRoleBoxes boxes=new CaptureRoleBoxes(a,field,original);
  if(original!=null)original.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int st,int c,int after){}public void onTextChanged(CharSequence s,int st,int before,int count){boxes.schedule();}public void afterTextChanged(Editable e){}});
  else field.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener(){public void onChildViewAdded(View p,View c){boxes.schedule();}public void onChildViewRemoved(View p,View c){boxes.schedule();}});
  boxes.group();
 }
 private static boolean containsHeading(View v){
  if(v instanceof TextView)return CaptureRoleParts.hasHeading(((TextView)v).getText());
  if(v instanceof ViewGroup){ViewGroup p=(ViewGroup)v;for(int i=0;i<p.getChildCount();i++)if(containsHeading(p.getChildAt(i)))return true;}
  return false;
 }
 private static void unwrapContentSection(LinearLayout field){
  if(!(field.getParent() instanceof LinearLayout))return;LinearLayout body=(LinearLayout)field.getParent();
  if(body.getChildCount()!=1||!(body.getParent() instanceof LinearLayout))return;
  LinearLayout outer=(LinearLayout)body.getParent();if(outer.getChildCount()!=3||outer.getChildAt(2)!=body||!(outer.getParent() instanceof LinearLayout))return;
  View heading=outer.getChildAt(0);if(!(heading instanceof ViewGroup))return;ViewGroup header=(ViewGroup)heading;
  if(header.getChildCount()!=1||!(header.getChildAt(0) instanceof TextView)||!"내용".contentEquals(((TextView)header.getChildAt(0)).getText()))return;
  LinearLayout parent=(LinearLayout)outer.getParent();int index=parent.indexOfChild(outer);ViewGroup.LayoutParams lp=outer.getLayoutParams();body.removeView(field);parent.removeView(outer);parent.addView(field,index,lp);
 }
 private void schedule(){if(updating||pending)return;pending=true;field.post(new Runnable(){public void run(){pending=false;if(field.getParent()!=null)group();}});}
 private void group(){
  if(updating)return;updating=true;
  try{
   ArrayList<View> rendered=new ArrayList<View>();
   if(originalText!=null)rendered.add(originalText);else for(int i=0;i<field.getChildCount();i++)rendered.add(field.getChildAt(i));
   // A renderer callback first removes every section, then supplies fresh flat children.
   if(originalText==null){for(View v:rendered)if("capture:box".equals(v.getTag()))return;}
   final CharSequence text=originalText==null?null:new SpannableString(originalText.getText());
   field.removeAllViews();int role=-1;LinearLayout section=null;
   for(View v:rendered){
    if(v.getParent() instanceof ViewGroup)((ViewGroup)v.getParent()).removeView(v);
    if(v instanceof TextView){
     TextView source=(TextView)v;CharSequence value=source==originalText?text:source.getText();List<CaptureRoleParts.Part> parts=CaptureRoleParts.split(value,role);boolean reused=false;
     for(CaptureRoleParts.Part part:parts){
      if(part.start==part.end){if(part.role!=role||section==null){role=part.role;section=section(role);}continue;}
      CharSequence slice=value.subSequence(part.start,part.end);if(slice.toString().trim().isEmpty())continue;
      if(part.role!=role||section==null){role=part.role;section=section(role);}
      TextView target;if(!reused){target=source;reused=true;}else{target=a.u.text("",18,a.u.ink);target.setMovementMethod(source.getMovementMethod());target.setTextIsSelectable(source.isTextSelectable());}
      target.setText(new SpannableString(slice),TextView.BufferType.SPANNABLE);target.setTextSize(18*a.u.scale);section.addView(target,new LinearLayout.LayoutParams(-1,-2));
     }
     // The original TextView remains attached as the owner of live cloze callbacks.
     if(source==originalText&&!reused){if(section==null)section=section(role);source.setText("");section.addView(source);}
    }else{if(section==null)section=section(role);section.addView(v,new LinearLayout.LayoutParams(-1,-2));}
   }
  }finally{updating=false;}
 }
 private LinearLayout section(int role){LinearLayout body=a.u.section(field,CaptureRoleParts.title(role),role==2?1:role==1?3:0);((View)body.getParent()).setTag("capture:box");return body;}
}
