package kr.memorynotes;
import java.io.IOException;
public final class ZipGuard {
 public static void checkName(String name)throws IOException{
  if(name.equals("notes.json"))return;
  if(!name.matches("images/[A-Za-z0-9_-]+\\.img"))throw new IOException("백업에 허용되지 않는 파일 경로가 있습니다");
 }
}
