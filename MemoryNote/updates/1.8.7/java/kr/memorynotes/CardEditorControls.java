package kr.memorynotes;
import android.widget.*;
public final class CardEditorControls {
 private static void add(final NoteEditor e,final EditText target,String label){LinearLayout p=(LinearLayout)target.getParent();p.addView(e.a.u.clozeButton(label,new Runnable(){public void run(){new PhraseSelectionDialog(e.a,target).show();}}),p.indexOfChild(target)+1);}
 public static void attach(NoteEditor e){add(e,e.question,"문제의 가릴 단어 선택");add(e,e.answer,"정답의 가릴 단어 선택");e.a.u.studyEditor(e.question,false);}
}
