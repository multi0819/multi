package kr.memorynotes;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.*;
import android.widget.*;
import java.util.ArrayList;
public final class ThicknessControl {
 private static final String TAG="ink:thickness";
 private static final String KEY="ink_thickness";
 public static void attach(final InkPage ink){
  final MainActivity a=ink.a;final Ui u=a.u;final LinearLayout toolbar=(LinearLayout)a.root.getChildAt(1);
  if(toolbar.findViewWithTag(TAG)!=null)return;
  removeLegacy(toolbar);
  final boolean dark=a.getPreferences(0).getBoolean("dark",false);
  final int fg=EditorPalette.foreground(dark,EditorPalette.NEUTRAL);
  LinearLayout row=new LinearLayout(a);row.setOrientation(LinearLayout.HORIZONTAL);row.setGravity(Gravity.CENTER_VERTICAL);row.setPadding(u.dp(10),u.dp(2),u.dp(10),u.dp(2));
  GradientDrawable bg=new GradientDrawable();bg.setColor(EditorPalette.background(dark,EditorPalette.NEUTRAL));bg.setCornerRadius(u.dp(16));row.setBackground(bg);
  TextView title=u.text("굵기",12,fg);row.addView(title,new LinearLayout.LayoutParams(u.dp(38),-2));
  final SeekBar slider=new SeekBar(a);slider.setTag(TAG);slider.setMax(59);slider.setContentDescription("펜 굵기 조절");slider.setProgressTintList(ColorStateList.valueOf(u.green));slider.setThumbTintList(ColorStateList.valueOf(u.green));
  final TextView value=u.text("",13,fg);value.setGravity(Gravity.CENTER);value.setTypeface(null,Typeface.BOLD);
  Button minus=button(a,"−",fg),plus=button(a,"＋",fg);minus.setContentDescription("펜 굵기 줄이기");plus.setContentDescription("펜 굵기 늘리기");
  row.addView(minus,new LinearLayout.LayoutParams(u.dp(44),u.dp(44)));row.addView(slider,new LinearLayout.LayoutParams(0,u.dp(44),1));row.addView(value,new LinearLayout.LayoutParams(u.dp(40),-2));row.addView(plus,new LinearLayout.LayoutParams(u.dp(44),u.dp(44)));
  slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){}public void onProgressChanged(SeekBar s,int n,boolean user){ink.thickness=WidthPolicy.width(n);value.setText(WidthPolicy.label(n));s.setContentDescription("펜 굵기 "+WidthPolicy.label(n));a.getPreferences(0).edit().putFloat(KEY,ink.thickness).apply();}});
  int initial=WidthPolicy.progress(a.getPreferences(0).getFloat(KEY,ink.thickness));slider.setProgress(initial);ink.thickness=WidthPolicy.width(initial);value.setText(WidthPolicy.label(initial));
  minus.setOnClickListener(new View.OnClickListener(){public void onClick(View v){slider.setProgress(Math.max(0,slider.getProgress()-1));}});plus.setOnClickListener(new View.OnClickListener(){public void onClick(View v){slider.setProgress(Math.min(59,slider.getProgress()+1));}});
  LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(-1,-2);lp.setMargins(0,u.dp(4),0,0);toolbar.addView(row,lp);
 }
 private static Button button(MainActivity a,String s,int color){Button b=new Button(a);b.setText(s);b.setTextSize(20);b.setTextColor(color);b.setAllCaps(false);b.setBackgroundTintList(null);b.setBackgroundColor(0x00000000);b.setMinimumWidth(0);b.setMinWidth(0);b.setPadding(0,0,0,0);b.setFocusable(false);return b;}
 private static void removeLegacy(ViewGroup parent){
  ArrayList<View> views=new ArrayList<View>();for(int i=0;i<parent.getChildCount();i++)views.add(parent.getChildAt(i));
  for(View v:views){String desc=v.getContentDescription()==null?"":v.getContentDescription().toString();if(desc.equals("펜 굵기와 추가 색상")||desc.equals("필기 추가 설정"))parent.removeView(v);else if(v instanceof ViewGroup)removeLegacy((ViewGroup)v);}
 }
 public static void show(InkPage ink){MainActivity a=ink.a;View toolbar=a.root.getChildAt(1);toolbar.setVisibility(View.VISIBLE);View slider=toolbar.findViewWithTag(TAG);if(slider!=null)slider.requestFocus();}
}
