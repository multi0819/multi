package kr.memorynotes;
import org.json.*;
public class PdfDocumentRulesTest{
 static int checks;static void ok(boolean b){checks++;if(!b)throw new AssertionError();}
 public static void main(String[] args)throws Exception{JSONObject doc=new JSONObject().put("id","a").put("page",673);PdfDocumentRules.matchBook(doc,673,940);ok(PdfDocumentRules.bookPage(doc,673)==940);ok(PdfDocumentRules.pdfPage(doc,"940",977)==673);for(String bad:new String[]{"0","1244","abc","999999999999999999999"})try{PdfDocumentRules.pdfPage(doc,bad,977);throw new AssertionError();}catch(IllegalArgumentException e){checks++;}
 PdfDocumentRules.bookmark(doc,673,"公式","공식");PdfDocumentRules.bookmark(doc,673,"전열면적","중요");ok(doc.getJSONArray("bookmarks").length()==1);ok(doc.getJSONArray("bookmarks").getJSONObject(0).getString("title").equals("전열면적"));
 JSONObject second=new JSONObject().put("id","b");JSONArray before=new JSONArray().put(doc).put(second);JSONArray after=PdfDocumentRules.without(before,"a");ok(before.length()==2&&after.length()==1&&after.getJSONObject(0).getString("id").equals("b"));after.getJSONObject(0).put("name","changed");ok(!second.has("name"));
 JSONObject record=new JSONObject().put("doc","a").put("clips",new JSONArray().put(new JSONObject().put("doc","b").put("file","image.img")));ok(PdfDocumentRules.uses(record,"a"));ok(PdfDocumentRules.uses(record,"b"));ok(!PdfDocumentRules.uses(record,"c"));ok(record.getJSONArray("clips").getJSONObject(0).getString("file").equals("image.img"));ok(PdfDocumentRules.size(400L*1024*1024).equals("400.0 MB"));System.out.println("PASS "+checks+" document rules assertions");}
}
