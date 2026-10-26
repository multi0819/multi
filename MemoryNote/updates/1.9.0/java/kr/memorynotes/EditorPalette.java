package kr.memorynotes;

/** Colors shared by the editor controls; ARGB values need no framework APIs. */
public final class EditorPalette {
 public static final int NEUTRAL=0, SAVE=1, ANSWER=2, CLOZE=3, IMAGE=4, CAUTION=5;
 private static final int[] DARK_BG={0xff2b3038,0xff24533f,0xff243e60,0xff584025,0xff44335e,0xff56313d};
 private static final int[] DARK_FG={0xffe5e9ef,0xffc5f3d8,0xffc5ddff,0xffffdfaa,0xffe4d3ff,0xffffd3df};
 private static final int[] LIGHT_BG={0xffedf0f4,0xff246747,0xffe6efff,0xffffedcf,0xffefe6ff,0xffffe6ee};
 private static final int[] LIGHT_FG={0xff344154,0xffffffff,0xff204f90,0xff784400,0xff60369a,0xff89334d};
 public static int background(boolean dark,int role){return (dark?DARK_BG:LIGHT_BG)[role];}
 public static int foreground(boolean dark,int role){return (dark?DARK_FG:LIGHT_FG)[role];}
 public static boolean initiallyOpen(CharSequence text){return text!=null&&!text.toString().trim().isEmpty();}
}
