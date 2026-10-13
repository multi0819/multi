package com.multi0819.roadride

import kotlin.math.ceil

data class CscSample(val crankRevolutions: Int?, val crankEventTicks: Int?)
object CscDecoder {
    fun decode(bytes: ByteArray): CscSample? {
        if(bytes.isEmpty())return null
        val flags=bytes[0].toInt() and 255
        if(flags==0 || flags and 252!=0)return null
        val hasWheel=flags and 1!=0;val hasCrank=flags and 2!=0
        val offset=1+if(hasWheel)6 else 0
        if(bytes.size!=offset+if(hasCrank)4 else 0)return null
        fun u16(i:Int)=(bytes[i].toInt() and 255) or ((bytes[i+1].toInt() and 255) shl 8)
        return if(hasCrank)CscSample(u16(offset),u16(offset+2))else CscSample(null,null)
    }
}
/** Event counters determine RPM; Android's local monotonic receipt time determines freshness. */
class CscCadence {
    private var previous:CscSample?=null
    private var received=-1L
    private var movementAt=0L
    private var reading=CadenceReading(0.0,0.0,"ready")
    fun reset(){previous=null;received=-1;movementAt=0;reading=CadenceReading(0.0,0.0,"ready")}
    fun add(sample:CscSample,receivedAtMs:Long):CadenceReading {
        if(sample.crankRevolutions==null || sample.crankEventTicks==null){reset();return CadenceReading(0.0,0.0,"unstable")}
        val old=previous
        if(old==null || receivedAtMs-received>5000 || receivedAtMs<received){
            previous=sample;received=receivedAtMs;movementAt=receivedAtMs
            reading=CadenceReading(0.0,0.0,"ready");return reading
        }
        received=receivedAtMs
        val revolutions=(sample.crankRevolutions-old.crankRevolutions!!) and 65535
        val ticks=(sample.crankEventTicks-old.crankEventTicks!!) and 65535
        if(revolutions==0 && ticks==0){
            if(receivedAtMs-movementAt>=3000)reading=CadenceReading(0.0,1.0,"stopped")
            return reading
        }
        val rpm=if(ticks>0)revolutions*60.0*1024/ticks else Double.NaN
        val maxRevs=ceil((receivedAtMs-movementAt+2000).coerceAtLeast(0)/1000.0*5)
        previous=sample;movementAt=receivedAtMs
        reading=if(revolutions>0 && rpm.isFinite() && rpm>0 && rpm<=300 && revolutions<=maxRevs)CadenceReading(rpm,1.0,"tracking")else CadenceReading(0.0,0.0,"unstable")
        return reading
    }
}
