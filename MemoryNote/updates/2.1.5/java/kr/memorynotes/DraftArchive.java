package kr.memorynotes;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.widget.Button;
import org.json.JSONObject;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

/** Preserves an unrelated single-slot draft before the existing editor takes that slot. */
public final class DraftArchive {
 private static final String KEY="saved_draft_archive";
 public static boolean meaningful(Note n){return !(n.title+n.body+n.question+n.answer+n.mine+n.reason+n.caution+n.tags).trim().isEmpty()||n.favorite||n.images.length()>0||n.ink.length()>0;}
 private static boolean saved(MainActivity a,Note n){for(Note old:a.db.query(""))if(old.id.equals(n.id))return true;return false;}
 private static void clearMatching(MainActivity a,Note current)throws Exception{String raw=a.getPreferences(0).getString("draft","");if(raw.isEmpty())return;Note pending=Note.from(new JSONObject(raw));if(pending.id.equals(current.id)||(!meaningful(pending)&&!saved(a,pending)))a.getPreferences(0).edit().remove("draft").apply();}
 public static boolean clearEmpty(NoteEditor e){try{if(meaningful(e.note)||saved(e.a,e.note))return false;clearMatching(e.a,e.note);return true;}catch(Exception ex){android.util.Log.e("MemoryNote","empty draft",ex);return false;}}
 public static boolean leaveEmpty(NoteEditor e){e.collect();if(!clearEmpty(e))return false;e.a.editor=null;e.a.show("홈");return true;}
 public static void cleanEmpty(MainActivity a){try{String raw=a.getPreferences(0).getString("draft","");if(raw.isEmpty())return;Note n=Note.from(new JSONObject(raw));if(!meaningful(n)&&!saved(a,n))a.getPreferences(0).edit().remove("draft").apply();}catch(Exception e){android.util.Log.e("MemoryNote","draft cleanup",e);}}
 private static JSONObject read(MainActivity a)throws Exception{return new JSONObject(a.getPreferences(0).getString(KEY,"{}"));}
 public static boolean archive(MainActivity a,Note pending){
  if(pending==null||!meaningful(pending))return true;
  try{JSONObject all=read(a);all.put(pending.id,new JSONObject(pending.json().toString()));if(!a.getPreferences(0).edit().putString(KEY,all.toString()).commit())throw new IOException("작성 중인 노트를 보관하지 못했습니다. 기존 초안을 유지합니다.");return true;}
  catch(Exception e){a.error(e);return false;}
 }
 public static void addEntry(final MainActivity a){
  try{if(read(a).length()==0)return;}catch(Exception e){a.error(e);return;}
  Button recover=a.u.button("보관된 작성 중 노트 복구",new Runnable(){public void run(){choose(a);}});recover.setTextSize(12*a.u.scale);a.content.addView(recover,Math.min(1,a.content.getChildCount()));
 }
 private static void choose(final MainActivity a){
  try{JSONObject all=read(a);final ArrayList<Note> notes=new ArrayList<Note>();ArrayList<String> titles=new ArrayList<String>();Iterator<String> ids=all.keys();while(ids.hasNext()){Note n=Note.from(new JSONObject(all.getJSONObject(ids.next()).toString()));notes.add(n);titles.add(n.title.trim().isEmpty()?"제목 없는 작성 중 노트":n.title);}
   if(notes.isEmpty())return;
   new AlertDialog.Builder(a).setTitle("보관된 작성 중 노트").setItems(titles.toArray(new String[0]),new DialogInterface.OnClickListener(){public void onClick(DialogInterface dialog,int which){
    try{Note selected=notes.get(which);SharedPreferences prefs=a.getPreferences(0);String current=prefs.getString("draft","");if(!current.isEmpty()&&!archive(a,Note.from(new JSONObject(current))))return;
     if(!prefs.edit().putString("draft",selected.json().toString()).commit())throw new IOException("초안을 복구하지 못했습니다. 보관된 원본은 유지됩니다.");a.edit(selected);
    }catch(Exception e){a.error(e);}
   }}).setNegativeButton("취소",null).show();
  }catch(Exception e){a.error(e);}
 }
}
