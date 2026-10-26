package kr.memorynotes;
public class PdfCaptureTest {
 static void ok(boolean b,String m){if(!b)throw new AssertionError(m);}
 public static void main(String[] args)throws Exception{
 String f="00000000-0000-0000-0000-000000000001.img",g="00000000-0000-0000-0000-000000000002.img";
 Note first=PdfCaptureNotes.prepare(null,0,"냉매의 성질","hvac","chapter",f);ok(first.title.equals("냉매의 성질")&&first.images.length()==1,"new problem");
 Note statement=PdfCaptureNotes.prepare(first,1,"ignored","","",g);ok(statement.id.equals(first.id)&&statement.images.length()==2&&first.images.length()==1,"append must detach old arrays");
 Note solution=PdfCaptureNotes.prepare(statement,2,"","","",g);ok(solution.images.getJSONObject(2).getJSONArray("masks").getJSONArray(0).getInt(2)==1,"solution mask");ok(solution.body.contains("【풀이】"),"solution section");
 Note next=PdfCaptureNotes.prepare(solution,0,"다음 문제","hvac","",f);ok(!next.id.equals(solution.id)&&next.images.length()==1,"problem must always start new note");
 boolean refused=false;try{PdfCaptureNotes.prepare(null,2,"","","",f);}catch(IllegalStateException e){refused=true;}ok(refused,"orphan solution must refuse");
 String original="사용자 메모\n"+PdfClipRules.block(1,"MARKER")+"뒤쪽 메모";String moved=PdfClipRules.move(original,1,2,"MARKER");ok(moved.startsWith("사용자 메모")&&moved.endsWith("뒤쪽 메모")&&moved.contains("【풀이】"),"move preserves neighbors");ok(PdfClipRules.undo(moved,2,"MARKER").equals("사용자 메모\n뒤쪽 메모"),"undo exact addition");
 refused=false;try{PdfClipRules.undo("편집한 내용",1,"MARKER");}catch(IllegalStateException e){refused=true;}ok(refused,"edited clip must not delete arbitrary content");
 System.out.println("PASS: new-problem routing, append/deep-copy, solution masks, next-note creation, orphan guard, move/undo preservation");
 }
}
