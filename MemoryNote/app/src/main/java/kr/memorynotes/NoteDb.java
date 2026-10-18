package kr.memorynotes;
import android.content.*;
import android.database.*;
import android.database.sqlite.*;
import org.json.*;
import java.util.*;
import java.time.LocalDate;
public class NoteDb extends SQLiteOpenHelper {
 public NoteDb(Context c){super(c,"memorynotes.db",null,1);getWritableDatabase();}
 public void onCreate(SQLiteDatabase d){
  d.execSQL("CREATE TABLE subjects(id TEXT PRIMARY KEY,name TEXT NOT NULL)");
  d.execSQL("CREATE TABLE chapters(id TEXT PRIMARY KEY,subject TEXT NOT NULL,name TEXT NOT NULL)");
  d.execSQL("CREATE TABLE notes(id TEXT PRIMARY KEY,data TEXT NOT NULL)");
  d.execSQL("CREATE TABLE history(id INTEGER PRIMARY KEY AUTOINCREMENT,note TEXT NOT NULL,day TEXT NOT NULL,rating INTEGER NOT NULL)");
  ContentValues v=new ContentValues();v.put("id","hvac");v.put("name","공조냉동");d.insertOrThrow("subjects",null,v);
  String[] names={"냉동공학","공기조화","배관·설비"};for(String name:names){v=new ContentValues();v.put("id",UUID.randomUUID().toString());v.put("subject","hvac");v.put("name",name);d.insertOrThrow("chapters",null,v);}
 }
 public void onUpgrade(SQLiteDatabase d,int old,int next){throw new IllegalStateException("Unsupported schema");}
 public LinkedHashMap<String,String> groups(String table,String subject){
  LinkedHashMap<String,String> out=new LinkedHashMap<>();
  try(Cursor c=getReadableDatabase().query(table,new String[]{"id","name"},subject==null?null:"subject=?",subject==null?null:new String[]{subject},null,null,"rowid")){while(c.moveToNext())out.put(c.getString(0),c.getString(1));}return out;
 }
 public String addGroup(String table,String name,String subject){String id=UUID.randomUUID().toString();ContentValues v=new ContentValues();v.put("id",id);v.put("name",name);if(subject!=null)v.put("subject",subject);getWritableDatabase().insertOrThrow(table,null,v);return id;}
 public void renameGroup(String table,String id,String name){ContentValues v=new ContentValues();v.put("name",name);getWritableDatabase().update(table,v,"id=?",new String[]{id});}
 public void save(Note n)throws JSONException{n.updated=System.currentTimeMillis();ContentValues v=new ContentValues();v.put("id",n.id);v.put("data",n.json().toString());getWritableDatabase().insertWithOnConflict("notes",null,v,SQLiteDatabase.CONFLICT_REPLACE);}
 public ArrayList<Note> query(String text){ArrayList<Note> out=new ArrayList<>();try(Cursor c=getReadableDatabase().rawQuery("SELECT data FROM notes ORDER BY rowid DESC",null)){while(c.moveToNext()){try{Note n=Note.from(new JSONObject(c.getString(0)));if(text.isEmpty()||n.searchable().toLowerCase(Locale.ROOT).contains(text.toLowerCase(Locale.ROOT)))out.add(n);}catch(JSONException e){throw new IllegalStateException("노트를 읽을 수 없습니다",e);}}}out.sort((a,b)->Long.compare(b.updated,a.updated));return out;}
 public void delete(Note n){SQLiteDatabase d=getWritableDatabase();d.beginTransaction();try{d.delete("notes","id=?",new String[]{n.id});d.delete("history","note=?",new String[]{n.id});d.setTransactionSuccessful();}finally{d.endTransaction();}}
 public void review(Note n,int rating)throws JSONException{
  SQLiteDatabase d=getWritableDatabase();LocalDate today=LocalDate.now();d.beginTransaction();try{n.due=ReviewScheduler.next(today,rating,n.streak).toString();n.streak=ReviewScheduler.streak(rating,n.streak);n.rating=rating;save(n);ContentValues v=new ContentValues();v.put("note",n.id);v.put("day",today.toString());v.put("rating",rating);d.insertOrThrow("history",null,v);d.setTransactionSuccessful();}finally{d.endTransaction();}
 }
 public LinkedHashMap<String,Integer> history(){LinkedHashMap<String,Integer> out=new LinkedHashMap<>();try(Cursor c=getReadableDatabase().rawQuery("SELECT day,COUNT(*) FROM history GROUP BY day ORDER BY day DESC LIMIT 30",null)){while(c.moveToNext())out.put(c.getString(0),c.getInt(1));}return out;}
 public JSONObject snapshot()throws JSONException{
  SQLiteDatabase snapshotDb=getWritableDatabase();snapshotDb.beginTransaction();try{
  JSONObject o=new JSONObject();o.put("version",1);for(String t:new String[]{"subjects","chapters","notes","history"}){JSONArray rows=new JSONArray();try(Cursor c=getReadableDatabase().query(t,null,null,null,null,null,null)){while(c.moveToNext()){JSONObject row=new JSONObject();for(int i=0;i<c.getColumnCount();i++){String key=c.getColumnName(i);if(c.getType(i)==Cursor.FIELD_TYPE_INTEGER)row.put(key,c.getLong(i));else row.put(key,c.getString(i));}rows.put(row);}}o.put(t,rows);}snapshotDb.setTransactionSuccessful();return o;}finally{snapshotDb.endTransaction();}
 }
 public void restore(JSONObject snapshot)throws JSONException{
  SQLiteDatabase d=getWritableDatabase();d.beginTransaction();try{for(String t:new String[]{"history","notes","chapters","subjects"}){d.delete(t,null,null);JSONArray rows=snapshot.getJSONArray(t);for(int i=0;i<rows.length();i++){JSONObject row=rows.getJSONObject(i);ContentValues v=new ContentValues();Iterator<String> it=row.keys();while(it.hasNext()){String key=it.next();Object value=row.get(key);if(value instanceof Number)v.put(key,((Number)value).longValue());else v.put(key,value.toString());}d.insertOrThrow(t,null,v);}}d.setTransactionSuccessful();}finally{d.endTransaction();}
 }
}
