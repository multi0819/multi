package kr.memorynotes;

import android.media.*;
import android.os.PowerManager;
import android.os.Handler;
import android.os.Looper;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.widget.*;
import java.util.*;

/** Playback belongs to the service, never to an Activity. */
final class SpeechPlayback {
 private final SpeechService service;
 private final AudioManager audio; private final AudioFocusRequest focus;
 private final PowerManager.WakeLock wake;
 Runnable observer; String label="한국어 음성을 준비하고 있습니다…";
 private final ArrayList<Note> notes=new ArrayList<>();
 private final Handler handler=new Handler(Looper.getMainLooper());
 private TextToSpeech tts;
 
 private int index=0,generation=0; private boolean ready=false,playing=false,closed=false;
 SpeechPlayback(SpeechService service){
  this.service=service;audio=service.getSystemService(AudioManager.class);
  AudioAttributes attributes=new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_MEDIA).setContentType(AudioAttributes.CONTENT_TYPE_SPEECH).build();
  focus=new AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN).setAudioAttributes(attributes).setOnAudioFocusChangeListener(change->{if(change<0){stop();update("다른 소리로 인해 정지됨");}}).build();
  wake=service.getSystemService(PowerManager.class).newWakeLock(PowerManager.PARTIAL_WAKE_LOCK,"kr.memorynotes:reading");wake.setReferenceCounted(false);
 }
 void open(ArrayList<Note> source){
  for(Note n:source)if(SpeechText.eligible(n.images.length()))notes.add(n);
  if(notes.isEmpty()){service.stopSelf();return;}
  tts=new TextToSpeech(service.getApplicationContext(),code->handler.post(()->initialize(code)));
 }
 boolean isPlaying(){return playing;}
 boolean isReady(){return ready;}
 String status(){return label+(notes.isEmpty()?"":"\n"+(index+1)+" / "+notes.size()+" · "+SpeechText.clean(notes.get(index).title));}
 void toggle(){if(playing){stop();update("정지됨");}else start();}
 void next(){if(!ready||closed)return;stop();index++;if(index>=notes.size()){index=0;update("모두 읽었습니다. 다시 시작할 수 있습니다.");}else start();}
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
  tts.setAudioAttributes(new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_MEDIA).setContentType(AudioAttributes.CONTENT_TYPE_SPEECH).build());ready=true;start();
 }
 private void update(String value){label=value;service.refresh();if(observer!=null)observer.run();}
 private void start(){
  if(!ready||closed)return;stop();if(audio.requestAudioFocus(focus)!=AudioManager.AUDIOFOCUS_REQUEST_GRANTED){update("다른 소리가 끝나면 읽기 시작을 눌러주세요.");return;}wake.acquire();playing=true;update("문제 읽는 중");
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
 private void fail(String message){stop();ready=false;update(message);}
 private void stop(){playing=false;generation++;handler.removeCallbacksAndMessages(null);if(tts!=null)tts.stop();if(wake.isHeld())wake.release();audio.abandonAudioFocusRequest(focus);}
 void close(){if(closed)return;closed=true;ready=false;stop();label="읽기를 종료했습니다.";if(observer!=null)observer.run();if(tts!=null){tts.shutdown();tts=null;}observer=null;}
}
