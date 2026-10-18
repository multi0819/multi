package kr.memorynotes;
import android.app.*;import android.os.Bundle;import android.content.*;import android.graphics.*;import android.graphics.drawable.*;import android.view.*;import android.widget.*;import org.json.*;import java.io.*;

public class EditorSmokeRunner extends Instrumentation {
 int assertions; MainActivity activity; NoteDb db; JSONObject before;String originalDraft;
 void check(boolean value,String message){assertions++;if(!value)throw new AssertionError(message);}
 public void onCreate(Bundle args){super.onCreate(args);start();}
 void ui(Runnable action){runOnMainSync(action);waitForIdleSync();}
 void capture(String name)throws Exception{Bitmap image=getUiAutomation().takeScreenshot();if(image==null)throw new IOException("Screenshot unavailable");try(OutputStream out=new FileOutputStream(new File(getTargetContext().getExternalFilesDir(null),name))){image.compress(Bitmap.CompressFormat.PNG,100,out);}image.recycle();}
 public void onStart(){Bundle result=new Bundle();try{
  Context c=getTargetContext();db=new NoteDb(c);before=db.snapshot();
  Intent i=new Intent(c,MainActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);activity=(MainActivity)startActivitySync(i);waitForIdleSync();originalDraft=activity.getPreferences(0).getString("draft","");
  ui(()->{activity.getPreferences(0).edit().putBoolean("dark",true).remove("draft").commit();Note n=new Note();n.subject="hvac";n.title="왕복동 압축기의 용량제어 방법";n.body="회전수 {{가감법}}\n언로드법\n클리어런스 포켓 증가\n바이패스법";activity.openEditor(n);});
  ui(()->{NoteEditor e=activity.editor;check(e.generalFields.getVisibility()==View.VISIBLE,"general fields visible");check(e.extras.getVisibility()==View.GONE,"QA fields hidden in general");check(e.mistakeFields.getVisibility()==View.GONE,"mistake fields hidden in general");int[] a=new int[2],b=new int[2];e.type.getLocationOnScreen(a);e.title.getLocationOnScreen(b);check(a[1]<b[1],"title below note type");Button button=activity.u.button("contrast",()->{});GradientDrawable bg=(GradientDrawable)((StateListDrawable)button.getBackground()).getCurrent();check(bg.getColor().getDefaultColor()!=activity.u.surface,"button differs from card");TextView option=(TextView)e.chapter.getAdapter().getDropDownView(0,null,e.chapter);check(option.getCurrentTextColor()==activity.u.ink,"chapter option readable in dark mode");});capture("editor-general-dark.png");
  ui(()->activity.editor.type.setSelection(1));
  ui(()->{NoteEditor e=activity.editor;check(e.generalFields.getVisibility()==View.GONE,"QA hides entire title/body group");check(e.extras.getVisibility()==View.VISIBLE,"QA fields visible");check(e.mineFields.getVisibility()==View.GONE,"QA hides own wrong answer");check(e.mistakeFields.getVisibility()==View.GONE,"QA hides error memo");check(e.question.getText().toString().equals("왕복동 압축기의 용량제어 방법"),"question reused without typing twice");check(e.answer.getText().toString().contains("회전수"),"answer reused without typing twice");e.question.setText("표면적 공식은?\n바깥지름 기준");e.answer.setText("πdL");});capture("editor-qa-dark.png");
  ui(()->activity.editor.save());
  ui(()->{Note n=activity.db.query("표면적 공식은?").get(0);check(n.title.equals("표면적 공식은?"),"QA title derived automatically");check(n.answer.equals("πdL"),"QA answer saved");});
  for(int k=0;k<120;k++){Note n=new Note();n.subject="hvac";n.title="스크롤 확인 "+k;n.body="긴 목록 검사";db.save(n);}
  ui(()->activity.show("검색"));
  ui(()->{ScrollView scroll=(ScrollView)activity.root.getChildAt(1);check(scroll.canScrollVertically(1),"120-note list scrolls down");scroll.fullScroll(View.FOCUS_DOWN);});
  ui(()->{ScrollView scroll=(ScrollView)activity.root.getChildAt(1);check(scroll.canScrollVertically(-1),"120-note list reaches below first screen");});
  ui(()->{activity.getPreferences(0).edit().remove("draft").commit();Note n=new Note();n.subject="hvac";n.title="긴 내용";StringBuilder body=new StringBuilder();for(int k=0;k<150;k++)body.append("내용 ").append(k).append('\n');n.body=body.toString();activity.openEditor(n);});
  ui(()->{ScrollView scroll=(ScrollView)activity.root.getChildAt(1);check(scroll.canScrollVertically(1),"long content editor scrolls");activity.editor.type.setSelection(2);});
  ui(()->check(activity.editor.mistakeFields.getVisibility()==View.VISIBLE,"mistake fields only for mistake type"));
  ui(()->{activity.getPreferences(0).edit().putBoolean("dark",false).remove("draft").commit();activity.openEditor(new Note());});capture("editor-general-light.png");
  result.putString("stream","PASS "+assertions+" editor Android integration assertions");finish(Activity.RESULT_OK,result);
 }catch(Throwable error){result.putString("stream","FAIL "+android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);}finally{if(db!=null&&before!=null)try{db.restore(before);db.close();}catch(Exception ignored){}}}
}
