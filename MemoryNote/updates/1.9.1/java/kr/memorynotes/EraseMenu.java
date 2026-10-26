package kr.memorynotes;
import android.app.AlertDialog;
import android.content.DialogInterface;
public final class EraseMenu {
 public static void show(final InkPage ink,final Runnable[] refresh){
  final MainActivity a=ink.a;
  new AlertDialog.Builder(a).setTitle("필기 지우기").setItems(new String[]{"지우개로 지우기","필기 전체 지우기"},new DialogInterface.OnClickListener(){
   public void onClick(DialogInterface d,int which){
    if(which==0){ink.enabled=true;ink.eraser=true;refresh[0].run();}
    else if(which==1)a.u.confirm("필기 전체 지우기","현재 노트의 필기를 모두 지울까요? 글과 사진은 유지됩니다. 실행 취소로 되돌릴 수 있습니다.",new Runnable(){public void run(){ink.clear();}});
   }
  }).show();
 }
}
