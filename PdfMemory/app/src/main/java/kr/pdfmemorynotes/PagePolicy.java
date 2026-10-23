package kr.pdfmemorynotes;
public final class PagePolicy {
 public static int[] size(int width,int height,int target){double s=Math.min((double)target/Math.max(1,width),2600.0/Math.max(1,height));s=Math.min(s,Math.sqrt(4000000.0/Math.max(1.0,(double)width*height)));return new int[]{Math.max(1,(int)(width*s)),Math.max(1,(int)(height*s))};}
 public static boolean validCrop(float top,float bottom){return !Float.isNaN(top)&&!Float.isNaN(bottom)&&top>=0&&bottom<=1&&bottom-top>.005f;}
}
