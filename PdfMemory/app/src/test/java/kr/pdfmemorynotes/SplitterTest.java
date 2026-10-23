package kr.pdfmemorynotes;
import org.junit.Test;import java.util.*;import static org.junit.Assert.*;
public class SplitterTest {
 Splitter.Line l(int p,float y,String t,boolean blue){return new Splitter.Line(p,.12f,y,.7f,y+.02f,t,blue);}
 @Test public void samePageAnswerAndContinuation(){List<Splitter.Line> ls=Arrays.asList(l(0,.1f,"01 문제입니다",true),l(0,.5f,"해답",true),l(0,.6f,"답 내용",false),l(1,.1f,"풀이 이어짐",false),l(2,.1f,"02 다음 문제",true),l(2,.5f,"해설",true));List<Splitter.Card> c=Splitter.split(ls,3);assertEquals(2,c.size());assertEquals(2,c.get(0).answerParts.size());assertTrue(c.get(0).answer.contains("이어짐"));}
 @Test public void subQuestionsNeverSplit(){List<Splitter.Card> c=Splitter.split(Arrays.asList(l(0,.1f,"01 문제",true),l(0,.2f,"(1) 소문제",true),l(0,.3f,"1. 조건",false),l(0,.5f,"해답",true)),1);assertEquals(1,c.size());}
 @Test public void missingAnswerNeedsReview(){List<Splitter.Card> c=Splitter.split(Arrays.asList(l(0,.1f,"01 문제",true)),1);assertTrue(c.get(0).uncertain);}
 @Test public void entirelyUnrecognizedPageIsNotLost(){assertTrue(Splitter.split(Collections.emptyList(),1).get(0).uncertain);}
 @Test public void repeatedQuestionNumbersAreFlagged(){List<Splitter.Card> c=Splitter.split(Arrays.asList(l(0,.1f,"01 하나",true),l(0,.5f,"해답",true),l(1,.1f,"01 둘",true),l(1,.5f,"해답",true)),2);assertTrue(c.get(1).uncertain);}
 @Test public void renderingIsBounded(){int[] s=PagePolicy.size(595,842,1600);assertTrue((long)s[0]*s[1]<=4000000);int[] tall=PagePolicy.size(600,9000,1600);assertTrue((long)tall[0]*tall[1]<=4000000);assertTrue(tall[1]<=2600);}
 @Test public void missingQuestionMarkerFlagsBothNeighbors(){List<Splitter.Card> c=Splitter.split(Arrays.asList(l(0,.1f,"01 문제",true),l(0,.5f,"해답",true),l(1,.1f,"문제2 번호 누락",false),l(1,.5f,"해답",true),l(2,.1f,"03 문제",true),l(2,.5f,"해답",true)),3);assertTrue(c.get(0).uncertain);assertTrue(c.get(1).uncertain);}
 @Test public void scannerConsumesOnePageAtATime(){int[] called={0},emitted={0};Splitter.scan(p->{called[0]++;return Arrays.asList(l(p,.1f,String.format("%02d 문제",p+1),true),l(p,.5f,"해답",true));},40,c->emitted[0]++);assertEquals(40,called[0]);assertEquals(40,emitted[0]);}
}
