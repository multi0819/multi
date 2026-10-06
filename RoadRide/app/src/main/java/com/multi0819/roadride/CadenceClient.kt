package com.multi0819.roadride

import java.net.InetSocketAddress
import java.net.Socket

class CadenceClient {
    private val lock=Any()
    private var generation=0L
    private var socket: Socket?=null
    fun close() = synchronized(lock) { generation++;try{socket?.close()}catch(_:Exception){};socket=null }
    fun connect(host: String, port: Int, code: String, onPacket: (CadencePacket)->Unit, onStatus: (String)->Unit, onPaired: (String)->Unit = {}) {
        require(validEndpoint(host,port,code))
        val s=Socket()
        val token=synchronized(lock) { close();socket=s;generation }
        fun status(value:String) = synchronized(lock) { if(generation==token) onStatus(value) }
        Thread({
            try {
                status("connecting");s.connect(InetSocketAddress(host,port),5000);s.soTimeout=6000
                s.getOutputStream().write((CadenceProtocol.auth(code)+"\n").toByteArray(Charsets.US_ASCII));s.getOutputStream().flush()
                var pairedSecret: String?=null
                var reply=boundedLine(s.getInputStream())
                if(reply?.startsWith("PAIR\t")==true) {
                    val secret=reply.substringAfter('\t')
                    if(!secret.matches(Regex("[a-f0-9]{32}"))) {status("auth_failed");return@Thread}
                    pairedSecret=secret
                    reply=boundedLine(s.getInputStream())
                }
                if(reply!="OK") { status("auth_failed");return@Thread }
                pairedSecret?.let { secret -> synchronized(lock) {if(generation==token)onPaired(secret)} }
                status("connected");var last=-1L
                while(!s.isClosed) {
                    val line=boundedLine(s.getInputStream())?:break
                    val p=CadenceProtocol.decode(line)?:break
                    if(p.seq<=last) continue
                    last=p.seq
                    synchronized(lock) { if(generation==token) onPacket(p) }
                }
                status("disconnected")
            } catch(_:Exception) { status("disconnected") }
            finally { try{s.close()}catch(_:Exception){} }
        },"RoadRide receiver").apply {isDaemon=true;start()}
    }
    companion object {
        fun validEndpoint(host:String,port:Int,code:String):Boolean {
            if(port !in 1024..65535 || !CadenceProtocol.validSecret(code)) return false
            val v=host.split('.').map { it.toIntOrNull()?:return false }
            if(v.size!=4 || v.any {it !in 0..255}) return false
            return v[0]==10 || (v[0]==172 && v[1] in 16..31) || (v[0]==192 && v[1]==168) || host=="127.0.0.1"
        }
    }
}
