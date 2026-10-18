import kr.memorynotes.*;
public class PhraseSelectionTest {
 static int n;
 static void eq(Object a,Object b){n++;if(!a.equals(b))throw new AssertionError(a+" != "+b);}
 public static void main(String[] args){
  PhraseSelection p=new PhraseSelection("회전수 가감법\n언로드법\n바이패스법");p.add(0,7);p.add(8,12);eq(p.apply(),"{{회전수 가감법}}\n{{언로드법}}\n바이패스법");eq(p.size(),2);
  PhraseSelection q=new PhraseSelection("[[회전수 가감법\n언로드법]]");q.selectLines();eq(q.apply(),"[[{{회전수 가감법}}\n{{언로드법}}]]");
  PhraseSelection r=new PhraseSelection("{{기존}} 새문구 새문구");r.add(7,10);r.add(11,14);eq(r.apply(),"{{기존}} {{새문구}} {{새문구}}");eq(r.add(2,4),false);eq(r.add(8,9),false);
  PhraseSelection s=new PhraseSelection("첫째\n\n둘째");s.selectLines();eq(s.size(),2);eq(s.apply(),"{{첫째}}\n\n{{둘째}}");s.clear();eq(s.apply(),"첫째\n\n둘째");
  eq(PhraseSelection.markAnswer("문제\n회전수 {{가감법}}",3,14),"문제\n[[회전수 {{가감법}}]]");
  System.out.println("PASS "+n+" bulk selection assertions");
 }
}
