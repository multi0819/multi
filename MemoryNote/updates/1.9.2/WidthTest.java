import kr.memorynotes.WidthPolicy;
public class WidthTest {public static void main(String[] a){
 if(WidthPolicy.width(-1)!=0.5f||WidthPolicy.width(100)!=30f)throw new AssertionError("range");
 if(WidthPolicy.progress(2.5f)!=4||WidthPolicy.progress(Float.NaN)!=4||WidthPolicy.progress(Float.POSITIVE_INFINITY)!=4)throw new AssertionError("fallback");
 for(int n=0;n<60;n++)if(WidthPolicy.progress(WidthPolicy.width(n))!=n)throw new AssertionError("restore "+n);
 if(!WidthPolicy.label(4).equals("2.5")||!WidthPolicy.label(59).equals("30"))throw new AssertionError("labels");
 System.out.println("PASS: 60 width roundtrips, limits, invalid saved values, labels");}}
