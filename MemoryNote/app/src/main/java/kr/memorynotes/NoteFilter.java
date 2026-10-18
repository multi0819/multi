package kr.memorynotes;
import java.util.*;
/** Shared semantics for search and review; an empty selector means all. */
public final class NoteFilter {
 public String subject="",chapter="",type="";public int rating=-2;public boolean dueOnly,favoriteOnly;
 public static boolean isDue(Note n,String today){return n.due.isEmpty()||n.due.compareTo(today)<=0;}
 public ArrayList<Note> select(Collection<Note> source,String today){ArrayList<Note> result=new ArrayList<>();for(Note n:source){
  if(!subject.isEmpty()&&!subject.equals(n.subject))continue;
  if(ChapterChoices.NONE.equals(chapter)){if(!n.chapter.isEmpty())continue;}else if(!chapter.isEmpty()&&!chapter.equals(n.chapter))continue;
  if(!type.isEmpty()&&!type.equals(n.type))continue;if(rating!=-2&&rating!=n.rating)continue;
  if(dueOnly&&!isDue(n,today)||favoriteOnly&&!n.favorite)continue;result.add(n);
 }return result;}
}
