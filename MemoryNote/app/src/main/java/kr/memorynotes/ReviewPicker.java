package kr.memorynotes;
import android.app.*;import android.widget.*;import java.util.*;import java.time.LocalDate;
final class ReviewPicker {
 final MainActivity a;final FilterControls filters;final Spinner range;final TextView count;final AlertDialog dialog;
 ReviewPicker(MainActivity a,boolean due,String subject){
  this.a=a;LinearLayout layout=a.u.col();layout.setBackgroundColor(a.u.surface);layout.setPadding(a.u.dp(16),a.u.dp(10),a.u.dp(16),a.u.dp(10));
  filters=new FilterControls(a,layout,subject,false);range=a.u.spinner(layout,"복습 범위",new String[]{"전체 노트 · 복습 예정일 무관","오늘 복습할 노트만"},due?1:0);range.setTag("review.range");count=a.u.text("",18,a.u.ink);count.setTag("review.count");layout.addView(count);
  ScrollView scroll=new ScrollView(a);scroll.setBackgroundColor(a.u.surface);scroll.addView(layout);TextView title=a.u.text("복습 범위 선택",20,a.u.ink);title.setPadding(a.u.dp(20),a.u.dp(18),a.u.dp(20),a.u.dp(10));title.setBackgroundColor(a.u.surface);
  dialog=new AlertDialog.Builder(a).setCustomTitle(title).setView(scroll).setNegativeButton("취소",null).setPositiveButton("복습 시작",null).create();
  dialog.setOnShowListener(d->{dialog.getWindow().setBackgroundDrawable(a.u.shape(a.u.surface,18));dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v->{ArrayList<Note> notes=selected();if(notes.isEmpty()){refresh();return;}dialog.dismiss();a.beginReview(notes);});refresh();});
  filters.changed=()->refresh();range.setOnItemSelectedListener(a.listener(()->refresh()));dialog.show();
 }
 ArrayList<Note> selected(){NoteFilter f=filters.selection();f.dueOnly=range.getSelectedItemPosition()==1;return f.select(a.db.query(""),LocalDate.now().toString());}
 void refresh(){int size=selected().size();count.setText("선택한 조건의 노트 "+size+"개");if(dialog.isShowing()&&dialog.getButton(AlertDialog.BUTTON_POSITIVE)!=null)dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(size>0);}
}
