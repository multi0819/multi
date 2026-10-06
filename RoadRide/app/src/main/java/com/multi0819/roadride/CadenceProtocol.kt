package com.multi0819.roadride

data class CadencePacket(val seq: Long, val rpm: Double, val confidence: Double, val state: String)
object CadenceProtocol {
    const val MAX_LINE=512
    fun auth(code: String): String { require(code.matches(Regex("[0-9]{8}"))); return "RR1\t$code" }
    fun encode(seq: Long, reading: CadenceReading): String = "RPM\t$seq\t${reading.rpm}\t${reading.confidence}\t${reading.state}"
    fun decode(line: String): CadencePacket? {
        if(line.length>MAX_LINE) return null
        val p=line.split('\t'); if(p.size!=5 || p[0]!="RPM") return null
        val seq=p[1].toLongOrNull()?:return null
        val rpm=p[2].toDoubleOrNull()?:return null
        val confidence=p[3].toDoubleOrNull()?:return null
        if(seq<0 || !rpm.isFinite() || rpm !in 0.0..300.0 || !confidence.isFinite() || confidence !in 0.0..1.0 || p[4] !in setOf("ready","tracking","stopped","unstable")) return null
        return CadencePacket(seq,rpm,confidence,p[4])
    }
}
