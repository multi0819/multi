package kr.memorynotes;
public final class SwipeGesture {
 private final float slop,commit;private float x,y;private boolean active,dragging;
 public SwipeGesture(float slop,float commit){this.slop=slop;this.commit=commit;}
 public void begin(float x,float y,int tool,int pointers,boolean blocked){this.x=x;this.y=y;active=tool==1&&pointers==1&&!blocked;dragging=false;}
 public boolean move(float x,float y,int tool,int pointers){
  if(!active)return false;if(tool!=1||pointers!=1){cancel();return false;}
  if(dragging)return true;float dx=Math.abs(x-this.x),dy=Math.abs(y-this.y);
  if(dx<slop&&dy<slop)return false;
  if(dy>=commit&&dy>dx*1.5f){active=false;return false;}
  if(dx>slop&&dx>dy*1.3f)dragging=true;return dragging;
 }
 public int finish(float x,float y){float dx=x-this.x,dy=y-this.y;boolean commitPage=active&&dragging&&Math.abs(dx)>=commit&&Math.abs(dx)>Math.abs(dy)*1.3f;cancel();return commitPage?(dx<0?1:-1):0;}
 public void cancel(){active=false;dragging=false;}
 public float delta(float x){return x-this.x;}
}
