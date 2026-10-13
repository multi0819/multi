import com.multi0819.roadride.*
fun main(){
 val gate=BleConnectionGate();val a=gate.next();check(gate.isCurrent(a));val b=gate.next();check(!gate.isCurrent(a));check(gate.isCurrent(b));gate.invalidate();check(!gate.isCurrent(b))
 check(BlePermissions.required(30)==listOf("android.permission.ACCESS_FINE_LOCATION"))
 for(api in listOf(31,33,35)) {val p=BlePermissions.required(api);check(p==listOf("android.permission.BLUETOOTH_SCAN","android.permission.BLUETOOTH_CONNECT"));check(p.none{it.contains("LOCATION")})}
 val modeGate=BleConnectionGate();val old=modeGate.next();var releases=0
 val wheelOnly=CscDecoder.decode(byteArrayOf(1,0,0,0,0,0,0))!!
 check(!modeGate.acceptCrank(wheelOnly){releases++})
 check(releases==1 && !modeGate.isCurrent(old))
 val fresh=modeGate.next();check(modeGate.acceptCrank(CscSample(1,1024)){releases++})
 check(modeGate.isCurrent(fresh) && releases==1)
 println("BLE: old callback invalidation and API-specific permissions PASS")
}
