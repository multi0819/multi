import kr.memorynotes.*;
import java.util.*;
public class StudyTextTest {
 static int n;
 static void eq(Object a,Object b){n++;if(!a.equals(b))throw new AssertionError(a+" != "+b);}
 public static void main(String[] args){
  eq(Cloze.reveal("문제 [[회전수 {{가감법}}\n언로드법]]"),"문제 회전수 가감법\n언로드법");
  eq(Cloze.mask("문제 [[회전수 {{가감법}}\n{{언로드법}}]]"),"문제 회전수 [•••]\n[•••]");
  eq(Cloze.reveal("괄호 [[미완성"),"괄호 [[미완성");
  eq(Cloze.mask("미완성 {{문구"),"미완성 {{문구");
  System.out.println("PASS "+n+" text compatibility assertions");
 }
}
