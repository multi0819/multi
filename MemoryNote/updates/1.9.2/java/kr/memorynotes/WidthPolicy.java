package kr.memorynotes;
public final class WidthPolicy {
 public static float width(int progress){return (Math.max(0,Math.min(59,progress))+1)*0.5f;}
 public static int progress(float width){if(Float.isNaN(width)||Float.isInfinite(width))width=2.5f;return Math.max(0,Math.min(59,Math.round(width*2)-1));}
 public static String label(int progress){float v=width(progress);return v==(int)v?Integer.toString((int)v):Float.toString(v);}
}
