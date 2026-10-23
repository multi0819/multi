package kr.memorynotes;
import android.graphics.*;import android.graphics.drawable.*;import android.content.res.ColorStateList;import android.view.*;import android.widget.*;import java.util.*;
/** Compact review controls. Reparents the original buttons so callbacks are retained. */
public final class ReviewLayout {
 static int accent(int kind,boolean dark){int[] light={0xFF49647F,0xFF166E66,0xFF9C3F38,0xFF805700,0xFF247349,0xFF596270};int[] night={0xFFA8C4E2,0xFF91D6C9,0xFFFFAAA3,0xFFF2CF80,0xFF9DDBB6,0xFFBDC5D0};return (dark?night:light)[kind];}
 static int blend(int base,int tint){return Color.rgb((Color.red(base)*9+Color.red(tint))/10,(Color.green(base)*9+Color.green(tint))/10,(Color.blue(base)*9+Color.blue(tint))/10);}
 static String ratingText(String text){return text.replace(" · 내일 다시","\n내일").replace(" · 3일 뒤","\n3일 뒤").replace(" · ","\n");}
 static Button back(View v){if(v instanceof Button&&((Button)v).getText().toString().contains("돌아가기"))return (Button)v;if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++){Button b=back(g.getChildAt(i));if(b!=null)return b;}}return null;}
 static void detach(View v){if(v.getParent() instanceof ViewGroup)((ViewGroup)v.getParent()).removeView(v);}
 static void style(MainActivity a,Button b,int kind,String icon,boolean tile,boolean dark){
  int color=accent(kind,dark),base=a.u.bg,dp=a.u.dp(1);b.setAllCaps(false);b.setTextSize(tile?14:15);b.setTextColor(color);b.setGravity(Gravity.CENTER);b.setMinWidth(0);b.setMinimumWidth(0);b.setMinHeight(a.u.dp(tile?92:48));b.setMinimumHeight(a.u.dp(tile?92:48));b.setPadding(a.u.dp(8),a.u.dp(8),a.u.dp(8),a.u.dp(8));b.setMaxLines(tile?3:2);
  GradientDrawable shape=new GradientDrawable();shape.setColor(blend(base,color));shape.setCornerRadius(a.u.dp(14));shape.setStroke(Math.max(1,dp),Color.argb(85,Color.red(color),Color.green(color),Color.blue(color)));
  b.setBackground(new RippleDrawable(ColorStateList.valueOf(Color.argb(55,Color.red(color),Color.green(color),Color.blue(color))),shape,null));
  Symbol drawable=new Symbol(icon,color,a.u.dp(22));b.setCompoundDrawablePadding(a.u.dp(5));if(tile)b.setCompoundDrawables(null,drawable,null,null);else b.setCompoundDrawables(drawable,null,null,null);b.setContentDescription(b.getText().toString().replace('\n',' '));
 }
 static LinearLayout row(MainActivity a){LinearLayout r=new LinearLayout(a);r.setOrientation(LinearLayout.HORIZONTAL);r.setGravity(Gravity.CENTER_VERTICAL);return r;}
 static void put(MainActivity a,LinearLayout row,Button b,float weight,int width){detach(b);LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(width,-2,weight);p.setMargins(a.u.dp(3),a.u.dp(4),a.u.dp(3),a.u.dp(4));row.addView(b,p);}
 public static void apply(MainActivity a){
  boolean dark=a.getPreferences(0).getBoolean("dark",false);Button edit=null,action=null,skip=null;ArrayList<Button> ratings=new ArrayList<>();TextView heading=null;
  for(int i=0;i<a.content.getChildCount();i++){View v=a.content.getChildAt(i);if(v instanceof Button){Button b=(Button)v;String t=b.getText().toString();if(t.equals("노트 수정"))edit=b;else if(t.equals("이번에는 건너뛰기"))skip=b;else if(t.startsWith("모름 ·")||t.startsWith("헷갈림 ·")||t.startsWith("외웠음 ·"))ratings.add(b);else if(t.equals("정답 확인")||t.equals("가린 문구 확인")||t.equals("다시 가리기"))action=b;}else if(v instanceof TextView&&((TextView)v).getText().toString().equals("얼마나 기억했나요?"))heading=(TextView)v;}
  Button back=back(a.root);
  if(back!=null&&edit!=null&&back.getParent() instanceof LinearLayout){LinearLayout parent=(LinearLayout)back.getParent();int index=parent.indexOfChild(back);LinearLayout header=row(a);back.setText("뒤로");edit.setText("수정");style(a,back,5,"back",false,dark);style(a,edit,0,"edit",false,dark);put(a,header,back,1,0);put(a,header,edit,0,a.u.dp(90));parent.addView(header,index,new LinearLayout.LayoutParams(-1,-2));}
  else if(edit!=null){edit.setText("수정");style(a,edit,0,"edit",false,dark);}
  if(heading!=null)detach(heading);
  if(action!=null||skip!=null){LinearLayout actions=row(a);if(action!=null){style(a,action,1,action.getText().toString().equals("다시 가리기")?"hide":"eye",false,dark);put(a,actions,action,1,0);}if(skip!=null){skip.setText("건너뛰기");style(a,skip,5,"skip",false,dark);put(a,actions,skip,0,a.u.dp(112));}a.content.addView(actions,new LinearLayout.LayoutParams(-1,-2));}
  if(!ratings.isEmpty()){LinearLayout r=row(a);for(int i=0;i<ratings.size();i++){Button b=ratings.get(i);b.setText(ratingText(b.getText().toString()));style(a,b,i+2,new String[]{"retry","unsure","check"}[i],true,dark);put(a,r,b,1,0);}a.content.addView(r,new LinearLayout.LayoutParams(-1,-2));}
 }
 static final class Symbol extends Drawable {
  final String kind;final int color,size;final Paint p=new Paint(3);Symbol(String k,int c,int s){kind=k;color=c;size=s;setBounds(0,0,s,s);}
  public void draw(Canvas canvas){canvas.save();canvas.translate(getBounds().left,getBounds().top);canvas.scale(getBounds().width()/24f,getBounds().height()/24f);p.setColor(color);p.setStrokeWidth(1.8f);p.setStrokeCap(Paint.Cap.ROUND);p.setStrokeJoin(Paint.Join.ROUND);p.setStyle(Paint.Style.STROKE);Path path=new Path();
   if(kind.equals("check")){path.moveTo(5,12);path.lineTo(10,17);path.lineTo(20,7);}
   else if(kind.equals("back")){path.moveTo(15,5);path.lineTo(8,12);path.lineTo(15,19);}
   else if(kind.equals("edit")){path.moveTo(5,16);path.lineTo(16,5);path.lineTo(20,9);path.lineTo(9,20);path.lineTo(4,21);path.close();canvas.drawLine(13,8,17,12,p);}
   else if(kind.equals("skip")){path.moveTo(5,5);path.lineTo(15,12);path.lineTo(5,19);path.close();canvas.drawLine(19,5,19,19,p);}
   else if(kind.equals("retry")){canvas.drawArc(4,4,20,20,215,285,false,p);path.moveTo(4,4);path.lineTo(4,10);path.lineTo(10,10);}
   else if(kind.equals("unsure")){canvas.drawCircle(12,12,9,p);canvas.drawLine(12,6,12,13,p);canvas.drawPoint(12,17,p);}
   else{path.moveTo(2,12);path.cubicTo(7,3,17,3,22,12);path.cubicTo(17,21,7,21,2,12);canvas.drawCircle(12,12,3,p);if(kind.equals("hide"))canvas.drawLine(3,3,21,21,p);}
   canvas.drawPath(path,p);canvas.restore();}
  public void setAlpha(int a){p.setAlpha(a);}public void setColorFilter(ColorFilter f){p.setColorFilter(f);}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
 }
}
