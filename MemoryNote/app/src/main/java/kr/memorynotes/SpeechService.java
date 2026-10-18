package kr.memorynotes;
import android.app.*;import android.content.*;import android.os.*;import android.media.session.*;import java.util.*;
public final class SpeechService extends Service {
 static ArrayList<Note> pending;static boolean running;SpeechPlayback playback;private MediaSession media;
 public final class LocalBinder extends Binder {SpeechService service(){return SpeechService.this;}}
 public IBinder onBind(Intent intent){return new LocalBinder();}
 public void onCreate(){super.onCreate();getSystemService(NotificationManager.class).createNotificationChannel(new NotificationChannel("reading","문제 읽어주기",NotificationManager.IMPORTANCE_LOW));media=new MediaSession(this,"MemoryNoteReading");media.setCallback(new MediaSession.Callback(){public void onPlay(){if(playback!=null&&!playback.isPlaying())playback.toggle();}public void onPause(){if(playback!=null&&playback.isPlaying())playback.toggle();}public void onSkipToNext(){if(playback!=null)playback.next();}public void onStop(){endSession();}});media.setActive(true);}
 public int onStartCommand(Intent intent,int flags,int id){
  startForeground(42,notification());running=true;
  String action=intent==null?null:intent.getAction();
  if("stop".equals(action)){endSession();return START_NOT_STICKY;}
  if("toggle".equals(action)){if(playback!=null)playback.toggle();return START_NOT_STICKY;}
  if(playback==null){ArrayList<Note> notes=pending;pending=null;if(notes==null||notes.isEmpty()){stopSelf();return START_NOT_STICKY;}media.setActive(true);playback=new SpeechPlayback(this);playback.open(notes);}
  return START_NOT_STICKY;
 }
 private void endSession(){if(playback!=null){playback.close();playback=null;}running=false;media.setActive(false);stopForeground(STOP_FOREGROUND_REMOVE);stopSelf();}
 private PendingIntent command(String action,int id){return PendingIntent.getService(this,id,new Intent(this,SpeechService.class).setAction(action),PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_UPDATE_CURRENT);}
 private Notification notification(){return new Notification.Builder(this,"reading").setSmallIcon(kr.memorynotes.R.drawable.ic_book).setContentTitle("암기노트 · 문제 읽어주기").setContentText(playback==null?"음성을 준비하고 있습니다…":playback.status()).setContentIntent(PendingIntent.getActivity(this,0,new Intent(this,MainActivity.class).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP),PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_UPDATE_CURRENT)).setOngoing(true).setOnlyAlertOnce(true).setVisibility(Notification.VISIBILITY_PUBLIC).setStyle(new Notification.MediaStyle().setMediaSession(media.getSessionToken()).setShowActionsInCompactView(0,1)).addAction(playback!=null&&playback.isPlaying()?android.R.drawable.ic_media_pause:android.R.drawable.ic_media_play,playback!=null&&playback.isPlaying()?"정지":"계속 읽기",command("toggle",1)).addAction(android.R.drawable.ic_menu_close_clear_cancel,"종료",command("stop",2)).build();}
 void refresh(){if(media!=null)media.setPlaybackState(new PlaybackState.Builder().setActions(PlaybackState.ACTION_PLAY|PlaybackState.ACTION_PAUSE|PlaybackState.ACTION_SKIP_TO_NEXT|PlaybackState.ACTION_STOP).setState(playback!=null&&playback.isPlaying()?PlaybackState.STATE_PLAYING:PlaybackState.STATE_PAUSED,0,1).build());getSystemService(NotificationManager.class).notify(42,notification());}
 public void onDestroy(){running=false;pending=null;if(playback!=null){playback.close();playback=null;}if(media!=null){media.setActive(false);media.release();}stopForeground(STOP_FOREGROUND_REMOVE);super.onDestroy();}
}
