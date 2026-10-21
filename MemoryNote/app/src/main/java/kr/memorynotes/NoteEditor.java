package kr.memorynotes;
import android.app.*;import android.view.*;import android.widget.*;import org.json.*;import java.util.*;
public class NoteEditor {
 final MainActivity a;final Ui u;final Note note;EditText title,body,question,answer,mine,reason,caution,tags;Spinner subject,chapter,type;CheckBox favorite;LinearLayout extras,images,generalFields,mistakeFields,mineFields;String activeType;ArrayList<String> subjectIds=new ArrayList<>(),chapterIds=new ArrayList<>();boolean ready=false;
 NoteEditor(MainActivity a,Note n){this.a=a;this.u=a.u;this.note=n==null?new Note():n;if(n==null&&!a.subjectFilter.isEmpty())note.subject=a.subjectFilter;}
 void show(){
  a.shell("노트 작성","유형에 맞는 입력란으로 간단하게 정리하세요.",false);
  a.u.pictures=note.images;
  Ui u=a.u;LinearLayout p=a.content,c=u.card(p);
  LinkedHashMap<String,String> subjects=a.db.groups("subjects",null);subjectIds.addAll(subjects.keySet());
  if(subjectIds.isEmpty()){u.message("과목을 먼저 추가하세요.");a.show("과목");return;}
  subject=u.spinner(c,"과목",subjects.values().toArray(new String[0]),subjectIds.indexOf(note.subject));
  chapter=u.spinner(c,"단원",new String[]{"단원 없음"},0);refreshChapters();
  activeType=note.type;
  type=u.spinner(c,"노트 유형",new String[]{"일반 노트","문답 카드","오답노트"},Arrays.asList("일반 노트","문답 카드","오답노트").indexOf(note.type));
  u.gap(c,12);
  generalFields=u.col();c.addView(generalFields);
  title=u.edit(generalFields,"제목 *",note.title,1);
  body=u.edit(generalFields,"내용",note.body,5);addStudyControls(generalFields,body);
  ((PictureEditText)body).receiver=this::pastePictures;
  generalFields.addView(u.button("그림 붙여넣기",()->{if(!((PictureEditText)body).pastePicture())u.message("먼저 갤러리 등에서 그림을 복사한 다음 붙여넣어 주세요.");}));
  generalFields.addView(u.button("본문 그림 확대 · 가림 · 삭제",this::manageInlinePictures));
  extras=u.col();c.addView(extras);
  question=u.edit(extras,"문제 *",note.question,3);
  answer=u.edit(extras,"답 *",note.answer,5);u.studyEditor(answer,true);
  extras.addView(u.text("복습할 때는 문제가 먼저 나오고 답은 가려집니다.",13,u.muted));
  mineFields=u.col();extras.addView(mineFields);mine=u.edit(mineFields,"내가 쓴 답",note.mine,2);
  mistakeFields=u.col();c.addView(mistakeFields);
  reason=u.edit(mistakeFields,"틀린 점 · 헷갈린 이유 (선택)",note.reason,2);
  caution=u.edit(mistakeFields,"주의사항 · 다음에 확인할 것 (선택)",note.caution,2);
  LinearLayout optional=u.card(p),optionalBody=u.col();
  Button toggle=u.button("사진 · 태그 · 즐겨찾기  ▾",()->{boolean open=optionalBody.getVisibility()!=View.VISIBLE;optionalBody.setVisibility(open?View.VISIBLE:View.GONE);});optional.addView(toggle);optional.addView(optionalBody);optionalBody.setVisibility(note.images.length()>0?View.VISIBLE:View.GONE);
  tags=u.edit(optionalBody,"태그 (쉼표로 구분)",note.tags,1);
  favorite=new CheckBox(a);favorite.setText("즐겨찾기");favorite.setTextColor(u.ink);favorite.setChecked(note.favorite);optionalBody.addView(favorite);
  optionalBody.addView(u.button("＋ 갤러리에서 사진 추가",a::chooseImages));
  images=u.col();optionalBody.addView(images);drawImages();
  p.addView(u.primary("노트 저장",this::save));p.addView(u.button("작성 취소",this::leave));
  type.setOnItemSelectedListener(MainActivity.listener(()->{if(ready)switchType(type.getSelectedItem().toString());}));
  subject.setOnItemSelectedListener(MainActivity.listener(()->{if(!ready)return;String now=subjectIds.get(subject.getSelectedItemPosition());if(!now.equals(note.subject)){collectFields();note.subject=now;note.chapter="";refreshChapters();}persistDraft();}));
  chapter.setOnItemSelectedListener(MainActivity.listener(this::persistDraft));
  for(EditText field:new EditText[]{title,body,question,answer,mine,reason,caution,tags})field.addTextChangedListener(MainActivity.watcher(this::persistDraft));
  favorite.setOnCheckedChangeListener((b,on)->persistDraft());
  for(int i=0;i<8;i++){EditText field=new EditText[]{title,body,question,answer,mine,reason,caution,tags}[i];String key=new String[]{"title","body","question","answer","mine","reason","caution","tags"}[i];ColorText.bind(a,note,key,field,this::persistDraft,field!=body);}
  ready=true;applyVisibility();persistDraft();InkPage.attach(a,note,"editor",this::persistDraft);
 }
 void applyVisibility(){boolean general=EditorPolicy.isGeneral(activeType);generalFields.setVisibility(general?View.VISIBLE:View.GONE);extras.setVisibility(general?View.GONE:View.VISIBLE);boolean mistake="오답노트".equals(activeType);mineFields.setVisibility(mistake?View.VISIBLE:View.GONE);mistakeFields.setVisibility(general||mistake?View.VISIBLE:View.GONE);}
 void switchType(String next){
  if(next.equals(activeType))return;
  collectFields();EditorPolicy.prepareSwitch(note,activeType,next);
  ready=false;ColorText.replaceText(title,note.title);ColorText.replaceText(body,note.body);ColorText.replaceText(question,note.question);ColorText.replaceText(answer,note.answer);activeType=next;ready=true;
  applyVisibility();persistDraft();
 }
 void collectFields(){
  for(int i=0;i<8;i++)ColorText.collect(note,new String[]{"title","body","question","answer","mine","reason","caution","tags"}[i],new EditText[]{title,body,question,answer,mine,reason,caution,tags}[i]);
  note.title=title.getText().toString();note.body=body.getText().toString();note.question=question.getText().toString();note.answer=answer.getText().toString();note.mine=mine.getText().toString();note.reason=reason.getText().toString();note.caution=caution.getText().toString();note.tags=tags.getText().toString();note.favorite=favorite.isChecked();
 }
 void refreshChapters(){String id=subjectIds.get(subject.getSelectedItemPosition());LinkedHashMap<String,String> cm=a.db.groups("chapters",id);chapterIds.clear();chapterIds.add("");chapterIds.addAll(cm.keySet());ArrayList<String> names=new ArrayList<>();names.add("단원 없음");names.addAll(cm.values());a.u.setOptions(chapter,names.toArray(new String[0]),Math.max(0,chapterIds.indexOf(note.chapter)));}
 void addStudyControls(LinearLayout parent,EditText target){
  a.u.studyEditor(target,true);
  parent.addView(a.u.answerButton("선택한 전체 블록을 답으로 지정",()->markAnswer(target)));
  parent.addView(a.u.clozeButton("가림 문구 여러 개 설정",()->new PhraseSelectionDialog(a,target).show()));
  parent.addView(a.u.text("답은 파랑, 가림 문구는 주황으로 표시됩니다. 여러 문구를 선택한 후 한 번에 적용하세요.",12,a.u.muted));
  target.setCustomSelectionActionModeCallback(new ActionMode.Callback(){
   public boolean onCreateActionMode(ActionMode mode,Menu menu){menu.add(0,901,0,"답 지정");menu.add(0,902,1,"가림 설정");menu.add(0,903,2,"글자색");return true;}
   public boolean onPrepareActionMode(ActionMode mode,Menu menu){return false;}
   public boolean onActionItemClicked(ActionMode mode,MenuItem item){if(item.getItemId()==903){ColorText.choose(a,note,"body",target,NoteEditor.this::persistDraft);mode.finish();return true;}if(item.getItemId()==901){markAnswer(target);mode.finish();return true;}if(item.getItemId()==902){new PhraseSelectionDialog(a,target).show();mode.finish();return true;}return false;}
   public void onDestroyActionMode(ActionMode mode){}
  });
 }
 void markAnswer(EditText target){try{int start=target.getSelectionStart(),end=target.getSelectionEnd();String marked=PhraseSelection.markAnswer(target.getText().toString(),start,end);if(!marked.equals(target.getText().toString())){target.getText().insert(end,"]]");target.getText().insert(start,"[[");}target.setSelection(Math.min(end+4,target.length()));}catch(IllegalArgumentException e){a.u.message(e.getMessage());}}
 void wrap(EditText e){int start=e.getSelectionStart(),end=e.getSelectionEnd();if(start<0||end<=start){a.u.message("먼저 외울 문구를 길게 눌러 선택하세요.");return;}String selected=e.getText().subSequence(start,end).toString();if(selected.contains("{{")||selected.contains("}}")){a.u.message("이미 빈칸으로 지정한 부분은 제외하고 선택하세요.");return;}e.getText().replace(start,end,"{{"+selected+"}}");}
 void collect(){if(!ready)return;collectFields();note.type=activeType;note.title=EditorPolicy.titleFor(activeType,note.title,note.question);note.subject=subjectIds.get(subject.getSelectedItemPosition());note.chapter=chapterIds.get(Math.max(0,chapter.getSelectedItemPosition()));}
 void persistDraft(){if(!ready)return;collect();try{a.getPreferences(0).edit().putString("draft",note.json().toString()).apply();}catch(Exception e){android.util.Log.e("MemoryNote","draft",e);}}
 void save(){if(a.busy){a.u.message("사진을 가져오는 중입니다. 잠시 후 저장하세요.");return;}collect();if(EditorPolicy.isGeneral(note.type)&&note.title.trim().isEmpty()){title.setError("제목을 입력하세요");title.requestFocus();return;}if(!note.type.equals("일반 노트")&&(note.question.trim().isEmpty()||note.answer.trim().isEmpty())){a.u.message("문답 카드와 오답노트에는 문제와 정답을 입력하세요.");return;}try{a.db.save(note);a.getPreferences(0).edit().remove("draft").apply();a.detail(note);}catch(Exception e){a.error(e);}}
 void leave(){persistDraft();new AlertDialog.Builder(a).setTitle("작성을 마칠까요?").setMessage("임시 저장하면 홈에서 이어 쓸 수 있습니다.").setNegativeButton("계속 작성",null).setNeutralButton("임시 저장 후 나가기",(d,w)->a.show("홈")).setPositiveButton("초안 버리기",(d,w)->{a.getPreferences(0).edit().remove("draft").apply();a.show("홈");}).show();}
 void manageInlinePictures(){
  ArrayList<JSONObject> pictures=new ArrayList<>();ArrayList<String> labels=new ArrayList<>();
  for(int i=0;i<note.images.length();i++){JSONObject im=note.images.optJSONObject(i);if(im!=null&&InlineImageText.isReferenced(body.getText().toString(),answer.getText().toString(),im.optString("file"))){pictures.add(im);labels.add("본문 그림 "+pictures.size());}}
  if(pictures.isEmpty()){a.u.message("내용에 붙여넣은 그림이 없습니다.");return;}
  new AlertDialog.Builder(a).setTitle("본문 그림 선택").setItems(labels.toArray(new String[0]),(d,which)->{
   JSONObject image=pictures.get(which);new AlertDialog.Builder(a).setTitle(labels.get(which)).setItems(new String[]{"확대 · 가림 설정","본문에서 그림 삭제"},(dialog,action)->{
    if(action==0)ImageMaskView.dialog(a,image,true,()->{persistDraft();InlineImages.apply(a.u,body,body.getText(),false);body.invalidate();});
    else a.u.confirm("본문 그림 삭제","이 그림을 본문에서 제거할까요?",()->{String token=InlineImageText.marker(image.optString("file"));ColorText.replaceText(body,body.getText().toString().replace(token,""));ColorText.replaceText(answer,answer.getText().toString().replace(token,""));for(int i=note.images.length()-1;i>=0;i--)if(note.images.optJSONObject(i)==image)note.images.remove(i);persistDraft();drawImages();});
   }).show();
  }).show();
 }
 void pastePictures(java.util.List<android.net.Uri> uris,Runnable release){
  if(a.busy){release.run();a.u.message("사진을 가져오는 중입니다. 잠시 후 다시 붙여넣어 주세요.");return;}
  int from=Math.max(0,body.getSelectionStart()),to=Math.max(from,body.getSelectionEnd());
  final Object anchor=new Object();body.getText().setSpan(anchor,from,to,android.text.Spanned.SPAN_EXCLUSIVE_INCLUSIVE);
  a.startBusy("그림을 붙여넣는 중입니다…");
  new Thread(()->{ArrayList<String> files=new ArrayList<>();Exception failure=null;
   try{for(android.net.Uri uri:uris)files.add(ImageMaskView.importImage(a,uri));}catch(Exception ex){failure=ex;}finally{try{release.run();}catch(Exception ignored){}}
   final Exception error=failure;
   a.runOnUiThread(()->{a.endBusy();
    if(error!=null||a.editor!=this){for(String file:files)new java.io.File(new java.io.File(a.getFilesDir(),"images"),file).delete();body.getText().removeSpan(anchor);if(error!=null)a.error(error);return;}
    try{StringBuilder inserted=new StringBuilder("\n");for(String file:files){JSONObject im=new JSONObject();im.put("file",file);im.put("masks",new JSONArray());note.images.put(im);inserted.append(InlineImageText.marker(file)).append('\n');}
     android.text.Editable text=body.getText();int start=text.getSpanStart(anchor),end=text.getSpanEnd(anchor);text.removeSpan(anchor);if(start<0){start=text.length();end=start;}text.replace(start,Math.max(start,end),inserted.toString());body.setSelection(start+inserted.length());persistDraft();drawImages();
    }catch(Exception ex){a.error(ex);}
   });
  }).start();
 }
 void addImage(String file){try{JSONObject image=new JSONObject();image.put("file",file);image.put("masks",new JSONArray());note.images.put(image);persistDraft();if(a.editor==this)drawImages();}catch(Exception e){a.error(e);}}
 void drawImages(){images.removeAllViews();for(int i=0;i<note.images.length();i++){final int index=i;try{JSONObject image=note.images.getJSONObject(i);if(InlineImageText.isReferenced(body.getText().toString(),answer.getText().toString(),image.optString("file")))continue;ImageMaskView view=new ImageMaskView(a,image,false,false);view.setTag("ink:image:"+image.optString("file"));images.addView(view,new LinearLayout.LayoutParams(-1,a.u.dp(230)));LinearLayout row=a.u.row();a.u.weighted(row,a.u.button("확대 · 가림 설정",()->ImageMaskView.dialog(a,image,true,()->{persistDraft();drawImages();})));a.u.weighted(row,a.u.button("첨부 제거",()->a.u.confirm("사진 제거","이 노트에서 사진을 제거할까요?",()->{String token=InlineImageText.marker(image.optString("file"));ColorText.replaceText(body,body.getText().toString().replace(token,""));ColorText.replaceText(answer,answer.getText().toString().replace(token,""));note.images.remove(index);persistDraft();drawImages();})));images.addView(row);}catch(Exception e){a.error(e);}}}
}
