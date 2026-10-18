package kr.memorynotes;
import android.app.*;import android.content.*;import android.os.*;import java.util.*;
/** Uses the test APK's deterministic TTS engine to exercise real service/binder callbacks. */
public class BackgroundSpeechRunner extends Instrumentation {
 int assertions;MainActivity activity;SpeechService service;boolean bound;String originalDraft;
 void check(boolean ok,String message){assertions++;if(!ok)throw new AssertionError(message);}
 void shell(String command)throws Exception{try(java.io.InputStream input=new java.io.FileInputStream(getUiAutomation().executeShellCommand(command).getFileDescriptor())){byte[] buffer=new byte[1024];while(input.read(buffer)!=-1){}}}
 void ui(Runnable action){runOnMainSync(action);waitForIdleSync();}
 final ServiceConnection connection=new ServiceConnection(){public void onServiceConnected(ComponentName n,IBinder b){service=((SpeechService.LocalBinder)b).service();}public void onServiceDisconnected(ComponentName n){service=null;}};
 public void onCreate(Bundle args){super.onCreate(args);start();}
 public void onStart(){Bundle result=new Bundle();try{
  activity=(MainActivity)startActivitySync(new Intent(getTargetContext(),MainActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
  originalDraft=activity.getPreferences(0).getString("draft","");
  ArrayList<Note> notes=new ArrayList<>();for(int i=0;i<30;i++){Note n=new Note();n.title="백그라운드 시험 "+i;n.type="문답 카드";n.question="문제 "+i;n.answer="답 "+i;notes.add(n);}
  ui(()->activity.startListening(notes));
  bound=getTargetContext().bindService(new Intent(getTargetContext(),SpeechService.class),connection,Context.BIND_AUTO_CREATE);
  long deadline=SystemClock.uptimeMillis()+45000;while((service==null||service.playback==null||(!service.playback.isReady()||!service.playback.isPlaying()))&&SystemClock.uptimeMillis()<deadline)SystemClock.sleep(100);
  check(service!=null&&service.playback!=null&&service.playback.isReady(),"TTS not ready: "+(service==null?"no service":service.playback.status()));
  SpeechPlayback before=service.playback;check(before.isPlaying(),"Not playing: "+before.status());
  ui(()->activity.moveTaskToBack(true));SystemClock.sleep(500);
  check(service.playback==before&&before.isPlaying(),"Home stopped playback");
  shell("input keyevent 223");long screenDeadline=SystemClock.uptimeMillis()+10000;while(getTargetContext().getSystemService(PowerManager.class).isInteractive()&&SystemClock.uptimeMillis()<screenDeadline)SystemClock.sleep(100);
  check(!getTargetContext().getSystemService(PowerManager.class).isInteractive(),"Screen did not turn off");
  String initial=before.status();SystemClock.sleep(13000);
  check(service.playback==before&&before.isPlaying(),"Screen off stopped playback");
  check(!initial.equals(before.status()),"No question/answer progress with screen off");
  java.lang.reflect.Field field=SpeechPlayback.class.getDeclaredField("wake");field.setAccessible(true);PowerManager.WakeLock wake=(PowerManager.WakeLock)field.get(before);check(wake.isHeld(),"No CPU lock across question/answer gaps");
  ui(()->before.toggle());check(!before.isPlaying()&&!wake.isHeld(),"Pause did not release CPU lock");
  ui(()->before.toggle());check(before.isPlaying()&&wake.isHeld(),"Resume failed");
  ui(()->activity.finish());SystemClock.sleep(500);check(before.isPlaying(),"Destroying Activity stopped service");
  getTargetContext().startService(new Intent(getTargetContext(),SpeechService.class).setAction("stop"));long stopDeadline=SystemClock.uptimeMillis()+10000;while(SpeechService.running&&SystemClock.uptimeMillis()<stopDeadline)SystemClock.sleep(100);
  check(!SpeechService.running&&!wake.isHeld(),"Stop notification leaked service or CPU lock");
  result.putString("stream","PASS "+assertions+" background speech Android assertions\n");
 }catch(Throwable t){result.putString("stream","FAIL "+t+"\n");}finally{getTargetContext().stopService(new Intent(getTargetContext(),SpeechService.class));if(bound)getTargetContext().unbindService(connection);try{shell("input keyevent 224");}catch(Exception ignored){}}finish(result.getString("stream","").startsWith("PASS")?Activity.RESULT_OK:Activity.RESULT_CANCELED,result);}
}
