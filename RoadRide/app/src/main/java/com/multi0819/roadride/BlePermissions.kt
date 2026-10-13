package com.multi0819.roadride

object BlePermissions {
    fun required(api:Int):List<String> = if(api>=31)listOf("android.permission.BLUETOOTH_SCAN","android.permission.BLUETOOTH_CONNECT")else listOf("android.permission.ACCESS_FINE_LOCATION")
}
