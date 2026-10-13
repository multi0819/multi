import com.multi0819.roadride.*
fun main(){
 val gate=BleConnectionGate();val a=gate.next();check(gate.isCurrent(a));val b=gate.next();check(!gate.isCurrent(a));check(gate.isCurrent(b));gate.invalidate();check(!gate.isCurrent(b))
 check(BlePermissions.required(30)==listOf("android.permission.ACCESS_FINE_LOCATION"))
 for(api in listOf(31,33,35)) {val p=BlePermissions.required(api);check(p==listOf("android.permission.BLUETOOTH_SCAN","android.permission.BLUETOOTH_CONNECT"));check(p.none{it.contains("LOCATION")})}
 println("BLE: old callback invalidation and API-specific permissions PASS")
}
