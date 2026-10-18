import kr.memorynotes.*;
import java.time.LocalDate;
public class CoreTest {
 static int n=0;
 static void eq(Object a,Object b){n++;if(!a.equals(b))throw new AssertionError(a+" != "+b);}
 public static void main(String[] a)throws Exception{
  eq(ReviewScheduler.next(LocalDate.of(2028,2,28),0,9).toString(),"2028-02-29");
  eq(ReviewScheduler.next(LocalDate.of(2026,12,30),1,2).toString(),"2027-01-02");
  eq(ReviewScheduler.next(LocalDate.of(2026,1,1),2,0).toString(),"2026-01-08");
  eq(ReviewScheduler.next(LocalDate.of(2026,1,1),2,1).toString(),"2026-01-15");
  eq(ReviewScheduler.next(LocalDate.of(2026,1,1),2,2).toString(),"2026-01-31");
  eq(ReviewScheduler.streak(0,5),0);eq(ReviewScheduler.streak(1,5),0);eq(ReviewScheduler.streak(2,5),6);
  eq(Cloze.mask("수분 → {{산 생성}} → {{동 석출}}"),"수분 → [•••] → [•••]");
  eq(Cloze.reveal("수분 → {{산 생성}}"),"수분 → 산 생성");
  eq(Cloze.mask("<>& 한글"),"<>& 한글");
  System.out.println("PASS "+n+" core assertions");
 }
}
