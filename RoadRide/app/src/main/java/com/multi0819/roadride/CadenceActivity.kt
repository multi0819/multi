package com.multi0819.roadride

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.os.*
import android.widget.*

class CadenceActivity : Activity() {
    private lateinit var state: TextView
    private lateinit var connection: TextView
    private val handler=Handler(Looper.getMainLooper())
    private val refresh=object:Runnable { override fun run() {
        val r=CadenceService.reading
        state.text=if(CadenceService.running) "추정 RPM  ${Math.round(r.rpm*CadenceService.factor)}\n"+when(r.state){"tracking"->"측정 중";"stopped"->"페달 정지";"unstable"->"측정 불안정 · 주머니 위치를 조절하세요";else->"움직임 분석 중"} else CadenceService.message
        connection.text=if(CadenceService.running) "연결 주소  ${CadenceService.address}:${CadenceService.port}\n임시 코드  ${CadenceService.code}" else "측정 종료됨"
        handler.postDelayed(this,500)
    } }
    override fun onCreate(savedInstanceState:Bundle?) {
        super.onCreate(savedInstanceState)
        val layout=LinearLayout(this).apply {orientation=LinearLayout.VERTICAL;setPadding(28,40,28,24);setBackgroundColor(Color.rgb(16,23,22))}
        fun text(value:String,size:Float=18f)=TextView(this).apply {text=value;textSize=size;setTextColor(Color.WHITE);setPadding(0,16,0,16);layout.addView(this)}
        text("ROADRIDE · 휴대폰 RPM 측정",24f)
        state=text("준비 중",24f);connection=text("")
        fun button(label:String,action:()->Unit)=Button(this).apply {text=label;setOnClickListener{action()};layout.addView(this)}
        button("측정 시작") {
            if(Build.VERSION.SDK_INT>=33 && checkSelfPermission(android.Manifest.permission.POST_NOTIFICATIONS)!=android.content.pm.PackageManager.PERMISSION_GRANTED) requestPermissions(arrayOf(android.Manifest.permission.POST_NOTIFICATIONS),42)
            try{startForegroundService(Intent(this,CadenceService::class.java))}catch(_:Exception){Toast.makeText(this,"앱 화면에서 다시 시작해주세요",Toast.LENGTH_LONG).show()}
        }
        button("측정 종료") {stopService(Intent(this,CadenceService::class.java))}
        text("RPM 보정 · 실제보다 두 배면 0.5배를 선택")
        val choices=LinearLayout(this);layout.addView(choices)
        for(f in listOf(.5,1.0,2.0)) choices.addView(Button(this).apply {text="$f 배";setOnClickListener{CadenceService.factor=f;Toast.makeText(this@CadenceActivity,"보정 $f 배",Toast.LENGTH_SHORT).show()}},LinearLayout.LayoutParams(0,-2,1f))
        text("두 기기를 같은 Wi-Fi에 연결하세요. 갤럭시탭의 ‘휴대폰 연결’에 주소와 코드를 입력한 뒤 휴대폰을 바지 앞주머니에 넣으세요.\n\n신뢰하는 가정 Wi-Fi를 사용하세요. 화면 꺼짐 후 값이 멈추면 휴대폰 설정에서 로드라이드의 배터리 제한을 확인하세요. 최대 4시간 측정하며 자동 재시작하지 않습니다.\n\n추정값은 주머니 위치와 움직임에 영향을 받습니다. 원본 센서 데이터는 저장하지 않습니다.",15f)
        button("코스 화면으로 돌아가기"){finish()}
        setContentView(ScrollView(this).apply {addView(layout)})
    }
    override fun onResume(){super.onResume();handler.post(refresh)}
    override fun onPause(){handler.removeCallbacks(refresh);super.onPause()}
}
