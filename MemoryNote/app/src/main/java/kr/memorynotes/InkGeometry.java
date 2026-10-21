package kr.memorynotes;
public final class InkGeometry {
 public static boolean nearSegment(float x,float y,float ax,float ay,float bx,float by,float radius){float dx=bx-ax,dy=by-ay;float length=dx*dx+dy*dy;float t=length==0?0:Math.max(0,Math.min(1,((x-ax)*dx+(y-ay)*dy)/length));float ex=x-(ax+t*dx),ey=y-(ay+t*dy);return ex*ex+ey*ey<=radius*radius;}
}
