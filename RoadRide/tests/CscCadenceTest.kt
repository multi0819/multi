import com.multi0819.roadride.*
import kotlin.math.abs
fun packet(rev:Int,ticks:Int,wheel:Boolean=false):ByteArray {
 val b=mutableListOf<Byte>((if(wheel)3 else 2).toByte())
 if(wheel)b.addAll(listOf<Byte>(1,0,0,0,5,0))
 b.addAll(listOf((rev and 255).toByte(),(rev shr 8).toByte(),(ticks and 255).toByte(),(ticks shr 8).toByte()))
 return b.toByteArray()
}
fun main(){
 for((ticks,rpm)in listOf(1024 to 60.0,683 to 90.0,512 to 120.0))for(wheel in listOf(false,true)){
  val c=CscCadence();check(c.add(CscDecoder.decode(packet(10,1000,wheel))!!,0).state=="ready")
  val r=c.add(CscDecoder.decode(packet(11,1000+ticks,wheel))!!,1000)
  check(r.state=="tracking"&&abs(r.rpm-rpm)<.1){"rate $r"}
 }
 check(CscDecoder.decode(byteArrayOf(1,0,0,0,0,0,0))!!.crankRevolutions==null)
 for(b in listOf(byteArrayOf(),byteArrayOf(0),byteArrayOf(4),byteArrayOf(2,0),byteArrayOf(3,0,0,0,0,0,0)))check(CscDecoder.decode(b)==null)
 val c=CscCadence();c.add(CscSample(65535,65000),0)
 check(abs(c.add(CscSample(0,488),1000).rpm-60)<.01)
 check(c.add(CscSample(0,488),2000).state=="tracking")
 check(c.add(CscSample(0,488),4000).state=="stopped")
 check(c.add(CscSample(1,1512),10000).state=="ready")
 check(c.add(CscSample(2,2536),11000).state=="tracking")
 check(c.add(CscSample(3,2536),12000).state=="unstable")
 check(c.add(CscSample(4,3560),13000).state=="tracking")
 check(c.add(CscSample(5,3561),14000).state=="unstable")
 check(c.add(CscSample(6,4585),15000).state=="tracking")
 check(c.add(CscSample(0,0),16000).state=="unstable")
 check(c.add(CscSample(1,1024),17000).state=="tracking")
 c.reset();check(c.add(CscSample(1,1024),18000).state=="ready")
 check(c.add(CscSample(null,null),19000).state=="unstable")
 println("CSC: rates, wheel fields, bounds, wrap, duplicate/stop, gap, reset PASS")
}
