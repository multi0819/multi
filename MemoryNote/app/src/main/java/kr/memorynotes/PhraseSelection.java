package kr.memorynotes;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/** A set of independent selections, applied together from the end of the saved text. */
public final class PhraseSelection {
 public final String source;
 public static final class Range {public final int start,end;Range(int start,int end){this.start=start;this.end=end;}}
 private final ArrayList<Range> selected=new ArrayList<>();
 public PhraseSelection(String source){this.source=source;}
 public List<Range> ranges(){return new ArrayList<>(selected);}
 public int size(){return selected.size();}
 public void clear(){selected.clear();}
 public void remove(int index){selected.remove(index);}
 public boolean add(int start,int end){
  if(start<0||end>source.length()||start>=end)return false;
  while(start<end&&Character.isWhitespace(source.charAt(start)))start++;
  while(end>start&&Character.isWhitespace(source.charAt(end-1)))end--;
  if(start==end)return false;
  String text=source.substring(start,end);
  if(text.contains("{{")||text.contains("}}")||text.contains("[[")||text.contains("]]"))return false;
  for(StudyText.Part p:StudyText.parts(source,false,false))if(p.kind==StudyText.CLOZE&&start<p.sourceEnd+2&&end>p.sourceStart-2)return false;
  for(Range r:selected)if(start<r.end&&end>r.start)return false;
  selected.add(new Range(start,end));return true;
 }
 public boolean addVisible(int start,int end){
  if(start<0||start>=end)return false;
  int position=0,rawStart=-1,rawEnd=-1;
  for(StudyText.Part p:StudyText.parts(source,false,false)){
   int next=position+p.text.length();
   if(start>=position&&start<next)rawStart=p.sourceStart+start-position;
   if(end>position&&end<=next)rawEnd=p.sourceStart+end-position;
   position=next;
  }
  return rawStart>=0&&rawEnd>=0&&add(rawStart,rawEnd);
 }
 public List<Range> lines(){
  ArrayList<Range> out=new ArrayList<>();int start=0;
  while(start<source.length()){
   int end=source.indexOf('\n',start);if(end<0)end=source.length();int a=start,b=end;
   while(a<b&&Character.isWhitespace(source.charAt(a)))a++;
   while(b>a&&Character.isWhitespace(source.charAt(b-1)))b--;
   if(source.startsWith("[[",a))a+=2;
   if(b>=a+2&&source.substring(a,b).endsWith("]]"))b-=2;
   if(a<b){PhraseSelection trial=new PhraseSelection(source);if(trial.add(a,b))out.add(new Range(a,b));}
   start=end+1;
  }
  return out;
 }
 public void selectLines(){for(Range r:lines())add(r.start,r.end);}
 public String apply(){
  ArrayList<Range> ranges=new ArrayList<>(selected);ranges.sort(Comparator.comparingInt((Range r)->r.start).reversed());
  StringBuilder result=new StringBuilder(source);for(Range r:ranges){result.insert(r.end,"}}");result.insert(r.start,"{{");}return result.toString();
 }
 public static String markAnswer(String source,int start,int end){
  if(start<0||end>source.length()||start>=end)throw new IllegalArgumentException("먼저 답으로 지정할 부분을 선택하세요.");
  java.util.regex.Matcher answers=java.util.regex.Pattern.compile("(?s)\\[\\[(.*?)\\]\\]").matcher(source);
  while(answers.find()){
   if(start>=answers.start()+2&&end<=answers.end()-2)return source;
   if(start<answers.end()&&end>answers.start())throw new IllegalArgumentException("이미 답으로 지정한 영역과 겹칩니다. 답 영역 안쪽만 선택하세요.");
  }
  String part=source.substring(start,end);
  if(part.contains("[[")||part.contains("]]"))throw new IllegalArgumentException("이미 답으로 지정한 영역은 제외하고 선택하세요.");
  for(StudyText.Part p:StudyText.parts(source,false,false))if(p.kind==StudyText.CLOZE){int a=p.sourceStart-2,b=p.sourceEnd+2;if((start>a&&start<b)||(end>a&&end<b))throw new IllegalArgumentException("가림 문구 전체를 포함해 선택하세요.");}
  return source.substring(0,start)+"[["+part+"]]"+source.substring(end);
 }
}
