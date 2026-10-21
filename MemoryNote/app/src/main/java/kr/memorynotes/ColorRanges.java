package kr.memorynotes;
import org.json.*;
/** Range operations shared by saved notes, editor and reading views. */
public final class ColorRanges {
 public static JSONArray replace(JSONArray ranges,int from,int to,Integer color){
  JSONArray result=new JSONArray();if(from<0||to<=from)return ranges;
  for(int i=0;i<ranges.length();i++){JSONObject r=ranges.optJSONObject(i);if(r==null)continue;int s=r.optInt("start"),e=r.optInt("end");if(e<=from||s>=to){result.put(r);continue;}if(s<from)add(result,s,from,r.optInt("color"));if(e>to)add(result,to,e,r.optInt("color"));}
  if(color!=null)add(result,from,to,color);return result;
 }
 static void add(JSONArray out,int start,int end,int color){if(end<=start)return;try{JSONObject r=new JSONObject();r.put("start",start);r.put("end",end);r.put("color",color);out.put(r);}catch(JSONException e){throw new IllegalStateException(e);}}
}
