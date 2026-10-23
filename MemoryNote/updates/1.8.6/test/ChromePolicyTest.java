package kr.memorynotes;
public class ChromePolicyTest {
 static void check(boolean b){if(!b)throw new AssertionError();}
 public static void main(String[] args){
  check(WindowChrome.legacyFlags(true)==4098);
  check((WindowChrome.legacyFlags(false)&8192)!=0);
  check((WindowChrome.legacyFlags(true)&4)==0);
  check(WindowChrome.appearance(true,35)==128);
  check(WindowChrome.appearance(false,35)==408);
  check(WindowChrome.appearance(true,30)==0);
  check(WindowChrome.appearance(false,30)==24);
  System.out.println("PASS: dark/light caption contrast, navigation-only hiding and API compatibility policy");
 }
}
