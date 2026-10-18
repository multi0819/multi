package kr.memorynotes;
import org.junit.Test;
import static org.junit.Assert.*;
import java.time.LocalDate;
public class ReviewSchedulerTest {
 @Test public void leapDay(){assertEquals("2028-02-29",ReviewScheduler.next(LocalDate.of(2028,2,28),0,9).toString());}
 @Test public void yearEnd(){assertEquals("2027-01-02",ReviewScheduler.next(LocalDate.of(2026,12,30),1,0).toString());}
 @Test public void intervals(){LocalDate d=LocalDate.of(2026,1,1);assertEquals(d.plusDays(7),ReviewScheduler.next(d,2,0));assertEquals(d.plusDays(14),ReviewScheduler.next(d,2,1));assertEquals(d.plusDays(30),ReviewScheduler.next(d,2,2));assertEquals(0,ReviewScheduler.streak(0,9));assertEquals(0,ReviewScheduler.streak(1,9));}
 @Test public void multilineCloze(){assertEquals("전 [•••] 후",Cloze.mask("전 {{산\n생성}} 후"));assertEquals("전 산 생성 후",Cloze.reveal("전 {{산 생성}} 후"));}
}
