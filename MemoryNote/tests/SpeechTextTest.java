import kr.memorynotes.*;
public class SpeechTextTest {
 static int n;
 static void eq(Object actual,Object expected){n++;if(!actual.equals(expected))throw new AssertionError(actual+" != "+expected);}
 public static void main(String[] args){
  eq(SpeechText.eligible(0),true);eq(SpeechText.eligible(1),false);eq(SpeechText.eligible(3),false);
  eq(SpeechText.clean("정답 [[회전수 {{가감법}}]]"),"정답 회전수 가감법");
  eq(SpeechText.clean(""),"");
  eq(SpeechText.question("일반 노트","외표면적","공식은 [[πdL]]", ""),"외표면적. 공식은 빈칸");
  eq(SpeechText.answer("일반 노트","공식은 [[πdL]]", ""),"정답. 공식은 πdL");
  eq(SpeechText.question("문답 카드","공식","","관의 외표면적은?"),"공식. 관의 외표면적은?");
  eq(SpeechText.answer("문답 카드","","{{πdL}}"),"정답. πdL");
  eq(SpeechText.question("일반 노트","제목","수분은 {{산}}을 생성", ""),"제목. 수분은 빈칸을 생성");
  eq(SpeechText.question("문답 카드","관의 외표면적은?","","관의 외표면적은?"),"관의 외표면적은?");
  System.out.println("PASS "+n+" speech assertions");
 }
}
