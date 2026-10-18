package kr.memorynotes;
import android.app.*;import android.content.*;import android.graphics.Color;import android.graphics.Typeface;import android.graphics.drawable.GradientDrawable;import android.view.*;import android.widget.*;
public final class Ui {
 public final Activity a;public final int bg,surface,ink,muted,green,line;public final float scale;
 public Ui(Activity a){this.a=a;boolean dark=a.getPreferences(0).getBoolean("dark",false);bg=Color.parseColor(dark?"#121C19":"#F5F7F3");surface=Color.parseColor(dark?"#1F2D27":"#FFFFFF");ink=Color.parseColor(dark?"#EEF6F1":"#203B32");muted=Color.parseColor(dark?"#AEC1B5":"#74867B");green=Color.parseColor(dark?"#76CFAB":"#257967");line=Color.parseColor(dark?"#36473F":"#DBE5DC");scale=a.getPreferences(0).getFloat("font",1f);}
 public int dp(float n){return (int)(n*a.getResources().getDisplayMetrics().density+.5f);}
 public LinearLayout col(){LinearLayout l=new LinearLayout(a);l.setOrientation(1);return l;}
 public LinearLayout row(){LinearLayout l=new LinearLayout(a);l.setOrientation(0);l.setGravity(Gravity.CENTER_VERTICAL);return l;}
 public GradientDrawable shape(int color,int radius){GradientDrawable g=new GradientDrawable();g.setColor(color);g.setCornerRadius(dp(radius));return g;}
 public TextView text(String s,int size,int color){TextView t=new TextView(a);t.setText(s);t.setTextColor(color);t.setTextSize(size*scale);t.setLineSpacing(dp(3),1);return t;}
 public TextView title(String s){TextView t=text(s,27,ink);t.setTypeface(null,Typeface.BOLD);t.setPadding(0,dp(8),0,dp(10));return t;}
 public void gap(LinearLayout l,int h){View v=new View(a);l.addView(v,new LinearLayout.LayoutParams(1,dp(h)));}
 public LinearLayout card(LinearLayout parent){LinearLayout c=col();c.setPadding(dp(18),dp(16),dp(18),dp(16));c.setBackground(shape(surface,18));LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(-1,-2);p.setMargins(0,dp(5),0,dp(7));parent.addView(c,p);return c;}
 public Button button(String s,Runnable f){Button b=new Button(a);b.setAllCaps(false);b.setText(s);b.setTextSize(15*scale);b.setTextColor(green);b.setMinHeight(dp(48));b.setBackgroundTintList(android.content.res.ColorStateList.valueOf(surface));b.setOnClickListener(v->f.run());return b;}
 public Button primary(String s,Runnable f){Button b=button(s,f);b.setTextColor(bg);b.setBackgroundTintList(android.content.res.ColorStateList.valueOf(green));return b;}
 public void weighted(LinearLayout row,View v){row.addView(v,new LinearLayout.LayoutParams(0,-2,1));}
 public EditText edit(LinearLayout p,String label,String value,int lines){p.addView(text(label,13,muted));EditText e=new EditText(a);e.setTextColor(ink);e.setHintTextColor(muted);e.setTextSize(16*scale);e.setText(value);e.setGravity(Gravity.TOP);e.setMinLines(lines);e.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE|android.text.InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);e.setPadding(dp(8),dp(8),dp(8),dp(8));p.addView(e,new LinearLayout.LayoutParams(-1,-2));gap(p,10);return e;}
 public Spinner spinner(LinearLayout p,String label,String[] values,int selected){if(!label.isEmpty())p.addView(text(label,13,muted));Spinner s=new Spinner(a);ArrayAdapter<String> adapter=new ArrayAdapter<String>(a,android.R.layout.simple_spinner_item,values){public View getView(int pos,View old,ViewGroup parent){TextView t=(TextView)super.getView(pos,old,parent);t.setTextColor(ink);t.setTextSize(16*scale);t.setPadding(dp(8),dp(14),dp(8),dp(14));return t;}};adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);s.setAdapter(adapter);s.setSelection(Math.max(0,selected));p.addView(s,new LinearLayout.LayoutParams(-1,-2));return s;}
 public void confirm(String title,String message,Runnable yes){new AlertDialog.Builder(a).setTitle(title).setMessage(message).setNegativeButton("취소",null).setPositiveButton("확인",(d,w)->yes.run()).show();}
 public void message(String message){new AlertDialog.Builder(a).setMessage(message).setPositiveButton("확인",null).show();}
}
