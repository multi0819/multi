package kr.memorynotes;
import org.junit.Test;import static org.junit.Assert.*;
public class EditorPolicyTest {
 @Test public void generalHasOnlyTitleAndContent(){assertTrue(EditorPolicy.isGeneral("일반 노트"));assertFalse(EditorPolicy.isGeneral("문답 카드"));}
 @Test public void questionCreatesTitleAutomatically(){assertEquals("압축기의 용량제어 방법",EditorPolicy.titleFor("문답 카드","별도 제목","압축기의 용량제어 방법\n추가 조건"));}
 @Test public void generalPreservesManualTitle(){assertEquals("내 제목",EditorPolicy.titleFor("일반 노트"," 내 제목 ","질문"));}
 @Test public void switchToQuestionUsesExistingContentWithoutDuplication(){Note n=new Note();n.title="압축기 용량제어";n.body="{{회전수 가감법}}";EditorPolicy.prepareSwitch(n,"일반 노트","문답 카드");assertEquals(n.title,n.question);assertEquals(n.body,n.answer);}
 @Test public void switchingDoesNotOverwriteExistingAnswers(){Note n=new Note();n.title="제목";n.body="본문";n.question="기존 문제";n.answer="기존 정답";EditorPolicy.prepareSwitch(n,"일반 노트","문답 카드");assertEquals("기존 문제",n.question);assertEquals("기존 정답",n.answer);}
 @Test public void titleTruncationDoesNotSplitEmoji(){String s="😀".repeat(100);String title=EditorPolicy.titleFor("문답 카드","",s);assertEquals(80,title.codePointCount(0,title.length()));assertFalse(Character.isHighSurrogate(title.charAt(title.length()-1)));}
 @Test public void switchBackCanReuseQuestionAnswer(){Note n=new Note();n.question="새 질문";n.answer="새 정답";EditorPolicy.prepareSwitch(n,"문답 카드","일반 노트");assertEquals("새 질문",n.title);assertEquals("새 정답",n.body);}
}
