package kr.memorynotes;
import org.json.*;
import java.util.*;
public class Note {
 public String id=UUID.randomUUID().toString(),subject="",chapter="",title="",body="",question="",answer="",mine="",reason="",caution="",tags="",type="일반 노트",due="";
 public boolean favorite=false; public int rating=-1,streak=0; public long updated=System.currentTimeMillis();
 public JSONArray images=new JSONArray();
 public JSONObject json()throws JSONException{
  JSONObject o=new JSONObject();o.put("id",id);o.put("subject",subject);o.put("chapter",chapter);o.put("title",title);o.put("body",body);o.put("question",question);o.put("answer",answer);o.put("mine",mine);o.put("reason",reason);o.put("caution",caution);o.put("tags",tags);o.put("type",type);o.put("due",due);o.put("favorite",favorite);o.put("rating",rating);o.put("streak",streak);o.put("updated",updated);o.put("images",images);return o;
 }
 public static Note from(JSONObject o)throws JSONException{
  Note n=new Note();n.id=o.getString("id");n.subject=o.getString("subject");n.chapter=o.optString("chapter");n.title=o.getString("title");n.body=o.optString("body");n.question=o.optString("question");n.answer=o.optString("answer");n.mine=o.optString("mine");n.reason=o.optString("reason");n.caution=o.optString("caution");n.tags=o.optString("tags");n.type=o.optString("type","일반 노트");n.due=o.optString("due");n.favorite=o.optBoolean("favorite");n.rating=o.optInt("rating",-1);n.streak=o.optInt("streak");n.updated=o.optLong("updated");n.images=o.optJSONArray("images");if(n.images==null)n.images=new JSONArray();return n;
 }
 public static void requireComplete(JSONObject o)throws JSONException{
  String[] strings={"id","subject","chapter","title","body","question","answer","mine","reason","caution","tags","type","due"};
  for(String key:strings)if(!(o.get(key) instanceof String))throw new JSONException("잘못된 노트 필드: "+key);
  for(String key:new String[]{"rating","streak","updated"}){Object v=o.get(key);if(!(v instanceof Integer)&&!(v instanceof Long))throw new JSONException("잘못된 숫자 필드: "+key);}
  if(!(o.get("favorite") instanceof Boolean)||!(o.get("images") instanceof JSONArray))throw new JSONException("필수 노트 정보가 없습니다");
 }
 public String searchable(){return title+" "+body+" "+question+" "+answer+" "+mine+" "+reason+" "+caution+" "+tags;}
}
