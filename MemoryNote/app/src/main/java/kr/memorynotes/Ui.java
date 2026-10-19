package kr.memorynotes;
import android.app.*;import android.content.*;import android.graphics.Color;import android.graphics.Typeface;import android.graphics.drawable.GradientDrawable;import android.view.*;import android.widget.*;
public final class Ui {
 public final Activity a;public final int bg,surface,ink,muted,green,line,answerColor,clozeColor,clozeTint;public final float scale;
 public Ui(Activity a){this.a=a;boolean dark=a.getPreferences(0).getBoolean("dark",false);bg=Color.parseColor(dark?"#121C19":"#F5F7F3");surface=Color.parseColor(dark?"#1F2D27":"#FFFFFF");ink=Color.parseColor(dark?"#EEF6F1":"#203B32");muted=Color.parseColor(dark?"#AEC1B5":"#74867B");green=Color.parseColor(dark?"#76CFAB":"#257967");line=Color.parseColor(dark?"#36473F":"#DBE5DC");answerColor=Color.parseColor(dark?"#8ABEFF":"#195CAC");clozeColor=Color.parseColor(dark?"#FFBF75":"#A64900");clozeTint=Color.parseColor(dark?"#49341E":"#FFF0DB");scale=a.getPreferences(0).getFloat("font",1f);}
 public int dp(float n){return (int)(n*a.getResources().getDisplayMetrics().density+.5f);}
 public LinearLayout col(){LinearLayout l=new LinearLayout(a);l.setOrientation(LinearLayout.VERTICAL);return l;}
 public LinearLayout row(){LinearLayout l=new LinearLayout(a);l.setOrientation(LinearLayout.HORIZONTAL);l.setGravity(Gravity.CENTER_VERTICAL);return l;}
 public GradientDrawable shape(int color,int radius){GradientDrawable g=new GradientDrawable();g.setColor(color);g.setCornerRadius(dp(radius));return g;}
 public TextView text(String s,int size,int color){TextView t=new TextView(a);t.setText(s);t.setTextColor(color);t.setTextSize(size*scale);t.setLineSpacing(dp(3),1);return t;}
 public TextView study(String source,int size,boolean answer,boolean masked){return StudyTextRenderer.create(this,source,size,answer,masked);}
 public void studyEditor(EditText e,boolean answer){StudyTextRenderer.editor(this,e,answer);}
 public LinearLayout studyLegend(){LinearLayout legend=col();legend.addView(text("제목·문제",12,ink));legend.addView(text("답 전체  ·  파랑",12,answerColor));legend.addView(text("가림 문구  ·  주황",12,clozeColor));return legend;}
 public TextView title(String s){TextView t=text(s,27,ink);t.setTypeface(null,Typeface.BOLD);t.setPadding(0,dp(8),0,dp(10));return t;}
 public void gap(LinearLayout l,int h){View v=new View(a);l.addView(v,new LinearLayout.LayoutParams(1,dp(h)));}
 public LinearLayout card(LinearLayout parent){LinearLayout c=col();c.setPadding(dp(18),dp(16),dp(18),dp(16));c.setBackground(shape(surface,18));LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(-1,-2);p.setMargins(0,dp(5),0,dp(7));parent.addView(c,p);return c;}
 public LinearLayout section(LinearLayout parent,String label,int kind){
  boolean dark=a.getPreferences(0).getBoolean("dark",false);
  String[] light={"#195CAC","#B12B35","#935000","#596775"};
  String[] night={"#8ABEFF","#FF9DA7","#FFBF75","#BDCBD8"};
  int accent=Color.parseColor((dark?night:light)[kind]);
  LinearLayout box=col();GradientDrawable border=shape(surface,14);border.setStroke(dp(2),accent);box.setBackground(border);
  LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-1,-2);params.setMargins(0,dp(5),0,dp(12));parent.addView(box,params);
  LinearLayout header=col();header.setPadding(dp(16),dp(12),dp(16),dp(12));
  header.setBackgroundColor((accent&0x00FFFFFF)|(dark?0x24000000:0x10000000));
  TextView title=text(label,16,accent);title.setTypeface(null,Typeface.BOLD);header.addView(title);box.addView(header);
  View divider=new View(a);divider.setBackgroundColor(accent);box.addView(divider,new LinearLayout.LayoutParams(-1,dp(1)));
  LinearLayout body=col();body.setPadding(dp(16),dp(14),dp(16),dp(16));box.addView(body);return body;
 }
 private Button styledButton(String label,int foreground,int fill,int edge,Runnable action){
  Button b=new Button(a);b.setAllCaps(false);b.setText(label);b.setTextSize(15*scale);b.setTextColor(foreground);b.setMinHeight(dp(52));b.setPadding(dp(12),dp(10),dp(12),dp(10));
  android.graphics.drawable.StateListDrawable states=new android.graphics.drawable.StateListDrawable();
  GradientDrawable normal=shape(fill,12);normal.setStroke(dp(1),edge);
  GradientDrawable pressed=shape(edge,12);pressed.setStroke(dp(2),foreground);
  states.addState(new int[]{android.R.attr.state_pressed},pressed);states.addState(new int[]{},normal);b.setBackgroundTintList(null);b.setBackground(states);b.setOnClickListener(v->action.run());
  LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-1,-2);params.setMargins(0,dp(5),0,dp(5));b.setLayoutParams(params);return b;
 }
 public Button button(String s,Runnable f){boolean dark=a.getPreferences(0).getBoolean("dark",false);return styledButton(s,dark?Color.parseColor("#DAF7EA"):Color.parseColor("#20503D"),dark?Color.parseColor("#304F42"):Color.parseColor("#E4F0E9"),dark?Color.parseColor("#6F9C86"):Color.parseColor("#A5C5B2"),f);}
 public Button primary(String s,Runnable f){return styledButton(s,bg,green,green,f);}
 public Button answerButton(String s,Runnable f){boolean dark=a.getPreferences(0).getBoolean("dark",false);return styledButton(s,dark?Color.parseColor("#D5E8FF"):Color.parseColor("#154D8F"),dark?Color.parseColor("#29486A"):Color.parseColor("#E2EEFF"),answerColor,f);}
 public Button clozeButton(String s,Runnable f){boolean dark=a.getPreferences(0).getBoolean("dark",false);return styledButton(s,dark?Color.parseColor("#FFE3BC"):Color.parseColor("#853C00"),dark?Color.parseColor("#63441F"):Color.parseColor("#FFF0D9"),clozeColor,f);}
 public void weighted(LinearLayout row,View v){row.addView(v,new LinearLayout.LayoutParams(0,-2,1));}
 public EditText edit(LinearLayout p,String label,String value,int lines){p.addView(text(label,13,muted));EditText e=new EditText(a);e.setTextColor(ink);e.setHintTextColor(muted);e.setTextSize(16*scale);e.setText(value);e.setGravity(Gravity.TOP);e.setMinLines(lines);e.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE|android.text.InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);GradientDrawable field=shape(a.getPreferences(0).getBoolean("dark",false)?Color.parseColor("#172820"):Color.parseColor("#F4F8F5"),10);field.setStroke(dp(1),line);e.setBackground(field);e.setPadding(dp(12),dp(12),dp(12),dp(12));p.addView(e,new LinearLayout.LayoutParams(-1,-2));gap(p,10);return e;}
 public void setOptions(Spinner spinner,String[] values,int selected){
  ArrayAdapter<String> adapter=new ArrayAdapter<String>(a,android.R.layout.simple_spinner_item,values){
   private View item(String value,View recycled){
    TextView t=recycled instanceof TextView?(TextView)recycled:new TextView(a);
    t.setLayoutParams(new android.widget.AbsListView.LayoutParams(-1,-2));
    t.setText(value);t.setTextColor(ink);t.setTextSize(16*scale);
    t.setSingleLine(false);t.setMaxLines(Integer.MAX_VALUE);t.setEllipsize(null);
    t.setIncludeFontPadding(true);t.setGravity(Gravity.CENTER_VERTICAL);
    t.setMinHeight(dp(52));t.setPadding(dp(12),dp(12),dp(12),dp(12));
    t.setBackgroundColor(surface);return t;
   }
   public View getView(int pos,View old,ViewGroup parent){return item(getItem(pos),old);}
   public View getDropDownView(int pos,View old,ViewGroup parent){return item(getItem(pos),old);}
  };
  adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);spinner.setAdapter(adapter);spinner.setSelection(Math.max(0,selected));spinner.setPopupBackgroundDrawable(shape(surface,12));
  if(spinner.getBackground()!=null)spinner.getBackground().mutate().setTint(green);
 }
 public Spinner spinner(LinearLayout p,String label,String[] values,int selected){if(!label.isEmpty())p.addView(text(label,13,muted));Spinner spinner=new Spinner(a,Spinner.MODE_DROPDOWN);setOptions(spinner,values,selected);p.addView(spinner,new LinearLayout.LayoutParams(-1,-2));gap(p,10);return spinner;}
 public void confirm(String title,String message,Runnable yes){new AlertDialog.Builder(a).setTitle(title).setMessage(message).setNegativeButton("취소",null).setPositiveButton("확인",(d,w)->yes.run()).show();}
 public void message(String message){new AlertDialog.Builder(a).setMessage(message).setPositiveButton("확인",null).show();}
}
