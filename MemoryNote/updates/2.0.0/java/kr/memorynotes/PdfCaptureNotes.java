package kr.memorynotes;
import org.json.*;
/** Builds a detached note so failed saves cannot mutate the old note/image arrays. */
public final class PdfCaptureNotes {
 public static Note prepare(Note old,int role,String title,String subject,String chapter,String file)throws Exception{
  PdfClipRules.label(role);if(role!=0&&old==null)throw new IllegalStateException("먼저 문제를 추가해 주세요.");
  Note n=role==0?new Note():Note.from(new JSONObject(old.json().toString()));
  if(role==0){if(title.trim().isEmpty())throw new IllegalArgumentException("문제 제목을 입력해 주세요.");n.title=title;n.subject=subject;n.chapter=chapter;n.type="일반 노트";}
  JSONArray masks=new JSONArray();if(role==2)masks.put(new JSONArray().put(0).put(0).put(1).put(1));
  n.images.put(new JSONObject().put("file",file).put("masks",masks));n.body=PdfClipRules.append(n.body,role,InlineImageText.marker(file));return n;
 }
}
