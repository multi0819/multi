package kr.memorynotes;
public final class Cloze {
 public static String mask(String s){return s.replaceAll("(?s)\\{\\{(.+?)\\}\\}","[•••]");}
 public static String reveal(String s){return s.replaceAll("(?s)\\{\\{(.+?)\\}\\}","$1");}
}
