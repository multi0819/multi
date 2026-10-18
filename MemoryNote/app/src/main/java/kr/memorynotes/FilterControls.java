package kr.memorynotes;
import android.widget.*;import java.util.*;
/** Shared subject/chapter/type/rating selection, used by search and review. */
final class FilterControls {
 final MainActivity a;final Spinner subjects,chapter,type,status;final CheckBox favorite;
 final ArrayList<String> subjectIds=new ArrayList<>();ChapterChoices chapters;Runnable changed=()->{};
 FilterControls(MainActivity a,LinearLayout parent,String initialSubject,boolean mistakes){
  this.a=a;LinkedHashMap<String,String> groups=a.db.groups("subjects",null);subjectIds.add("");subjectIds.addAll(groups.keySet());ArrayList<String> names=new ArrayList<>();names.add("모든 과목");names.addAll(groups.values());
  LinearLayout row=a.u.row(),left=a.u.col(),right=a.u.col();a.u.weighted(row,left);a.u.weighted(row,right);parent.addView(row);
  subjects=a.u.spinner(left,"과목",names.toArray(new String[0]),subjectIds.indexOf(initialSubject));subjects.setTag("filter.subject");
  chapter=a.u.spinner(right,"단원",new String[]{"모든 단원"},0);chapter.setTag("filter.chapter");chapter.setDropDownWidth(a.getResources().getDisplayMetrics().widthPixels-a.u.dp(48));reloadChapters();
  row=a.u.row();left=a.u.col();right=a.u.col();a.u.weighted(row,left);a.u.weighted(row,right);parent.addView(row);
  type=a.u.spinner(left,"유형",new String[]{"모든 유형","일반 노트","문답 카드","오답노트"},mistakes?3:0);type.setTag("filter.type");if(mistakes)type.setEnabled(false);
  status=a.u.spinner(right,"이해도",new String[]{"전체","새 노트","모름","헷갈림","외웠음"},0);status.setTag("filter.rating");
  favorite=new CheckBox(a);favorite.setText("즐겨찾기만");favorite.setTextColor(a.u.ink);parent.addView(favorite);
  subjects.setOnItemSelectedListener(a.listener(()->{reloadChapters();changed.run();}));chapter.setOnItemSelectedListener(a.listener(()->changed.run()));type.setOnItemSelectedListener(a.listener(()->changed.run()));status.setOnItemSelectedListener(a.listener(()->changed.run()));favorite.setOnCheckedChangeListener((b,value)->changed.run());
 }
 private String subject(){return subjectIds.get(Math.max(0,subjects.getSelectedItemPosition()));}
 private void reloadChapters(){LinkedHashMap<String,String> groups=a.db.groups("subjects",null);Map<String,Map<String,String>> bySubject=new LinkedHashMap<>();for(String id:groups.keySet())bySubject.put(id,a.db.groups("chapters",id));chapters=new ChapterChoices(groups,bySubject,subject());a.u.setOptions(chapter,chapters.labels.toArray(new String[0]),0);}
 NoteFilter selection(){NoteFilter f=new NoteFilter();f.subject=subject();f.chapter=chapters.ids.get(Math.max(0,Math.min(chapter.getSelectedItemPosition(),chapters.ids.size()-1)));f.type=type.getSelectedItemPosition()>0?type.getSelectedItem().toString():"";f.rating=status.getSelectedItemPosition()>0?status.getSelectedItemPosition()-2:-2;f.favoriteOnly=favorite.isChecked();return f;}
}
