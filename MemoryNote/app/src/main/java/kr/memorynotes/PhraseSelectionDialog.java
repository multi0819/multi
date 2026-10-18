package kr.memorynotes;

import android.app.AlertDialog;
import android.text.*;
import android.text.style.BackgroundColorSpan;
import android.view.*;
import android.widget.*;
import java.util.*;

/** Stage any number of phrases or whole lines, then update the note once. */
final class PhraseSelectionDialog {
 private final MainActivity a;private final EditText target;private final PhraseSelection selection;
 private TextView preview,count;private LinearLayout chosen;private final ArrayList<CheckBox> boxes=new ArrayList<>();
 private final ArrayList<PhraseSelection.Range> lines=new ArrayList<>();private boolean syncing;
 PhraseSelectionDialog(MainActivity a,EditText target){this.a=a;this.target=target;selection=new PhraseSelection(target.getText().toString());int start=target.getSelectionStart(),end=target.getSelectionEnd();if(start>=0&&end>start)selection.add(start,end);}
 void show(){
  LinearLayout content=a.u.col();content.setPadding(a.u.dp(16),a.u.dp(12),a.u.dp(16),a.u.dp(12));content.setBackgroundColor(a.u.surface);
  content.addView(a.u.text("문구를 길게 눌러 선택 → ‘선택 문구 추가’를 반복하세요. 아래에서 여러 줄을 체크해도 됩니다.",14,a.u.muted));
  preview=a.u.study(selection.source,17,true,false);preview.setTextIsSelectable(true);preview.setPadding(0,a.u.dp(12),0,a.u.dp(12));content.addView(preview);
  preview.setCustomSelectionActionModeCallback(new ActionMode.Callback(){
   public boolean onCreateActionMode(ActionMode mode,Menu menu){menu.add(0,903,0,"가림에 추가");return true;}
   public boolean onPrepareActionMode(ActionMode mode,Menu menu){return false;}
   public boolean onActionItemClicked(ActionMode mode,MenuItem item){if(item.getItemId()==903){addSelected();mode.finish();return true;}return false;}
   public void onDestroyActionMode(ActionMode mode){}
  });
  content.addView(a.u.button("선택 문구 추가",this::addSelected));
  LinearLayout actions=a.u.row();a.u.weighted(actions,a.u.button("줄 전체 선택",()->{selection.selectLines();refresh();}));a.u.weighted(actions,a.u.button("선택 모두 해제",()->{selection.clear();refresh();}));content.addView(actions);
  lines.addAll(selection.lines());if(!lines.isEmpty())content.addView(a.u.text("줄별 빠른 선택",14,a.u.muted));
  for(PhraseSelection.Range range:lines){CheckBox check=new CheckBox(a);check.setText(Cloze.reveal(selection.source.substring(range.start,range.end)));check.setTextColor(a.u.answerColor);check.setTextSize(15*a.u.scale);content.addView(check);boxes.add(check);check.setOnCheckedChangeListener((v,on)->{if(syncing)return;if(on){if(!selection.add(range.start,range.end))Toast.makeText(a,"이미 선택한 문구와 겹칩니다.",Toast.LENGTH_SHORT).show();}else{List<PhraseSelection.Range> all=selection.ranges();for(int i=all.size()-1;i>=0;i--)if(all.get(i).start==range.start&&all.get(i).end==range.end)selection.remove(i);}refresh();});}
  count=a.u.text("",15,a.u.clozeColor);content.addView(count);chosen=a.u.col();content.addView(chosen);
  ScrollView scroll=new ScrollView(a);scroll.addView(content);int height=(int)(a.getResources().getDisplayMetrics().heightPixels*.62);scroll.setLayoutParams(new android.view.ViewGroup.LayoutParams(-1,height));
  AlertDialog dialog=new AlertDialog.Builder(a).setTitle("가림 문구 여러 개 설정").setView(scroll).setNegativeButton("취소",null).setPositiveButton("한 번에 적용",null).create();
  dialog.setOnShowListener(v->dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(button->{if(selection.size()==0){a.u.message("가릴 문구 또는 줄을 하나 이상 선택하세요.");return;}if(!target.getText().toString().equals(selection.source)){a.u.message("원문이 변경되어 적용하지 않았습니다. 다시 열어주세요.");return;}target.setText(selection.apply());target.setSelection(target.length());dialog.dismiss();}));dialog.show();scroll.getLayoutParams().height=height;scroll.requestLayout();refresh();
 }
 private void addSelected(){int start=preview.getSelectionStart(),end=preview.getSelectionEnd();if(!selection.addVisible(start,end)){Toast.makeText(a,"새 문구를 선택하세요. 이미 가린 곳이나 선택이 겹친 곳은 제외합니다.",Toast.LENGTH_LONG).show();return;}refresh();}
 private void refresh(){
  if(count==null)return;count.setText(selection.size()+"개 문구 선택 · 적용 전까지 원문은 유지됩니다");chosen.removeAllViews();List<PhraseSelection.Range> ranges=selection.ranges();
  for(int i=0;i<ranges.size();i++){final int index=i;PhraseSelection.Range range=ranges.get(i);Button chip=a.u.button("×  "+selection.source.substring(range.start,range.end),()->{selection.remove(index);refresh();});chip.setTextColor(a.u.clozeColor);chosen.addView(chip);}
  syncing=true;for(int i=0;i<boxes.size();i++){PhraseSelection.Range line=lines.get(i);boolean selected=false;for(PhraseSelection.Range range:ranges)if(range.start==line.start&&range.end==line.end)selected=true;boxes.get(i).setChecked(selected);}syncing=false;
  SpannableStringBuilder text=new SpannableStringBuilder(a.u.study(selection.source,17,true,false).getText());int offset=0;
  for(StudyText.Part part:StudyText.parts(selection.source,false,true)){for(PhraseSelection.Range range:ranges){int start=Math.max(range.start,part.sourceStart),end=Math.min(range.end,part.sourceEnd);if(start<end)text.setSpan(new BackgroundColorSpan(a.u.clozeTint),offset+start-part.sourceStart,offset+end-part.sourceStart,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);}offset+=part.text.length();}
  preview.setText(text);
 }
}
