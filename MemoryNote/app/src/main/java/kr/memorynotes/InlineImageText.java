package kr.memorynotes;
import java.util.*;import java.util.regex.*;
/** Stable inline references; filenames are restricted to app-created image IDs. */
public final class InlineImageText {
 static final Pattern PATTERN=Pattern.compile("〔사진:([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\\.img)〕");
 public static String marker(String file){return "〔사진:"+file+"〕";}
 public static List<String> files(String text){ArrayList<String> result=new ArrayList<>();Matcher m=PATTERN.matcher(text);while(m.find())result.add(m.group(1));return result;}
 public static boolean isReferenced(String body,String answer,String file){return files(body+"\n"+answer).contains(file);}
 public static String readable(String text){return PATTERN.matcher(text).replaceAll("[사진]");}
 public static String remap(String text,Map<String,String> mapping){Matcher m=PATTERN.matcher(text);StringBuffer b=new StringBuffer();while(m.find())m.appendReplacement(b,Matcher.quoteReplacement(marker(mapping.getOrDefault(m.group(1),m.group(1)))));m.appendTail(b);return b.toString();}
}
