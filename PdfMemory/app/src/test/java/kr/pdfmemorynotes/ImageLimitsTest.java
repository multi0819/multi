package kr.pdfmemorynotes;
import org.junit.Test;
import static org.junit.Assert.*;
public class ImageLimitsTest {
 @Test public void ordinaryClipboardScreenshotRemainsReadable(){assertEquals(1,ImageLimits.sample(900,900));}
 @Test public void hugePortraitIsBounded(){int s=ImageLimits.sample(12000,18000);assertTrue(12000L/s*(18000L/s)<=1000000);assertTrue(12000/s>=375);}
 @Test public void panoramicImageFitsWidth(){int s=ImageLimits.sample(20000,200);assertTrue(20000/s<=1400);}
 @Test public void invalidImageDoesNotLoop(){assertEquals(1,ImageLimits.sample(-1,-1));}
 @Test public void extremeDimensionsDoNotOverflow(){int s=ImageLimits.sample(Integer.MAX_VALUE,Integer.MAX_VALUE);assertTrue(Integer.MAX_VALUE/(long)s*(Integer.MAX_VALUE/(long)s)<=1000000);}
}
