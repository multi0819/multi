package kr.memorynotes;
/** Automatic title only; captured content itself is never shortened. */
public final class PdfCaptureTitle {
 public static String automatic(String text,int number,int page){if(text!=null){String trimmed=text.trim();if(!trimmed.isEmpty()){String line=trimmed.split("\\r?\\n",2)[0].trim();int size=line.codePointCount(0,line.length());return size>80?line.substring(0,line.offsetByCodePoints(0,80)):line;}}return "문제 "+number+" · "+page+"쪽";}
}
