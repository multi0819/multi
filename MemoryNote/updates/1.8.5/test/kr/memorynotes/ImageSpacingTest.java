package kr.memorynotes;
public class ImageSpacingTest {
 public static void main(String[] args){String[] blanks={"","\n","\n\n\n"," \r\n\t","\u00a0\u3000"};for(String s:blanks)if(ImageSpacing.visibleLength(s)!=0)throw new AssertionError("empty photo separator");String s="\n문제 설명\n";if(ImageSpacing.visibleLength(s)!=s.length())throw new AssertionError("real text must retain spans/positions");System.out.println("PASS: photo separator blank lines omitted, actual text retained");}
}
