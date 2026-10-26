package kr.memorynotes;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/** Shared streaming archive bounds and strict relative-name allowlist. */
public final class PdfArchiveRules {
 public static final long META=32L*1024*1024,INK=32L*1024*1024,PDF=4L*1024*1024*1024,NOTES=600L*1024*1024,TOTAL=16L*1024*1024*1024;
 public static final String ID="[A-Za-z0-9][A-Za-z0-9_-]{0,127}";
 public static void id(String value)throws IOException{if(value==null||!value.matches(ID))throw new IOException("잘못된 PDF 식별자입니다.");}
 public static long limit(String name)throws IOException{
  if(name.equals("manifest.json")||name.equals("pdf/state.json"))return META;
  if(name.equals("notes.zip"))return NOTES;
  if(name.matches("pdf/"+ID+"\\.pdf"))return PDF;
  if(name.matches("pdf/"+ID+"-[0-9]{1,9}\\.ink\\.json"))return INK;
  throw new IOException("백업에 허용되지 않는 파일 경로입니다: "+name);
 }
 public static final class Budget {
  private final Set<String> names=new HashSet<String>();private long bytes;
  public long entry(String name,boolean directory)throws IOException{long max=limit(name);if(directory||!names.add(name)||names.size()>50000)throw new IOException("중복 또는 잘못된 백업 항목입니다.");return max;}
  public void bytes(long count)throws IOException{if(count<0||count>TOTAL-bytes)throw new IOException("전체 백업 크기 제한을 초과했습니다.");bytes+=count;}
 }
}
