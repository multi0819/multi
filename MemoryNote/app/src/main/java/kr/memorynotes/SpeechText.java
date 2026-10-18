package kr.memorynotes;

/** Text sent to speech contains neither colour nor cloze markup. */
public final class SpeechText {
 private SpeechText(){}
 public static boolean eligible(int imageCount){return imageCount==0;}
 public static String clean(String text){return StudyText.plain(text,false).trim();}
 public static String question(String type,String title,String body,String question){
  if(!type.equals("일반 노트")&&!clean(title).isEmpty()&&clean(question).startsWith(clean(title)))return clean(question);
  String source=type.equals("일반 노트")?body:question;
  StringBuilder text=new StringBuilder();
  for(StudyText.Part p:StudyText.parts(source,false,false))text.append(p.kind==StudyText.NORMAL?p.text:"빈칸");
  return clean(title)+(text.toString().trim().isEmpty()?"":". "+text.toString().trim());
 }
 public static String answer(String type,String body,String answer){
  String text=clean(type.equals("일반 노트")?body:answer);
  return text.isEmpty()?"":"정답. "+text;
 }
}
