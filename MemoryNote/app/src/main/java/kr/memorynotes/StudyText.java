package kr.memorynotes;

import java.util.ArrayList;
import java.util.List;

/** Parses saved answer blocks and cloze markup without changing the stored note schema. */
public final class StudyText {
 public static final int NORMAL=0, ANSWER=1, CLOZE=2;
 public static final class Part {
  public final String text; public final int kind; public final int sourceStart,sourceEnd;
  Part(String text,int kind,int start,int end){this.text=text;this.kind=kind;this.sourceStart=start;this.sourceEnd=end;}
 }
 public static List<Part> parts(String source,boolean masked,boolean defaultAnswer){
  ArrayList<Part> parts=new ArrayList<>();
  // A note without explicit answer blocks keeps the original title/body structure.
  boolean explicit=source.contains("[[")&&source.indexOf("]]",source.indexOf("[[")+2)>=0;
  parse(source,0,source.length(),masked,defaultAnswer&&!explicit?ANSWER:NORMAL,parts);
  return parts;
 }
 private static void parse(String s,int from,int to,boolean masked,int kind,List<Part> parts){
  int i=from,plain=from;
  while(i<to){
   boolean answer=s.startsWith("[[",i),cloze=s.startsWith("{{",i);
   String close=answer?"]]":cloze?"}}":null;
   int end=close==null?-1:s.indexOf(close,i+2);
   if(end>=0&&end+2<=to){
    if(plain<i)parts.add(new Part(s.substring(plain,i),kind,plain,i));
    if(cloze)parts.add(new Part(masked?"[•••]":s.substring(i+2,end),CLOZE,i+2,end));
    else parse(s,i+2,end,masked,ANSWER,parts);
    i=end+2;plain=i;
   }else i++;
  }
  if(plain<to)parts.add(new Part(s.substring(plain,to),kind,plain,to));
 }
 public static String plain(String source,boolean masked){StringBuilder b=new StringBuilder();for(Part p:parts(source,masked,false))b.append(p.text);return b.toString();}
}
