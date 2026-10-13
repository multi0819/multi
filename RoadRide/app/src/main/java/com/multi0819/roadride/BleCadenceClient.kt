package com.multi0819.roadride

import android.app.Activity
import android.app.AlertDialog
import android.bluetooth.*
import android.bluetooth.le.*
import android.content.Intent
import android.content.pm.PackageManager
import android.location.LocationManager
import android.os.*
import android.widget.ArrayAdapter
import android.widget.ListView
import java.util.UUID

/** Owns a foreground picker and a single GATT. All mutable state lives on the main looper. */
class BleCadenceClient(private val activity:Activity,private val onReading:(CadenceReading)->Unit,private val onStatus:(String)->Unit) {
    private val handler=Handler(Looper.getMainLooper())
    private val scanGate=BleConnectionGate()
    private val connectionGate=BleConnectionGate()
    private var foreground=false
    private var closed=false
    private var scanner:BluetoothLeScanner?=null
    private var scanCallback:ScanCallback?=null
    private var scanDeadline:Runnable?=null
    private var setupDeadline:Runnable?=null
    private var picker:AlertDialog?=null
    private var failureDialog:AlertDialog?=null
    private var pendingPermission:Pair<Long,()->Unit>?=null
    private var gatt:BluetoothGatt?=null
    private var subscribed=false
    private var lastNotice=""
    private val cadence=CscCadence()
    private val prefs=activity.getSharedPreferences("ble-cadence",Activity.MODE_PRIVATE)
    private val serviceId=uuid(0x1816)
    private val measurementId=uuid(0x2A5B)
    private val cccdId=uuid(0x2902)
    private fun uuid(short:Int)=UUID.fromString("0000%04x-0000-1000-8000-00805f9b34fb".format(short))
    private fun status(value:String){if(!closed)onStatus(value)}
    fun onResume(){foreground=true}
    fun onPause(){foreground=false;stopScan();failureDialog?.dismiss();failureDialog=null}
    fun showPicker(){withPermissions { startPicker() }}
    fun connectSaved(){withPermissions {
        val address=prefs.getString("address",null)
        if(address==null)startPicker()else {
            try{val adapter=availableAdapter()?:return@withPermissions;connect(adapter.getRemoteDevice(address))}
            catch(_:Exception){failure("connection_failed")}
        }
    }}
    private fun withPermissions(action:()->Unit){
        if(closed || !foreground)return
        val missing=BlePermissions.required(Build.VERSION.SDK_INT).filter {activity.checkSelfPermission(it)!=PackageManager.PERMISSION_GRANTED}
        if(missing.isEmpty()){action();return}
        pendingPermission=scanGate.next() to action
        status(if(Build.VERSION.SDK_INT>=31)"permission_required" else "location_permission_required")
        activity.requestPermissions(missing.toTypedArray(),PERMISSION_REQUEST)
    }
    fun onRequestPermissionsResult(requestCode:Int){
        if(requestCode!=PERMISSION_REQUEST || closed)return
        val request=pendingPermission;pendingPermission=null
        val granted=BlePermissions.required(Build.VERSION.SDK_INT).all {activity.checkSelfPermission(it)==PackageManager.PERMISSION_GRANTED}
        if(!granted){status("permission_denied");return}
        if(request!=null && scanGate.isCurrent(request.first) && foreground)request.second()
        else status("permission_granted")
    }
    private fun availableAdapter():BluetoothAdapter?{
        val manager=activity.getSystemService(BluetoothManager::class.java)
        val adapter=manager?.adapter
        if(adapter==null){status("ble_unavailable");return null}
        if(!adapter.isEnabled){
            status("bluetooth_off")
            if(foreground)try{activity.startActivity(Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE))}catch(_:Exception){}
            return null
        }
        if(Build.VERSION.SDK_INT<=30){
            val location=activity.getSystemService(LocationManager::class.java)
            val enabled=location.isProviderEnabled(LocationManager.GPS_PROVIDER)||location.isProviderEnabled(LocationManager.NETWORK_PROVIDER)
            if(!enabled){status("location_off");return null}
        }
        return adapter
    }
    private fun startPicker(){
        if(closed || !foreground)return
        stopScan();failureDialog?.dismiss();failureDialog=null
        val adapter=availableAdapter()?:return
        val nativeScanner=adapter.bluetoothLeScanner?:run{status("ble_unavailable");return}
        val token=scanGate.next()
        val devices=linkedMapOf<String,BluetoothDevice>()
        val labels=ArrayAdapter<String>(activity,android.R.layout.simple_list_item_1)
        val list=ListView(activity).apply {this.adapter=labels}
        var selected=false
        val dialog=AlertDialog.Builder(activity).setTitle("센서 검색 · 페달을 돌려 깨워주세요").setView(list)
            .setMessage("S314를 선택하세요. 다른 앱에서 센서 연결을 종료하면 검색이 쉬워집니다.")
            .setNegativeButton("닫기",null).create()
        picker=dialog
        list.setOnItemClickListener {_,_,position,_->
            val device=devices.values.elementAtOrNull(position)?:return@setOnItemClickListener
            selected=true;dialog.dismiss();endScan()
            if(foreground && !closed)connect(device)
        }
        dialog.setOnDismissListener {
            endScan();scanGate.invalidate();if(picker===dialog)picker=null
            if(!selected && !closed)status("disconnected")
        }
        dialog.show()
        val callback=object:ScanCallback(){
            override fun onScanResult(callbackType:Int,result:ScanResult){handler.post {
                if(!scanGate.isCurrent(token)||closed||!foreground||picker!==dialog)return@post
                try{
                    val device=result.device;val address=device.address
                    if(address !in devices && devices.size<50){
                        devices[address]=device
                        val name=result.scanRecord?.deviceName?:device.name?:"이름 없는 BLE 장치"
                        labels.add("${name.take(48)} · ${address.takeLast(5)}")
                    }
                }catch(_:SecurityException){stopScan();status("permission_denied")}
            }}
            override fun onScanFailed(errorCode:Int){handler.post {
                if(scanGate.isCurrent(token)&&!closed){endScan();status("scan_failed");dialog.setTitle("검색 실패 · Bluetooth를 확인하세요")}
            }}
        }
        scanner=nativeScanner;scanCallback=callback
        val deadline=Runnable {
            if(scanGate.isCurrent(token)&&picker===dialog){endScan();status(if(devices.isEmpty())"scan_empty" else "scan_complete");dialog.setTitle(if(devices.isEmpty())"검색 결과 없음 · 다시 페달을 돌려주세요" else "검색 완료 · S314를 선택하세요")}
        }
        scanDeadline=deadline
        try{nativeScanner.startScan(null,ScanSettings.Builder().setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY).build(),callback);status("scanning");handler.postDelayed(deadline,15000)}
        catch(_:Exception){endScan();status("scan_failed");dialog.setTitle("검색 실패 · 권한과 Bluetooth를 확인하세요")}
    }
    private fun endScan(){
        scanDeadline?.let {handler.removeCallbacks(it)};scanDeadline=null
        val s=scanner;val c=scanCallback;scanner=null;scanCallback=null
        if(s!=null && c!=null)try{s.stopScan(c)}catch(_:Exception){}
    }
    fun stopScan(){pendingPermission=null;scanGate.invalidate();endScan();picker?.dismiss();picker=null}
    private fun closeGatt(){
        connectionGate.invalidate();setupDeadline?.let{handler.removeCallbacks(it)};setupDeadline=null
        val old=gatt;gatt=null;subscribed=false;lastNotice="";cadence.reset()
        if(old!=null){try{old.disconnect()}catch(_:Exception){};try{old.close()}catch(_:Exception){}}
    }
    fun close(){closed=true;stopScan();closeGatt();failureDialog?.dismiss();failureDialog=null;handler.removeCallbacksAndMessages(null)}
    private fun failure(reason:String){
        closeGatt();status(reason)
        if(!closed && foreground){
            failureDialog?.dismiss()
            failureDialog=AlertDialog.Builder(activity).setTitle("센서 연결 확인")
                .setMessage("케이던스 모드인지 확인하고 페달을 돌려주세요. 다른 앱의 센서 연결은 종료하세요. 저장된 센서가 보이지 않으면 다시 검색할 수 있습니다.")
                .setPositiveButton("다시 검색") {_,_->showPicker()}.setNegativeButton("닫기",null).show()
        }
    }
    private fun connect(device:BluetoothDevice){
        if(closed||!foreground)return
        closeGatt();val token=connectionGate.next();status("connecting")
        fun valid(peer:BluetoothGatt)=!closed && connectionGate.isCurrent(token) && gatt===peer
        val callback=object:BluetoothGattCallback(){
            override fun onConnectionStateChange(peer:BluetoothGatt,result:Int,newState:Int){handler.post {
                if(!valid(peer))return@post
                if(result!=BluetoothGatt.GATT_SUCCESS || newState==BluetoothProfile.STATE_DISCONNECTED){failure("disconnected");return@post}
                if(newState==BluetoothProfile.STATE_CONNECTED)try{if(!peer.discoverServices())failure("subscription_failed")}catch(_:Exception){failure("permission_denied")}
            }}
            override fun onServicesDiscovered(peer:BluetoothGatt,result:Int){handler.post {
                if(!valid(peer))return@post
                if(result!=BluetoothGatt.GATT_SUCCESS){failure("subscription_failed");return@post}
                val characteristic=peer.getService(serviceId)?.getCharacteristic(measurementId)
                val descriptor=characteristic?.getDescriptor(cccdId)
                if(characteristic==null || descriptor==null || characteristic.properties and BluetoothGattCharacteristic.PROPERTY_NOTIFY==0){failure("unsupported_sensor");return@post}
                try{
                    if(!peer.setCharacteristicNotification(characteristic,true)){failure("subscription_failed");return@post}
                    val accepted=if(Build.VERSION.SDK_INT>=33)peer.writeDescriptor(descriptor,BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE)==BluetoothStatusCodes.SUCCESS else {
                        @Suppress("DEPRECATION") descriptor.value=BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE
                        @Suppress("DEPRECATION") val sent=peer.writeDescriptor(descriptor);sent
                    }
                    if(!accepted)failure("subscription_failed")
                }catch(_:Exception){failure("permission_denied")}
            }}
            override fun onDescriptorWrite(peer:BluetoothGatt,descriptor:BluetoothGattDescriptor,result:Int){handler.post {
                if(!valid(peer)||descriptor.uuid!=cccdId)return@post
                if(result!=BluetoothGatt.GATT_SUCCESS){failure("subscription_failed");return@post}
                subscribed=true;setupDeadline?.let{handler.removeCallbacks(it)};setupDeadline=null
                try{prefs.edit().putString("address",device.address).apply()}catch(_:Exception){}
                lastNotice="connected";status("connected")
            }}
            @Suppress("DEPRECATION") override fun onCharacteristicChanged(peer:BluetoothGatt,characteristic:BluetoothGattCharacteristic){
                if(Build.VERSION.SDK_INT<33 && characteristic.uuid==measurementId)receive(peer,characteristic.value?.copyOf()?:byteArrayOf())
            }
            override fun onCharacteristicChanged(peer:BluetoothGatt,characteristic:BluetoothGattCharacteristic,value:ByteArray){if(characteristic.uuid==measurementId)receive(peer,value.copyOf())}
            private fun receive(peer:BluetoothGatt,value:ByteArray){handler.post {
                if(!valid(peer)||!subscribed)return@post
                val sample=CscDecoder.decode(value)
                if(sample==null){cadence.reset();onReading(CadenceReading(0.0,0.0,"unstable"));return@post}
                if(sample.crankRevolutions==null){cadence.reset();if(lastNotice!="mode_required"){lastNotice="mode_required";status("mode_required")};return@post}
                if(lastNotice!="connected"){lastNotice="connected";status("connected")}
                onReading(cadence.add(sample,SystemClock.elapsedRealtime()))
            }}
        }
        val deadline=Runnable {if(connectionGate.isCurrent(token)&&!closed)failure("connection_timeout")}
        setupDeadline=deadline
        try{
            gatt=device.connectGatt(activity,false,callback,BluetoothDevice.TRANSPORT_LE)
            if(gatt==null){failure("connection_failed");return}
            handler.postDelayed(deadline,15000)
        }catch(_:Exception){failure("connection_failed")}
    }
    companion object {const val PERMISSION_REQUEST=714}
}
