import com.multi0819.roadride.*
import kotlin.math.*
fun main() {
 for (rpm in listOf(30,60,90,120,150)) {
  val e=CadenceEstimator(); var r=CadenceReading(0.0,0.0,"ready")
  for(i in 0..600) { val t=i/50.0; val a=2*sin(2*PI*rpm/60*t); val angle=t*.08
   r=e.add((t*1e9).toLong(),a*cos(angle),a*sin(angle),9.81)
  }
  check(r.state=="tracking" && abs(r.rpm-rpm)<5) { "$rpm -> $r" }
 }
 val e=CadenceEstimator(); check(e.add(0,0.0,0.0,9.81).state=="ready")
 var r=CadenceReading(0.0,0.0,"ready")
 for(i in 0..500) r=e.add(i*20_000_000L,0.0,0.0,9.81)
 check(r.state=="stopped")
 val noise=CadenceEstimator(); val random=java.util.Random(42)
 for(i in 0..600) r=noise.add(i*20_000_000L,random.nextGaussian(),random.nextGaussian(),9.81+random.nextGaussian())
 check(r.state=="unstable") { "noise $r" }
 val gap=CadenceEstimator()
 for(i in 0..600) gap.add(i*20_000_000L,2*sin(2*PI*i/50.0),0.0,9.81)
 val afterGap=gap.add(22_000_000_000L,0.0,0.0,9.81)
 check(afterGap.state!="tracking") { "gap freshens stale reading: $afterGap" }
 val bump=CadenceEstimator()
 for(i in 0..600) bump.add(i*20_000_000L,2*sin(2*PI*i/50.0),0.0,9.81)
 for(i in 601..700) bump.add(i*20_000_000L,0.0,0.0,9.81)
 for(i in 701..775) {
   val b=bump.add(i*20_000_000L,if(i==701)3.0 else 0.0,0.0,9.81)
   check(b.state!="tracking") { "one pocket bump revives old cadence: $b" }
 }
 val p=CadenceProtocol.decode(CadenceProtocol.encode(3,CadenceReading(90.0,.8,"tracking")))!!
 check(p.seq==3L && p.rpm==90.0)
 for(line in listOf("RPM\t1\tNaN\t1\ttracking","RPM\t1\tInfinity\t1\ttracking","RPM\t-1\t60\t1\ttracking","RPM\t1\t301\t1\ttracking","RPM\t1\t60\t2\ttracking","RPM\t1\t60\t1\tunknown","x".repeat(513))) check(CadenceProtocol.decode(line)==null)
 check(CadenceProtocol.auth("12345678")=="RR1\t12345678")
 println("Cadence core: synthetic 5 rates, rotation, stop, noise, protocol PASS")
}
