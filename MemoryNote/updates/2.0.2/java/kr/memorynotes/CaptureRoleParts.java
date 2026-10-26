package kr.memorynotes;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Recognizes only complete capture heading lines; offsets refer to rendered text. */
public final class CaptureRoleParts {
 private static final Pattern HEADER=Pattern.compile("(?m)^【(문제|지문|풀이)】[\\t ]*(?:\\r?\\n|$)");
 public static final class Part {
  public final int role,start,end;
  Part(int role,int start,int end){this.role=role;this.start=start;this.end=end;}
 }
 public static List<Part> split(CharSequence text,int currentRole){
  ArrayList<Part> out=new ArrayList<Part>();Matcher m=HEADER.matcher(text);int start=0,role=currentRole;
  while(m.find()){
   if(m.start()>start)out.add(new Part(role,start,m.start()));
   role="문제".equals(m.group(1))?0:"지문".equals(m.group(1))?1:2;
   // A zero-length part preserves a role transition before an image-only block.
   out.add(new Part(role,m.end(),m.end()));start=m.end();
  }
  if(start<text.length())out.add(new Part(role,start,text.length()));
  return out;
 }
 public static boolean hasHeading(CharSequence text){return HEADER.matcher(text).find();}
 public static String title(int role){return role==0?"문제":role==1?"지문":role==2?"풀이":"내용";}
}
