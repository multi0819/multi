package kr.pdfmemorynotes;
import org.junit.Test;import static org.junit.Assert.*;
public class MarkerDetectorTest {
 @Test public void digitsAndRuleDetectedWithoutOcrLabels(){int w=500,h=800;int[] px=new int[w*h];java.util.Arrays.fill(px,0xFFFFFFFF);for(int y=80;y<89;y++)for(int x=60;x<69;x++)px[y*w+x]=0xFF65B7CF;for(int y=400;y<402;y++)for(int x=50;x<350;x++)px[y*w+x]=0xFFAADEEF;MarkerDetector.Marks m=MarkerDetector.detect((x,y)->px[y*w+x],w,h);assertEquals(1,m.questions.size());assertEquals(1,m.answers.size());assertEquals(.096,m.questions.get(0),.01);assertEquals(.496,m.answers.get(0),.01);}
 @Test public void whitePageNeverInventsQuestion(){assertEquals(0,MarkerDetector.detect((x,y)->0xFFFFFFFF,500,800).questions.size());}
}
