package kr.pdfmemorynotes;
import java.util.*;import java.util.regex.*;
public final class Splitter {
 public static class Line {public int page;public float left,top,right,bottom;public String text;public boolean blue,inferred;public Line(int p,float l,float t,float r,float b,String s,boolean blue){page=p;left=l;top=t;right=r;bottom=b;text=s;this.blue=blue;}}
 public static class Part {public int page;public float top,bottom;public Part(int p,float t,float b){page=p;top=t;bottom=b;}}
 public static class Card {public String key,number,question="",answer="";public boolean uncertain;public final List<Part> questionParts=new ArrayList<>(),answerParts=new ArrayList<>();}
 static final Pattern NUMBER=Pattern.compile("^([0-9OIl]{1,2})(?:[.．、:]?\\s+|$)(.*)$"), ANSWER=Pattern.compile("^(해\\s*[답설]|정\\s*답)(?:\\s|[:：\\]）)]|$).*");
 static String number(Line l){if(l.left>.26f||l.top>.9f)return null;String s=l.text.trim();Matcher m=NUMBER.matcher(s);if(m.matches()&&l.blue){String n=m.group(1).replace('O','0').replace('I','1').replace('l','1');int v=Integer.parseInt(n);if(v>0&&v<100)return String.valueOf(v);}return null;}
 static boolean answer(Line l){return l.left<.35f&&ANSWER.matcher(l.text.trim()).matches();}
 static void part(Card c,boolean a,int page,float t,float b){t=Math.max(.015f,t);b=Math.min(.94f,b);if(c!=null&&PagePolicy.validCrop(t,b))(a?c.answerParts:c.questionParts).add(new Part(page,t,b));}
 public interface PageSource {List<Line> load(int page);}
 public static List<Card> split(List<Line> lines,int pages){List<Card> cards=new ArrayList<>();scan(p->{List<Line> a=new ArrayList<>();for(Line l:lines)if(l.page==p)a.add(l);return a;},pages,cards::add);return cards;}
 static void append(StringBuilder b,String s,Card c){if(b.length()+s.length()<200000)b.append(s).append('\n');else c.uncertain=true;}
 static void emit(Card c,StringBuilder q,StringBuilder a,java.util.function.Consumer<Card> sink){if(c==null)return;c.question=q.toString().trim();c.answer=a.toString().trim();if(c.answerParts.isEmpty()||c.question.isEmpty())c.uncertain=true;sink.accept(c);q.setLength(0);a.setLength(0);}
 public static void scan(PageSource source,int pages,java.util.function.Consumer<Card> sink){Card current=null;boolean inAnswer=false;Set<String> used=new HashSet<>();int previous=0;StringBuilder q=new StringBuilder(),a=new StringBuilder();
  for(int page=0;page<pages;page++){List<Line> ls=source.load(page);ls.sort(Comparator.comparingDouble((Line l)->l.top).thenComparingDouble(l->l.left));float from=.015f;
   if(current!=null&&current.number.startsWith("페이지 ")){emit(current,q,a,sink);current=null;inAnswer=false;}
   if(ls.isEmpty()&&current!=null)current.uncertain=true;
   for(Line l:ls){if(l.top>=.94f)continue;String n=number(l);
    if(n!=null){int value=Integer.parseInt(n);boolean gap=previous!=0&&value!=previous+1;if(gap&&current!=null)current.uncertain=true;if(!(from<=.015f&&l.top<.25f))part(current,inAnswer,page,from,l.top-.008f);emit(current,q,a,sink);current=new Card();current.number=n;current.key=page+":"+Math.round(l.top*10000);current.uncertain=l.inferred||used.contains(n)||gap||(previous==0&&value!=1);used.add(n);previous=value;inAnswer=false;from=l.top;}
    else if(answer(l)&&current!=null){if(!inAnswer){if(!(from<=.015f&&l.top<.08f))part(current,false,page,from,l.top-.006f);inAnswer=true;from=l.top;}else current.uncertain=true;continue;}
    if(current!=null){if(l.left>.35f&&l.blue&&NUMBER.matcher(l.text.trim()).matches())current.uncertain=true;if(n==null||!l.text.trim().matches("[0-9]{1,2}"))append(inAnswer?a:q,l.text,current);}
   }
   if(current==null){current=new Card();current.number="페이지 "+(page+1);current.key=page+":fallback";current.uncertain=true;for(Line l:ls)append(q,l.text,current);}
   part(current,inAnswer,page,from,.94f);
  }
  emit(current,q,a,sink);
 }
}
