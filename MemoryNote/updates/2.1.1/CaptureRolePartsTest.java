package kr.memorynotes;
import java.util.List;
/** Host-only parser regression check; do not package this class in the APK. */
public final class CaptureRolePartsTest {
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 static String content(String text,int role){StringBuilder out=new StringBuilder();for(CaptureRoleParts.Part p:CaptureRoleParts.split(text,-1))if(p.role==role)out.append(text.substring(p.start,p.end));return out.toString();}
 public static void main(String[] args){
  String mixed="【문제】\n(image:a)\n【지문】\n지문 글자\n(image:b)\n【풀이】\n[•••]\n(image:c)\n";
  check(content(mixed,0).equals("(image:a)\n"),"problem split");check(content(mixed,1).equals("지문 글자\n(image:b)\n"),"mixed statement split");check(content(mixed,2).equals("[•••]\n(image:c)\n"),"masked solution retained");
  List<CaptureRoleParts.Part> image=CaptureRoleParts.split("\n【풀이】\n",0);check(image.get(image.size()-1).role==2,"image-only heading carries role");
  check(CaptureRoleParts.split("text after image",2).get(0).role==2,"image/text boundary carries role");
  check(!CaptureRoleParts.hasHeading("legacy 문제 풀이 body"),"legacy unchanged");check(!CaptureRoleParts.hasHeading("본문 속 【문제】 설명"),"inline labels unchanged");
  check(content("앞 메모\n【문제】\n문제",-1).equals("앞 메모\n"),"legacy prefix retained");
  check(content("【문제】\r\n질문\r\n【풀이】\r\n답",2).equals("답"),"CRLF");
  check(content("【문제】\n첫 문제\n【문제】\n둘째 문제",0).equals("첫 문제\n둘째 문제"),"repeated roles");
  check(CaptureRoleParts.hasHeading("【풀이】"),"heading at EOF");System.out.println("PASS: capture role parsing, mixed images/text, masked text, legacy text and boundary cases");
 }
}
