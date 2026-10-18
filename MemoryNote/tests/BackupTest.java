import kr.memorynotes.ZipGuard;
public class BackupTest {
 static int n=0;
 static void good(String s)throws Exception{ZipGuard.checkName(s);n++;}
 static void bad(String s)throws Exception{try{ZipGuard.checkName(s);throw new AssertionError("accepted "+s);}catch(java.io.IOException expected){n++;}}
 public static void main(String[] args)throws Exception{
  good("notes.json");good("images/abc-123.img");bad("../escape");bad("images/../../escape");bad("/etc/passwd");bad("images\\evil");bad("images/a/b");bad("images/..");bad("unrecognized.txt");
  System.out.println("PASS "+n+" backup path assertions");
 }
}
