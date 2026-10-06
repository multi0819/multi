package com.multi0819.roadride

import java.io.InputStream
import java.net.ServerSocket
import java.net.Socket

internal fun boundedLine(input: InputStream): String? {
    val b=StringBuilder()
    while(true) { val c=input.read(); if(c<0) return null; if(c==10) return b.toString().removeSuffix("\r"); if(b.length>=CadenceProtocol.MAX_LINE) return null; b.append(c.toChar()) }
}
class CadenceServer {
    @Volatile private var server: ServerSocket?=null
    @Volatile private var peer: Socket?=null
    @Synchronized fun start(code: String, provider: () -> CadenceReading): Int {
        stop(); val auth=CadenceProtocol.auth(code);val listener=ServerSocket(0);server=listener
        Thread({
            var failures=0;var resetAt=System.nanoTime()
            while(server===listener) {
                try {
                    val socket=listener.accept(); peer=socket
                    socket.use { s ->
                        s.soTimeout=3000
                        if(System.nanoTime()-resetAt>60_000_000_000L) { failures=0;resetAt=System.nanoTime() }
                        if(failures>=10 || boundedLine(s.getInputStream())!=auth) { failures++;return@use }
                        s.getOutputStream().write("OK\n".toByteArray(Charsets.US_ASCII));s.getOutputStream().flush()
                        var seq=0L
                        // A single active receiver; stop closes this socket to unblock a write.
                        while(server===listener && !s.isClosed) {
                            val line=CadenceProtocol.encode(seq++,provider())+"\n"
                            s.getOutputStream().write(line.toByteArray(Charsets.US_ASCII));s.getOutputStream().flush()
                            Thread.sleep(1000)
                        }
                    }
                } catch(_:Exception) { if(server!==listener) break }
                finally { peer=null }
            }
        },"RoadRide sender").apply {isDaemon=true;start()}
        return listener.localPort
    }
    @Synchronized fun stop() { val s=server;server=null;try{peer?.close()}catch(_:Exception){};try{s?.close()}catch(_:Exception){};peer=null }
}
