package kr.memorynotes;
public final class Cloze {
 public static String mask(String s){return StudyText.plain(s,true);}
 public static String reveal(String s){return StudyText.plain(s,false);}
}
