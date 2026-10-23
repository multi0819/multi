package kr.memorynotes;
public class ReviewLayoutPolicyTest {
 static double lum(int c){double[] rgb={(c>>16&255)/255.0,(c>>8&255)/255.0,(c&255)/255.0};for(int i=0;i<3;i++)rgb[i]=rgb[i]<=.04045?rgb[i]/12.92:Math.pow((rgb[i]+.055)/1.055,2.4);return .2126*rgb[0]+.7152*rgb[1]+.0722*rgb[2];}
 public static void main(String[] args){for(boolean dark:new boolean[]{false,true}){java.util.Set<Integer> colors=new java.util.HashSet<>();for(int k=0;k<6;k++){int color=ReviewLayout.accent(k,dark);colors.add(color);int base=dark?0xFF17181C:0xFFF5F7F3;int fill=0xFF000000;for(int shift:new int[]{16,8,0})fill|=(((base>>shift&255)*9+(color>>shift&255))/10)<<shift;double x=lum(color),y=lum(fill);double contrast=(Math.max(x,y)+.05)/(Math.min(x,y)+.05);if(contrast<4.5)throw new AssertionError("contrast "+k+" "+dark+" "+contrast);}if(colors.size()!=6)throw new AssertionError("distinct roles");}
 for(int days:new int[]{7,14,30})if(!ReviewLayout.ratingText("외웠음 · "+days+"일 뒤").equals("외웠음\n"+days+"일 뒤"))throw new AssertionError("interval lost");System.out.println("PASS: six distinct roles in both themes, text contrast >=4.5, all scheduled intervals retained");}
}
