package kr.memorynotes;
import java.util.WeakHashMap;
public final class ReviewFlow {
 private static final WeakHashMap<ReviewScreen,State> states=new WeakHashMap<>();
 private static class State {int index;boolean opened;State(int i){index=i;}}
 public static boolean masked(ReviewScreen r){State s=states.get(r);if(s==null||s.index!=r.index||!r.revealed){s=new State(r.index);states.put(r,s);}return !s.opened;}
 public static void revealPhrases(ReviewScreen r){masked(r);if(r.revealed)states.get(r).opened=true;}
 public static boolean hasPhrases(String text){return text!=null&&java.util.regex.Pattern.compile("\\{\\{[\\s\\S]+?\\}\\}").matcher(text).find();}
}
