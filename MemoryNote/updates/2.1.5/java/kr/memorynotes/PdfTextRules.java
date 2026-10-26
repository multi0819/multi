package kr.memorynotes;
import java.util.List;
/** PDF point normalization and text chunk joining without destroying OCR line breaks. */
public final class PdfTextRules{
 public static boolean finite(float n){return !Float.isNaN(n)&&!Float.isInfinite(n);}
 public static float unit(float n){if(!finite(n))throw new IllegalArgumentException("잘못된 선택 좌표");return Math.max(0,Math.min(1,n));}
 public static int coordinate(float fraction,int extent){if(extent<1)throw new IllegalArgumentException("페이지 크기 오류");return Math.min(extent-1,Math.round(unit(fraction)*extent));}
 public static String join(List<String> chunks){StringBuilder out=new StringBuilder();for(String text:chunks){if(text==null||text.isEmpty())continue;if(out.length()>0&&!Character.isWhitespace(out.charAt(out.length()-1))&&!Character.isWhitespace(text.charAt(0)))out.append('\n');out.append(text);}return out.toString();}
}
