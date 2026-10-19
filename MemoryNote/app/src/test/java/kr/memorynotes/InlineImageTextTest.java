package kr.memorynotes;
import org.junit.Test;import static org.junit.Assert.*;import java.util.*;
public class InlineImageTextTest {
 String a="12345678-1234-1234-1234-123456789abc.img",b="abcdefab-1234-1234-1234-123456789abc.img";
 @Test public void preservesTextAroundImage(){String s="앞\n"+InlineImageText.marker(a)+"\n뒤";assertEquals(List.of(a),InlineImageText.files(s));assertEquals("앞\n[사진]\n뒤",InlineImageText.readable(s));}
 @Test public void remapsImagesAfterBackupRestore(){String s=InlineImageText.marker(a);assertEquals(InlineImageText.marker(b),InlineImageText.remap(s,Map.of(a,b)));}
 @Test public void leavesUnmappedTextUnchanged(){String s="문장 "+InlineImageText.marker(a);assertEquals(s,InlineImageText.remap(s,Map.of()));}
 @Test public void rejectsPathsAndNormalText(){assertTrue(InlineImageText.files("〔사진:../../secret〕 사진").isEmpty());}
 @Test public void findsRepeatedImagesInOrder(){assertEquals(List.of(a,b,a),InlineImageText.files(InlineImageText.marker(a)+InlineImageText.marker(b)+InlineImageText.marker(a)));}
 @Test public void inlineImageIsExcludedFromSeparateAttachmentList(){String body="앞\n"+InlineImageText.marker(a)+"\n뒤";assertTrue(InlineImageText.isReferenced(body,"",a));assertFalse(InlineImageText.isReferenced(body,"",b));}
 @Test public void savedNoteKeepsInlineReferenceAndImageFile()throws Exception{Note n=new Note();n.body="앞\n"+InlineImageText.marker(a)+"\n뒤";org.json.JSONObject im=new org.json.JSONObject();im.put("file",a);im.put("masks",new org.json.JSONArray());n.images.put(im);Note restored=Note.from(new org.json.JSONObject(n.json().toString()));assertEquals(n.body,restored.body);assertEquals(a,restored.images.getJSONObject(0).getString("file"));assertTrue(InlineImageText.isReferenced(restored.body,restored.answer,a));}
}
