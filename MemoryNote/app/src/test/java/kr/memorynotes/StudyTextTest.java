package kr.memorynotes;
import org.junit.Test;import static org.junit.Assert.*;import java.util.*;
public class StudyTextTest {
 @Test public void oldClozeStillWorks(){assertEquals("수분 → [•••]",Cloze.mask("수분 → {{산 생성}}"));assertEquals("수분 → 산 생성",Cloze.reveal("수분 → {{산 생성}}"));}
 @Test public void questionAnswerAndPhraseHaveSeparateRoles(){List<StudyText.Part> p=StudyText.parts("문제 [[답 {{핵심}}]]",false,true);assertEquals(StudyText.NORMAL,p.get(0).kind);assertEquals(StudyText.ANSWER,p.get(1).kind);assertEquals(StudyText.CLOZE,p.get(2).kind);assertEquals("핵심",p.get(2).text);}
 @Test public void ordinaryBodyIsAnswerByDefault(){assertEquals(StudyText.ANSWER,StudyText.parts("회전수 가감법",false,true).get(0).kind);}
 @Test public void multiplePhrasesHideAndRevealInsideAnswer(){String s="[[회전수 {{가감법}}\n{{언로드법}}]]";assertEquals("회전수 [•••]\n[•••]",Cloze.mask(s));assertEquals("회전수 가감법\n언로드법",Cloze.reveal(s));}
 @Test public void repeatedWordsUseExactLocations(){PhraseSelection p=new PhraseSelection("답 답 답");assertTrue(p.add(2,3));assertEquals("답 {{답}} 답",p.apply());}
 @Test public void bulkLinesApplyOnce(){PhraseSelection p=new PhraseSelection("[[회전수 가감법\n언로드법\n바이패스법]]");p.selectLines();assertEquals(3,p.size());assertEquals("[[{{회전수 가감법}}\n{{언로드법}}\n{{바이패스법}}]]",p.apply());}
 @Test public void existingClozeAndOverlapsAreProtected(){PhraseSelection p=new PhraseSelection("{{기존}} 새문구");assertFalse(p.add(2,4));assertTrue(p.add(7,10));assertFalse(p.add(8,9));assertEquals("{{기존}} {{새문구}}",p.apply());}
 @Test public void visibleOffsetsExcludeAnswerMarkers(){PhraseSelection p=new PhraseSelection("문제 [[답 문구]]");assertTrue(p.addVisible(5,7));assertEquals("문제 [[답 {{문구}}]]",p.apply());}
 @Test public void clearAndRemovePreserveSource(){PhraseSelection p=new PhraseSelection("첫째\n둘째");p.selectLines();p.remove(0);assertEquals("첫째\n{{둘째}}",p.apply());p.clear();assertEquals("첫째\n둘째",p.apply());}
 @Test public void markingAnswerPreservesExistingPhrases(){String s="회전수 {{가감법}}";assertEquals("[[회전수 {{가감법}}]]",PhraseSelection.markAnswer(s,0,s.length()));assertThrows(IllegalArgumentException.class,()->PhraseSelection.markAnswer(s,6,9));}
 @Test public void unfinishedMarkupRemainsReadable(){assertEquals("[[미완성",Cloze.reveal("[[미완성"));assertEquals("{{미완성",Cloze.mask("{{미완성"));}
 @Test public void reassigningInsideAnswerIsIdempotent(){assertEquals("[[abc def]]",PhraseSelection.markAnswer("[[abc def]]",2,5));assertThrows(IllegalArgumentException.class,()->PhraseSelection.markAnswer("Q [[abc]] tail",0,6));}
}
