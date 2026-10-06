package com.multi0819.roadride

import android.app.*
import android.content.*
import android.content.pm.ServiceInfo
import android.hardware.*
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.os.*
import java.net.Inet4Address
import java.security.SecureRandom

class CadenceService : Service(), SensorEventListener {
    private val estimator=CadenceEstimator()
    private val server=CadenceServer()
    private lateinit var sensors: SensorManager
    private var wake: PowerManager.WakeLock?=null
    private var lastNs=0L
    private val handler=Handler(Looper.getMainLooper())
    override fun onBind(intent: Intent?) = null
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if(intent?.action=="stop") { stopSelf();return START_NOT_STICKY }
        if(running) return START_NOT_STICKY
        val nm=getSystemService(NotificationManager::class.java)
        nm.createNotificationChannel(NotificationChannel("cadence","RPM 측정",NotificationManager.IMPORTANCE_LOW))
        val stop=PendingIntent.getService(this,2,Intent(this,CadenceService::class.java).setAction("stop"),PendingIntent.FLAG_IMMUTABLE)
        val open=PendingIntent.getActivity(this,3,Intent(this,CadenceActivity::class.java),PendingIntent.FLAG_IMMUTABLE)
        val notification=Notification.Builder(this,"cadence").setSmallIcon(android.R.drawable.ic_media_play).setContentTitle("로드라이드 · RPM 측정 중").setContentText("화면을 꺼도 측정을 계속합니다 · 눌러 연결 정보 보기").setContentIntent(open).setOngoing(true).addAction(Notification.Action.Builder(null,"측정 종료",stop).build()).build()
        if(Build.VERSION.SDK_INT>=29) startForeground(7,notification,ServiceInfo.FOREGROUND_SERVICE_TYPE_CONNECTED_DEVICE) else startForeground(7,notification)
        sensors=getSystemService(SensorManager::class.java)
        val sensor=sensors.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)
        if(sensor==null) { message="가속도 센서가 없어 측정할 수 없습니다";stopSelf();return START_NOT_STICKY }
        try {
            code=String.format(java.util.Locale.US,"%08d",SecureRandom().nextInt(100_000_000))
            reading=CadenceReading(0.0,0.0,"ready");lastNs=0L
            val prefs=getSharedPreferences("cadence-sender",MODE_PRIVATE)
            val token=prefs.getString("pair-token",null)?:java.util.UUID.randomUUID().toString().replace("-","").also {prefs.edit().putString("pair-token",it).apply()}
            port=server.start(code, { val r=reading;if(SystemClock.elapsedRealtimeNanos()-lastNs>3_000_000_000L) CadenceReading(0.0,0.0,"unstable") else r.copy(rpm=(r.rpm*factor).coerceIn(0.0,300.0)) }, token,39871)
            val cm=getSystemService(ConnectivityManager::class.java)
            address=cm.allNetworks.firstNotNullOfOrNull { n ->
                if(cm.getNetworkCapabilities(n)?.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)==true) cm.getLinkProperties(n)?.linkAddresses?.firstOrNull {it.address is Inet4Address}?.address?.hostAddress else null
            }?:"Wi-Fi 연결을 확인하세요"
            if(!sensors.registerListener(this,sensor,20_000)) throw IllegalStateException("sensor")
            wake=getSystemService(PowerManager::class.java).newWakeLock(PowerManager.PARTIAL_WAKE_LOCK,"RoadRide:Cadence").apply {acquire(4*60*60*1000L)}
            running=true;message="준비 중 · 앞주머니에 넣고 페달을 밟아주세요"
            handler.postDelayed({message="4시간 제한으로 측정을 종료했습니다";stopSelf()},4*60*60*1000L)
        } catch(_:Exception) {message="측정을 시작하지 못했습니다. Wi-Fi와 센서를 확인하세요";stopSelf()}
        return START_NOT_STICKY
    }
    override fun onSensorChanged(event: SensorEvent) { lastNs=event.timestamp;reading=estimator.add(event.timestamp,event.values[0].toDouble(),event.values[1].toDouble(),event.values[2].toDouble()) }
    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {}
    override fun onDestroy() {handler.removeCallbacksAndMessages(null);if(::sensors.isInitialized)sensors.unregisterListener(this);server.stop();wake?.let {if(it.isHeld)it.release()};running=false;reading=CadenceReading(0.0,0.0,"ready");code="";port=0;super.onDestroy()}
    companion object {
        @Volatile var running=false;private set
        @Volatile var reading=CadenceReading(0.0,0.0,"ready");private set
        @Volatile var factor=1.0
        @Volatile var address="";private set
        @Volatile var code="";private set
        @Volatile var port=0;private set
        @Volatile var message="측정을 시작하면 연결 주소와 임시 코드가 표시됩니다";private set
    }
}
