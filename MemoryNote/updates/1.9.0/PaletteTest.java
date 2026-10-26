import kr.memorynotes.EditorPalette;
public class PaletteTest {
 static double channel(int c){double x=c/255.0;return x<=0.04045?x/12.92:Math.pow((x+0.055)/1.055,2.4);}
 static double light(int c){return .2126*channel((c>>16)&255)+.7152*channel((c>>8)&255)+.0722*channel(c&255);}
 public static void main(String[] args){
  for(boolean dark:new boolean[]{false,true}){
   java.util.Set<Integer> colors=new java.util.HashSet<Integer>();
   for(int role=0;role<=5;role++){
    int bg=EditorPalette.background(dark,role),fg=EditorPalette.foreground(dark,role);
    if((bg>>>24)!=255||(fg>>>24)!=255)throw new AssertionError("palette must be opaque");
    if(!colors.add(bg))throw new AssertionError("roles must have distinct backgrounds");
    double a=light(bg),b=light(fg),contrast=(Math.max(a,b)+.05)/(Math.min(a,b)+.05);
    if(contrast<4.5)throw new AssertionError("contrast "+dark+"/"+role+": "+contrast);
   }
  }
  if(EditorPalette.initiallyOpen("")||EditorPalette.initiallyOpen("  "))throw new AssertionError("empty fields should fold");
  if(!EditorPalette.initiallyOpen("주의: 단위 확인"))throw new AssertionError("existing notes must remain visible");
  System.out.println("PaletteTest: 12 role/theme contrast checks and fold defaults passed");
 }
}
