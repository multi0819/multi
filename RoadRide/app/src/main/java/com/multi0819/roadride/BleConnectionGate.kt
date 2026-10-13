package com.multi0819.roadride

class BleConnectionGate {
    private var generation=0L
    @Synchronized fun next():Long=++generation
    @Synchronized fun isCurrent(token:Long):Boolean=token==generation
    @Synchronized fun invalidate(){generation++}
}
