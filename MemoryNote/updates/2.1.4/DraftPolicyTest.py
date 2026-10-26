"""Exercise real DraftArchive empty-draft policy using isolated preference/database host doubles."""
from pathlib import Path
import tempfile,subprocess
HERE=Path(__file__).resolve().parent;ROOT=next(p for p in HERE.parents if (p/'tools/json.jar').exists());TOOLS=ROOT/'tools';ANDROID=TOOLS/'sdk/usr/share/java/com.android.android-23.jar'
hosts={
'android/content/Context.java':'package android.content;public class Context {}',
'android/app/Activity.java':'package android.app;public class Activity extends android.content.Context {}',
'android/util/Log.java':'package android.util;public class Log {public static int e(String a,String b,Throwable t){return 0;}}',
'kr/memorynotes/MainActivity.java':'package kr.memorynotes;public class MainActivity extends android.app.Activity {Ui u;NoteDb db=new NoteDb();NoteEditor editor;android.widget.LinearLayout content;android.content.SharedPreferences prefs;String shown;public android.content.SharedPreferences getPreferences(int mode){return prefs;}void show(String name){shown=name;}void edit(Note n){}void error(Exception e){throw new RuntimeException(e);}}',
'kr/memorynotes/NoteDb.java':'package kr.memorynotes;public class NoteDb {java.util.ArrayList<Note> notes=new java.util.ArrayList<Note>();public java.util.ArrayList<Note> query(String s){return notes;}}',
'kr/memorynotes/NoteEditor.java':'package kr.memorynotes;public class NoteEditor {MainActivity a;Note note;void collect(){}}',
'kr/memorynotes/DraftPolicyHost.java':'''package kr.memorynotes;import java.util.*;import java.lang.reflect.*;import android.content.*;public class DraftPolicyHost{
static int checks;static void ok(boolean b){checks++;if(!b)throw new AssertionError("check"+checks);}static Map<String,String> data=new HashMap<String,String>();
static Object proxy(Class<?> type){return Proxy.newProxyInstance(type.getClassLoader(),new Class<?>[]{type},new InvocationHandler(){public Object invoke(Object o,Method m,Object[] args){String n=m.getName();if(n.equals("getString"))return data.containsKey(args[0])?data.get(args[0]):args[1];if(n.equals("edit"))return proxy(SharedPreferences.Editor.class);if(n.equals("remove")){data.remove(args[0]);return o;}if(n.equals("putString")){data.put((String)args[0],(String)args[1]);return o;}if(n.equals("commit"))return true;return null;}});}
static String json(Note n)throws Exception{return n.json().toString();}
public static void main(String[] args)throws Exception{MainActivity a=new MainActivity();a.prefs=(SharedPreferences)proxy(SharedPreferences.class);Note empty=new Note();empty.subject="subject";empty.chapter="chapter";empty.type="문답 카드";ok(!DraftArchive.meaningful(empty));NoteEditor e=new NoteEditor();e.a=a;e.note=empty;a.editor=e;data.put("draft",json(empty));ok(DraftArchive.clearEmpty(e)&&!data.containsKey("draft"));data.put("draft",json(empty));DraftArchive.cleanEmpty(a);ok(!data.containsKey("draft"));ok(DraftArchive.leaveEmpty(e)&&a.editor==null&&a.shown.equals("홈"));
Note typed=new Note();typed.body="본문";data.put("draft",json(typed));ok(DraftArchive.clearEmpty(e));ok(data.get("draft").equals(json(typed)));DraftArchive.cleanEmpty(a);ok(data.get("draft").equals(json(typed)));e.note=typed;ok(!DraftArchive.clearEmpty(e));
a.db.notes.add(empty);e.note=empty;data.put("draft",json(empty));ok(!DraftArchive.clearEmpty(e));DraftArchive.cleanEmpty(a);ok(data.containsKey("draft"));ok(!DraftArchive.leaveEmpty(e));
for(String field:new String[]{"title","question","answer","mine","reason","caution","tags"}){Note n=new Note();Note.class.getField(field).set(n,"x");ok(DraftArchive.meaningful(n));}Note n=new Note();n.images.put(new org.json.JSONObject());ok(DraftArchive.meaningful(n));n=new Note();n.ink.put(new org.json.JSONObject());ok(DraftArchive.meaningful(n));n=new Note();n.favorite=true;ok(DraftArchive.meaningful(n));data.put("draft","broken");DraftArchive.cleanEmpty(a);ok(data.get("draft").equals("broken"));System.out.println("PASS "+checks+" blank/meaningful/saved/unrelated/malformed draft policy checks");}}
'''
}
with tempfile.TemporaryDirectory(prefix='draft-policy-') as t:
 w=Path(t);classes=w/'classes';classes.mkdir();source=w/'src'
 for name,content in hosts.items():p=source/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content)
 # App stubs only supply unused UI methods; host doubles replace activity/editor/db behavior.
 sources=[HERE/'java/kr/memorynotes/DraftArchive.java',HERE/'stubs/kr/memorynotes/Ui.java',HERE.parents[1]/'app/src/main/java/kr/memorynotes/Note.java',*source.rglob('*.java')]
 subprocess.run(['javac','--release','8','-encoding','UTF-8','-cp',str(ANDROID),'-d',str(classes),*map(str,sources)],check=True)
 subprocess.run(['java','-cp',str(classes)+':'+str(TOOLS/'json.jar')+':'+str(ANDROID),'kr.memorynotes.DraftPolicyHost'],check=True)
