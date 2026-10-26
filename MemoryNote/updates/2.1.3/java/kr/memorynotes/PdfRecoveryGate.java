package kr.memorynotes;
import android.widget.*;
/** Prevents edits until an interrupted full restore has been safely recovered. */
public final class PdfRecoveryGate{
 public static boolean start(final MainActivity a){if(PdfFullBackup.recoverPending(a))return true;blocked(a);return false;}
 static void blocked(final MainActivity a){LinearLayout root=a.u.col();root.setBackgroundColor(a.u.bg);root.setPadding(a.u.dp(20),a.u.dp(30),a.u.dp(20),a.u.dp(20));root.addView(a.u.text("자료 복구를 완료해야 합니다",20,a.u.ink));root.addView(a.u.text("전체 복원 중 중단된 자료가 있습니다. 저장 공간을 확보한 뒤 다시 시도해 주세요. 복구가 끝날 때까지 기존 자료를 보호합니다.",15,a.u.muted));root.addView(a.u.button("복구 다시 시도",new Runnable(){public void run(){if(start(a))a.show("홈");}}));a.root=root;a.content=root;a.editor=null;a.review=null;a.backAction=new Runnable(){public void run(){blocked(a);}};a.setContentView(root);}
}
