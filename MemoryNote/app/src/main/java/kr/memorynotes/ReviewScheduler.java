package kr.memorynotes;
import java.time.LocalDate;
public final class ReviewScheduler {
 public static LocalDate next(LocalDate today,int rating,int streak){
  if(rating<0||rating>2)throw new IllegalArgumentException("rating");
  int days=rating==0?1:rating==1?3:streak==0?7:streak==1?14:30;
  return today.plusDays(days);
 }
 public static int streak(int rating,int previous){return rating==2?previous+1:0;}
}
