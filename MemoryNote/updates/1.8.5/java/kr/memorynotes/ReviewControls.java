package kr.memorynotes;
public final class ReviewControls {
 public static void addHide(MainActivity a,final ReviewScreen r){a.content.addView(a.u.button("다시 가리기",new Runnable(){public void run(){r.revealed=false;r.show();}}));}
}
