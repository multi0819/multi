package kr.memorynotes;
import android.app.*;import android.content.*;import android.os.*;import android.widget.*;import java.util.*;
/** Dialog controls the service; backgrounding or recreating the Activity does not stop playback. */
final class SpeechReader {
 private final MainActivity a;private AlertDialog dialog;private TextView status;private Button play,next;
 private SpeechService service;private boolean bound,closed;
 private final ServiceConnection connection=new ServiceConnection(){
  public void onServiceConnected(ComponentName name,IBinder binder){service=((SpeechService.LocalBinder)binder).service();if(service.playback!=null)service.playback.observer=()->render();render();}
  public void onServiceDisconnected(ComponentName name){service=null;}
 };
 SpeechReader(MainActivity a){this.a=a;}
 void open(ArrayList<Note> source){
  ArrayList<Note> eligible=new ArrayList<>();for(Note n:source)if(SpeechText.eligible(n.images.length()))eligible.add(n);
  if(eligible.isEmpty()){a.u.message("읽을 문제가 없습니다. 그림이 첨부된 문제는 읽어주기에서 제외합니다.");a.speech=null;return;}
  LinearLayout layout=a.u.col();layout.setPadding(a.u.dp(22),a.u.dp(8),a.u.dp(22),a.u.dp(8));
  layout.addView(a.u.text("문제 → 3초 생각하기 → 정답 → 다음 문제\n화면을 내리거나 꺼도 계속 읽습니다. 그림 문제는 제외합니다.",14,a.u.muted));
  status=a.u.text("한국어 음성을 준비하고 있습니다…",18,a.u.ink);layout.addView(status);
  play=a.u.primary("읽기 시작",()->{if(service!=null&&service.playback!=null)service.playback.toggle();});play.setEnabled(false);layout.addView(play);
  next=a.u.button("다음 문제",()->{if(service!=null&&service.playback!=null)service.playback.next();});next.setEnabled(false);layout.addView(next);
  dialog=new AlertDialog.Builder(a).setTitle("문제 읽어주기").setView(layout).setNegativeButton("읽기 종료",(d,w)->close()).create();
  dialog.setOnDismissListener(d->close());dialog.show();
  // Keep large note collections out of Binder transactions.
  if(!SpeechService.running){SpeechService.pending=eligible;a.startForegroundService(new Intent(a,SpeechService.class));}
  bound=a.bindService(new Intent(a,SpeechService.class),connection,Context.BIND_AUTO_CREATE);
 }
 private void render(){if(closed||service==null||service.playback==null)return;SpeechPlayback p=service.playback;status.setText(p.status());play.setText(p.isPlaying()?"읽기 정지":"읽기 시작");play.setEnabled(p.isReady());next.setEnabled(p.isReady());}
 void detach(){if(closed)return;closed=true;if(service!=null&&service.playback!=null)service.playback.observer=null;if(bound){a.unbindService(connection);bound=false;}if(dialog!=null){dialog.setOnDismissListener(null);dialog.dismiss();}if(a.speech==this)a.speech=null;}
 void close(){if(closed)return;a.stopService(new Intent(a,SpeechService.class));detach();}
}
