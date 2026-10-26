package kr.memorynotes;
/** One-based page input and bounded, wrapping document search order. */
public final class PdfNavigation {
 public static int page(String text,int count){try{int n=Integer.parseInt(text.trim());if(n<1||n>count)throw new IllegalArgumentException();return n-1;}catch(Exception e){throw new IllegalArgumentException("1~"+count+" 사이의 페이지 번호를 입력해 주세요.");}}
 public static int candidate(int current,int direction,int step,boolean includeCurrent,int count){if(count<1||current<0||current>=count||step<0||step>=count||(direction!=1&&direction!=-1))throw new IllegalArgumentException();return (int)Math.floorMod((long)current+(long)direction*(step+(includeCurrent?0:1)),(long)count);}
}
