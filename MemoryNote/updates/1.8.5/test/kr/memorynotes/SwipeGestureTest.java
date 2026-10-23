package kr.memorynotes;
public class SwipeGestureTest {
 static int count;static void check(boolean v,String label){count++;if(!v)throw new AssertionError(label);}
 public static void main(String[] args){
  SwipeGesture g=new SwipeGesture(12,32);
  g.begin(500,200,1,1,false);check(!g.move(496,203,1,1),"tap jitter");check(g.move(470,206,1,1),"horizontal captured before long drag");check(g.finish(450,206)==1,"left goes next");
  g.begin(500,200,1,1,false);check(g.move(530,204,1,1),"right captured");check(g.finish(550,204)==-1,"right goes previous");
  g.begin(500,200,1,1,false);check(!g.move(504,250,1,1),"vertical scroll passed");check(!g.move(400,260,1,1),"vertical retains ownership");check(g.finish(350,260)==0,"scroll does not navigate");
  g.begin(500,200,1,1,false);check(!g.move(510,211,1,1),"undecided diagonal");check(g.move(450,216,1,1),"diagonal can become horizontal");check(g.finish(440,216)==1,"diagonal next");
  g.begin(500,200,2,1,false);check(!g.move(300,200,2,1),"S Pen passed");check(g.finish(300,200)==0,"S Pen cannot navigate");
  g.begin(500,200,1,1,true);check(!g.move(300,200,1,1),"buttons passed");check(g.finish(300,200)==0,"button drag cannot navigate");
  g.begin(500,200,1,1,false);g.move(470,200,1,1);check(!g.move(400,200,1,2),"pinch cancels");check(g.finish(300,200)==0,"pinch cannot navigate");
  g.begin(500,200,1,1,false);g.move(480,200,1,1);check(g.finish(480,200)==0,"short drag returns");
  g.begin(500,200,1,1,false);g.move(450,200,1,1);g.cancel();check(g.finish(400,200)==0,"cancel cannot navigate");
  System.out.println("PASS: "+count+" gesture classifier checks");
 }
}
