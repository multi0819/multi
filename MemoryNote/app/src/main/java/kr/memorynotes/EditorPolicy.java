package kr.memorynotes;

/** The stored schema stays compatible; only the visible input form changes by type. */
public final class EditorPolicy {
 public static boolean isGeneral(String type){return "일반 노트".equals(type);}
 public static String titleFor(String type,String title,String question){
  if(isGeneral(type))return title.trim();
  String first=question.trim().split("\\R",2)[0];
  int count=first.codePointCount(0,first.length());return count>80?first.substring(0,first.offsetByCodePoints(0,80)):first;
 }
 public static void prepareSwitch(Note n,String from,String to){
  if(isGeneral(from)&&!isGeneral(to)){
   if(n.question.trim().isEmpty())n.question=n.title;
   if(n.answer.trim().isEmpty())n.answer=n.body;
  }else if(!isGeneral(from)&&isGeneral(to)){
   if(n.title.trim().isEmpty())n.title=titleFor(from,"",n.question);
   if(n.body.trim().isEmpty())n.body=n.answer;
  }
 }
}
