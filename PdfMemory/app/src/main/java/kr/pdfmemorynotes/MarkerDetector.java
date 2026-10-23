package kr.pdfmemorynotes;
import java.util.*;
/** Conservative recognition of the uploaded textbook's colored question digits and answer rules. */
public final class MarkerDetector {
 public interface Pixels {int get(int x,int y);}
 public static class Marks {public final List<Float> questions=new ArrayList<>(),answers=new ArrayList<>();}
 static boolean cyan(int c,int diff){int r=c>>16&255,g=c>>8&255,b=c&255;return b-r>diff&&g-r>(diff==45?30:8)&&b>145&&(diff!=45||r<145);}
 public static Marks detect(Pixels px,int w,int h){Marks out=new Marks();int start=-1,last=-1,minX=w,maxX=0;
  for(int y=(int)(h*.01);y<(int)(h*.94);y++){int lo=w,hi=0,n=0;for(int x=(int)(w*.05);x<(int)(w*.23);x++){if(cyan(px.get(x,y),45)){lo=Math.min(lo,x);hi=Math.max(hi,x);n++;}}
   if(n>=2){if(start<0||y-last>3){if(start>=0)component(out,w,h,start,last,minX,maxX);start=y;minX=lo;maxX=hi;}else{minX=Math.min(minX,lo);maxX=Math.max(maxX,hi);}last=y;}
   int colored=0;for(int x=(int)(w*.07);x<(int)(w*.85);x+=2)if(cyan(px.get(x,y),12))colored++;
   if(colored>w*.17)add(out.answers,(float)y/h);
  }
  if(start>=0)component(out,w,h,start,last,minX,maxX);Collections.sort(out.questions);Collections.sort(out.answers);return out;
 }
 static void add(List<Float> a,float y){for(float old:a)if(Math.abs(old-y)<.04f)return;a.add(Math.max(.005f,y-.004f));}
 static void component(Marks m,int w,int h,int y,int last,int l,int r){float width=(float)(r-l)/w,height=(float)(last-y)/h,left=(float)l/w;if(height>.004f&&height<.02f){if(width>.007f&&width<.026f&&left<.185f)add(m.questions,(float)y/h);else if(width>.028f&&width<.065f)add(m.answers,(float)y/h);}}
 public static List<Splitter.Line> merge(List<Splitter.Line> input,Marks m,int page,int[] next){List<Splitter.Line> out=new ArrayList<>();for(Splitter.Line l:input){l.blue=false;for(float y:m.answers)if(l.left<.35f&&Math.abs(l.top-y)<.05f)l.text=l.text.replaceFirst("^(해\\s*[답설]|정\\s*답)\\s*[:：]?\\s*", "");if(!l.text.trim().isEmpty())out.add(l);}for(float top:m.questions){int n=next[0]++;String nearest="";float distance=1;for(Splitter.Line l:input)if(l.left<.27f&&Math.abs(l.top-top)<distance){distance=Math.abs(l.top-top);nearest=l.text;}Splitter.Line q=new Splitter.Line(page,.10f,top,.13f,top+.015f,String.format(java.util.Locale.ROOT,"%02d",n),true);q.inferred=distance>.04f||!nearest.trim().matches("^0?"+n+"(?:\\D.*|$)");out.add(q);}for(float top:m.answers)out.add(new Splitter.Line(page,.1f,top,.14f,top+.02f,"해설",false));return out;}
}
