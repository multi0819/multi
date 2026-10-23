package kr.memorynotes;
import android.view.*;import java.util.*;
public final class NoteSwipe {
 private static final WeakHashMap<MainActivity,NoteSwipe> states=new WeakHashMap<>();
 private final ArrayList<Note> notes=new ArrayList<>();private ViewGroup listParent;private Note current;private ReviewScreen review;
 private static NoteSwipe state(MainActivity a){NoteSwipe s=states.get(a);if(s==null){s=new NoteSwipe();states.put(a,s);}return s;}
 public static void card(MainActivity a,ViewGroup parent,Note n){NoteSwipe s=state(a);if(parent!=s.listParent||parent.getChildCount()==0){s.notes.clear();s.listParent=parent;}for(Note old:s.notes)if(old.id.equals(n.id))return;s.notes.add(n);}
 public static void bind(MainActivity a,Note n){NoteSwipe s=state(a);s.review=null;s.current=n;for(int i=0;i<s.notes.size();i++)if(s.notes.get(i).id.equals(n.id)){s.notes.set(i,n);break;}s.install(a);}
 public static void bindReview(MainActivity a,ReviewScreen r){NoteSwipe s=state(a);if(r.index<0||r.index>=r.notes.size())return;s.current=null;s.review=r;a.review=r;s.install(a);}
 public static void clear(MainActivity a){NoteSwipe s=state(a);s.current=null;s.review=null;}
 private void install(MainActivity a){
  // InkToolbar inserts a separate root child before the scroll body. Follow the
  // actual content ancestry instead of guessing the body's child index.
  View body=a.content;if(body==null)return;
  ViewParent parent=body.getParent();
  while(parent instanceof View && parent!=a.root){body=(View)parent;parent=body.getParent();}
  if(parent!=a.root||body instanceof SwipePager)return;
  int index=a.root.indexOfChild(body);if(index<0)return;
  ViewGroup.LayoutParams params=body.getLayoutParams();a.root.removeViewAt(index);
  SwipePager pager=new SwipePager(a,this,body);a.root.addView(pager,index,params);
 }
 int index(){if(review!=null)return review.index;if(current!=null)for(int i=0;i<notes.size();i++)if(notes.get(i).id.equals(current.id))return i;return -1;}
 boolean canGo(int direction){int i=index(),size=review!=null?review.notes.size():notes.size();return i>=0&&i+direction>=0&&i+direction<size;}
 boolean go(MainActivity a,int direction){if(!canGo(direction))return false;if(review!=null){ReviewScreen r=review;r.index+=direction;r.revealed=false;r.show();}else{Note n=notes.get(index()+direction);a.detail(n);}return true;}
}
