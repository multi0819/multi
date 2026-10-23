package kr.memorynotes;
public class FirstSwipeTest {
 public static void main(String[] args){
  SwipeGesture g=new SwipeGesture(16,80);
  g.begin(500,400,1,1,false);g.move(501,420,1,1);
  if(!g.move(390,425,1,1)||g.finish(390,425)!=1)throw new AssertionError("small initial vertical wobble must not discard first horizontal swipe");
  g.begin(500,400,1,1,false);g.move(502,510,1,1);g.move(390,510,1,1);
  if(g.finish(390,510)!=0)throw new AssertionError("committed vertical scroll must never become paging");
  System.out.println("PASS: first horizontal swipe recovers from initial wobble; vertical scroll retained");
 }
}
