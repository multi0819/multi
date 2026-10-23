package kr.memorynotes;
public class ReviewStageTest {
 static void check(boolean x,String s){if(!x)throw new AssertionError(s);}
 public static void main(String[] args){ReviewScreen r=new ReviewScreen();r.index=3;r.revealed=false;
 check(ReviewFlow.masked(r),"question initially masked");r.revealed=true;check(ReviewFlow.masked(r),"answer reveal must keep cloze hidden");ReviewFlow.revealPhrases(r);check(!ReviewFlow.masked(r),"second step reveals cloze");r.revealed=false;check(ReviewFlow.masked(r),"rehide resets both stages");r.revealed=true;ReviewFlow.revealPhrases(r);r.index=4;check(ReviewFlow.masked(r),"new page resets cloze");
 check(ReviewFlow.hasPhrases("문제 {{단어}}"),"cloze present");check(!ReviewFlow.hasPhrases("일반 문제"),"no cloze");System.out.println("PASS: answer before cloze, rehide and page reset");}
}
