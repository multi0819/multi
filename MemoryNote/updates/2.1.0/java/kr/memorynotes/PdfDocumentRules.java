package kr.memorynotes;
import org.json.*;import java.util.*;
/** Storage-independent PDF metadata operations; never mutates note bodies or images. */
public final class PdfDocumentRules {
 public static int bookPage(JSONObject doc,int page){long n=(long)page+1+doc.optInt("bookOffset",0);if(n<Integer.MIN_VALUE||n>Integer.MAX_VALUE)throw new IllegalArgumentException("쪽수 범위를 확인해 주세요.");return (int)n;}
 public static int pdfPage(JSONObject doc,String text,int count){try{long n=Long.parseLong(text.trim())-doc.optInt("bookOffset",0)-1;if(n<0||n>=count)throw new IllegalArgumentException();return (int)n;}catch(Exception e){throw new IllegalArgumentException("연결된 책 쪽수 범위를 확인해 주세요.");}}
 public static void matchBook(JSONObject doc,int pdfPage,int bookPage)throws Exception{if(pdfPage<0||bookPage<1)throw new IllegalArgumentException("쪽수는 1 이상이어야 합니다.");doc.put("bookOffset",bookPage-(pdfPage+1));}
 public static boolean uses(JSONObject record,String doc){if(record==null)return false;if(doc.equals(record.optString("doc")))return true;JSONArray clips=record.optJSONArray("clips");if(clips!=null)for(int i=0;i<clips.length();i++)if(doc.equals(clips.optJSONObject(i).optString("doc")))return true;return false;}
 public static JSONArray without(JSONArray docs,String id)throws Exception{JSONArray out=new JSONArray();for(int i=0;i<docs.length();i++){JSONObject d=docs.getJSONObject(i);if(!id.equals(d.getString("id")))out.put(new JSONObject(d.toString()));}return out;}
 public static JSONArray bookmarks(JSONObject doc)throws Exception{JSONArray list=doc.optJSONArray("bookmarks");if(list==null){list=new JSONArray();doc.put("bookmarks",list);}return list;}
 public static void bookmark(JSONObject doc,int page,String title,String category)throws Exception{JSONArray list=bookmarks(doc);for(int i=0;i<list.length();i++)if(list.getJSONObject(i).optInt("page",-1)==page){list.getJSONObject(i).put("title",title).put("category",category);return;}list.put(new JSONObject().put("page",page).put("title",title).put("category",category));}
 public static String size(long bytes){if(bytes<1024)return bytes+" B";if(bytes<1048576)return String.format(Locale.KOREA,"%.1f KB",bytes/1024.0);if(bytes<1073741824)return String.format(Locale.KOREA,"%.1f MB",bytes/1048576.0);return String.format(Locale.KOREA,"%.2f GB",bytes/1073741824.0);}
}
