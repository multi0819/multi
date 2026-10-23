package kr.memorynotes;
import java.util.WeakHashMap;
public final class ReviewActions {
 private static final WeakHashMap<MainActivity,ReviewScreen> editing=new WeakHashMap<>();
 public static String primaryLabel(Note n){return "일반 노트".equals(n.type)?"가린 문구 확인":"정답 확인";}
 public static void addRevealControl(final MainActivity a,final ReviewScreen r){
  Note n=r.notes.get(r.index);
  if(!"일반 노트".equals(n.type)&&ReviewFlow.masked(r)&&(ReviewFlow.hasPhrases(n.question)||ReviewFlow.hasPhrases(n.answer))){
   a.content.addView(a.u.button("가린 문구 확인",new Runnable(){public void run(){ReviewFlow.revealPhrases(r);r.show();}}));
  }else ReviewControls.addHide(a,r);
 }
 public static void addEdit(final MainActivity a,final ReviewScreen r){a.content.addView(a.u.button("노트 수정",new Runnable(){public void run(){try{Note n=r.notes.get(r.index);Note copy=Note.from(n.json());editing.put(a,r);a.edit(copy);}catch(Exception e){editing.remove(a);a.error(e);}}}),0);}
 public static void clear(MainActivity a){editing.remove(a);}
 public static void afterSave(MainActivity a,Note n){ReviewScreen r=editing.remove(a);if(r!=null&&r.index<r.notes.size()&&r.notes.get(r.index).id.equals(n.id)){r.notes.set(r.index,n);r.revealed=false;r.show();}else a.detail(n);}
}
