package kr.memorynotes;
/** Explicit local gesture wins over old clipboard; a later clipboard copy wins over local ranges. */
public final class PdfCaptureSource {
 public static final int NONE=0,TEXT=1,AREA=2,CLIPBOARD=3;
 public static int choose(boolean text,boolean area,boolean clipboardChanged){if(clipboardChanged)return CLIPBOARD;if(text)return TEXT;if(area)return AREA;return CLIPBOARD;}
}
