package kr.memorynotes;
/** Reader-only: omit empty text blocks between image views; retain saved text/spans. */
public final class ImageSpacing {
 public static int visibleLength(CharSequence text){for(int i=0;i<text.length();i++)if(!Character.isWhitespace(text.charAt(i))&&!Character.isSpaceChar(text.charAt(i)))return text.length();return 0;}
}
