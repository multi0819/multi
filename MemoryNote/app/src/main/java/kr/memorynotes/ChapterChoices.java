package kr.memorynotes;
import java.util.*;
public final class ChapterChoices {
 public static final String NONE="__without_chapter__";
 public final ArrayList<String> ids=new ArrayList<>(),labels=new ArrayList<>();
 public ChapterChoices(Map<String,String> subjects,Map<String,? extends Map<String,String>> chapters,String subject){
  ids.add("");labels.add("모든 단원");ids.add(NONE);labels.add("단원 없음");
  for(Map.Entry<String,String> group:subjects.entrySet()){
   if(!subject.isEmpty()&&!subject.equals(group.getKey()))continue;Map<String,String> entries=chapters.get(group.getKey());if(entries==null)continue;
   for(Map.Entry<String,String> entry:entries.entrySet()){ids.add(entry.getKey());labels.add(subject.isEmpty()?group.getValue()+" · "+entry.getValue():entry.getValue());}
  }
 }
}
