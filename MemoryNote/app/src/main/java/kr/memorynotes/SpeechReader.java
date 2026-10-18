package kr.memorynotes;

import android.app.AlertDialog;
import android.os.Handler;
import android.os.Looper;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.widget.*;
import java.util.*;

/** Owns one foreground listening session; leaving the app cancels all callbacks. */
final class SpeechReader {
 private final MainActivity a;
 private final ArrayList<Note> notes=new ArrayList<>();
 private final Handler handler=new Handler(Looper.getMainLooper());
 private TextToSpeech tts; private AlertDialog dialog;
 private TextView status; private Button play,next;
 private int index=0,generation=0; private boolean ready=false,playing=false,closed=false;
 SpeechReader(MainActivity a){this.a=a;}
 void open(ArrayList<Note> source){
  int excluded=0;
  for(Note n:source){if(SpeechText.eligible(n.images.length()))notes.add(n);else excluded++;}
  if(notes.isEmpty()){a.u.message("읽을 문제가 없습니다. 그림이 첨부된 문제는 읽어주기에서 제외합니다.");a.speech=null;return;}
  LinearLayout layout=a.u.col();layout.setPadding(a.u.dp(22),a.u.dp(8),a.u.dp(22),a.u.dp(8));
  layout.addView(a.u.text("문제 → 3초 생각하기 → 정답 → 다음 문제\n그림이 있는 문제 "+excluded+"개 제외 · 복습 평가는 변경하지 않습니다.",14,a.u.muted));
  status=a.u.text("한국어 음성을 준비하고 있습니다…",18,a.u.ink);layout.addView(status);
  play=a.u.primary("읽기 시작",()->{if(playing){stop();update("정지됨");}else start();});play.setEnabled(false);layout.addView(play);
  next=a.u.button("다음 문제",()->{stop();index++;if(index>=notes.size()){index=0;update("모두 읽었습니다. 다시 시작할 수 있습니다.");}else start();});next.setEnabled(false);layout.addView(next);
  dialog=new AlertDialog.Builder(a).setTitle("문제 읽어주기").setView(layout).setNegativeButton("닫기",(d,w)->close()).create();
  dialog.setOnDismissListener(d->close());dialog.show();
  tts=new TextToSpeech(a.getApplicationContext(),code->handler.post(()->initialize(code)));
 }
 private void initialize(int code){
  if(closed)return;
  if(code!=TextToSpeech.SUCCESS){fail("음성 엔진을 시작하지 못했습니다. 휴대폰의 글자 읽어주기 설정을 확인하세요.");return;}
  int language=tts.setLanguage(Locale.KOREAN);
  if(language==TextToSpeech.LANG_MISSING_DATA||language==TextToSpeech.LANG_NOT_SUPPORTED){fail("한국어 음성 데이터가 없습니다. 휴대폰 설정에서 한국어 TTS 음성을 설치한 뒤 다시 열어주세요.");return;}
  tts.setOnUtteranceProgressListener(new UtteranceProgressListener(){
   public void onStart(String id){}
   public void onDone(String id){handler.post(()->finished(id));}
   public void onError(String id){handler.post(()->{if(valid(id))fail("음성을 읽지 못했습니다. 음성 설정을 확인한 뒤 다시 시도하세요.");});}
  });
  ready=true;play.setEnabled(true);next.setEnabled(true);start();
 }
 private void update(String label){status.setText(label+"\n"+(index+1)+" / "+notes.size()+" · "+SpeechText.clean(notes.get(index).title));play.setText(playing?"읽기 정지":"읽기 시작");}
 private void start(){
  if(!ready||closed)return;stop();playing=true;update("문제 읽는 중");
  Note n=notes.get(index);speak(SpeechText.question(n.type,n.title,n.body,n.question),"q");
 }
 private void speak(String text,String phase){
  if(text.trim().isEmpty()){finished(generation+":"+phase);return;}
  int limit=Math.min(3500,TextToSpeech.getMaxSpeechInputLength()-1);
  for(int from=0;from<text.length();){int end=Math.min(text.length(),from+limit);if(end<text.length()&&Character.isHighSurrogate(text.charAt(end-1)))end--;
   String id=generation+":"+(end==text.length()?phase:"chunk");
   if(tts.speak(text.substring(from,end),TextToSpeech.QUEUE_ADD,null,id)==TextToSpeech.ERROR){fail("음성을 읽지 못했습니다. 휴대폰의 음성 설정을 확인하세요.");return;}from=end;
  }
 }
 private boolean valid(String id){return !closed&&playing&&id.startsWith(generation+":");}
 private void finished(String id){
  if(!valid(id))return;
  final int token=generation;
  if(id.endsWith(":q")){update("3초 동안 답을 떠올려보세요");handler.postDelayed(()->{if(closed||!playing||token!=generation)return;update("정답 읽는 중");Note n=notes.get(index);speak(SpeechText.answer(n.type,n.body,n.answer),"a");},3000);}
  else if(id.endsWith(":a")){handler.postDelayed(()->{if(closed||!playing||token!=generation)return;index++;if(index>=notes.size()){stop();index=0;update("모두 읽었습니다. 다시 시작할 수 있습니다.");}else start();},1200);}
 }
 private void fail(String message){stop();status.setText(message);play.setEnabled(false);next.setEnabled(false);}
 private void stop(){playing=false;generation++;handler.removeCallbacksAndMessages(null);if(tts!=null)tts.stop();if(play!=null)play.setText("읽기 시작");}
 void close(){if(closed)return;closed=true;stop();if(tts!=null){tts.shutdown();tts=null;}if(dialog!=null&&dialog.isShowing())dialog.dismiss();if(a.speech==this)a.speech=null;}
}
