package com.multi0819.roadride

import android.app.Activity
import android.content.Intent
import android.content.pm.ActivityInfo
import android.graphics.Color
import android.net.Uri
import android.os.Bundle
import android.view.View
import android.view.ViewGroup
import android.view.WindowInsets
import android.view.WindowInsetsController
import android.view.WindowManager
import android.webkit.*
import android.widget.FrameLayout
import java.io.ByteArrayInputStream

class MainActivity : Activity() {
    private lateinit var web: WebView
    private lateinit var root: FrameLayout
    private var custom: View? = null
    private var customLayout: android.widget.LinearLayout? = null
    private var statsView: android.widget.TextView? = null
    private var statsText="현재시간 —  |  라이딩 00:00  |  추정 — km/h  |  — km  |  — kcal"
    private var customCallback: WebChromeClient.CustomViewCallback? = null
    private val cadenceClient = CadenceClient()
    private var connectionEpoch = 0L
    private val appHost = AssetRouter.HOST
    private val remoteDomains = listOf("youtube.com", "youtube-nocookie.com", "ytimg.com", "googlevideo.com", "google.com", "gstatic.com", "googleusercontent.com", "doubleclick.net", "googleadservices.com", "googlesyndication.com")
    private fun trusted(host: String?): Boolean = host != null && remoteDomains.any { host == it || host.endsWith(".$it") }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        window.statusBarColor = Color.rgb(16, 23, 22)
        window.navigationBarColor = Color.rgb(16, 23, 22)
        root = FrameLayout(this)
        root.setBackgroundColor(Color.rgb(16, 23, 22))
        web = WebView(this)
        web.setBackgroundColor(Color.rgb(16, 23, 22))
        root.addView(web, FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT))
        setContentView(root)
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            root.setOnApplyWindowInsetsListener { view, insets ->
                val b = insets.getInsets(WindowInsets.Type.systemBars() or WindowInsets.Type.displayCutout())
                view.setPadding(b.left, b.top, b.right, b.bottom)
                insets
            }
        }
        with(web.settings) {
            javaScriptEnabled = true
            domStorageEnabled = true
            mediaPlaybackRequiresUserGesture = false
            allowFileAccess = false
            allowContentAccess = false
            mixedContentMode = WebSettings.MIXED_CONTENT_NEVER_ALLOW
            javaScriptCanOpenWindowsAutomatically = true
            setSupportMultipleWindows(false)
            userAgentString = userAgentString + " RoadRideAndroid/1.2.0"
        }
        CookieManager.getInstance().setAcceptCookie(true)
        CookieManager.getInstance().setAcceptThirdPartyCookies(web, true)
        web.webViewClient = object : WebViewClient() {
            override fun shouldInterceptRequest(view: WebView, request: WebResourceRequest): WebResourceResponse? {
                val uri = request.url
                if (uri.host == appHost && uri.scheme == "https") {
                    val name = AssetRouter.assetPath(uri.toString()) ?: return blocked()
                    return try {
                        val mime = when {
                            name.endsWith(".js") -> "application/javascript"
                            name.endsWith(".css") -> "text/css"
                            name.endsWith(".json") -> "application/json"
                            else -> "text/html"
                        }
                        WebResourceResponse(mime, "UTF-8", assets.open(name))
                    } catch (_: Exception) { blocked() }
                }
                if (uri.scheme != "https" || !trusted(uri.host)) return blocked()
                return null
            }
            override fun shouldOverrideUrlLoading(view: WebView, request: WebResourceRequest): Boolean {
                val uri = request.url
                if (!request.isForMainFrame) return uri.scheme != "https" || !trusted(uri.host)
                if (uri.scheme == "roadride" && web.url?.startsWith("https://$appHost/") == true) {
                    when (uri.host) {
                        "measure" -> startActivity(Intent(this@MainActivity, CadenceActivity::class.java))
                        "connect" -> connectSaved()
                        "connect-settings" -> showConnectionDialog()
                        "stats" -> { val value=uri.getQueryParameter("text");if(value!=null && value.length<=300){statsText=value;statsView?.text=value} }
                        "disconnect" -> { connectionEpoch++; cadenceClient.close(); cadenceStatus("disconnected") }
                        "landscape" -> { requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE; fullscreen(true) }
                        "portrait" -> { requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT; fullscreen(false) }
                        "immersive", "controls" -> fullscreen(true)
                    }
                    return true
                }
                if (uri.host == appHost && uri.scheme == "https") return false
                if (uri.scheme == "https" && (trusted(uri.host) || uri.host == "policies.google.com")) openExternal(uri)
                return true
            }
            override fun onReceivedError(view: WebView, request: WebResourceRequest, error: WebResourceError) {
                if (request.isForMainFrame) web.evaluateJavascript("window.pauseRide && window.pauseRide()", null)
            }
        }
        web.webChromeClient = object : WebChromeClient() {
            override fun onShowCustomView(view: View, callback: CustomViewCallback) {
                if (custom != null) { callback.onCustomViewHidden(); return }
                custom = view; customCallback = callback
                web.visibility = View.GONE
                val column=android.widget.LinearLayout(this@MainActivity).apply {orientation=android.widget.LinearLayout.VERTICAL;setBackgroundColor(Color.BLACK)}
                column.addView(view,android.widget.LinearLayout.LayoutParams(-1,0,1f))
                statsView=android.widget.TextView(this@MainActivity).apply {text=statsText;textSize=14f;setTextColor(Color.rgb(210,235,130));setPadding(16,8,16,8);gravity=android.view.Gravity.CENTER;setBackgroundColor(Color.rgb(16,23,22))}
                column.addView(statsView,android.widget.LinearLayout.LayoutParams(-1,-2));customLayout=column
                root.addView(column,FrameLayout.LayoutParams(-1,-1))
                fullscreen(true)
            }
            override fun onHideCustomView() { hideCustom() }
            override fun onJsConfirm(view: WebView, url: String, message: String, result: JsResult): Boolean {
                android.app.AlertDialog.Builder(this@MainActivity).setMessage(message)
                    .setPositiveButton("삭제") { _, _ -> result.confirm() }
                    .setNegativeButton("취소") { _, _ -> result.cancel() }
                    .setOnCancelListener { result.cancel() }.show()
                return true
            }
        }
        web.loadUrl(AssetRouter.startUrl)
    }
    private fun cadenceStatus(status: String) {
        web.evaluateJavascript("window.onCadenceStatus && window.onCadenceStatus(${org.json.JSONObject.quote(status)})", null)
    }
    private fun connectSaved() {
        val prefs=getSharedPreferences("cadence",MODE_PRIVATE)
        val value=prefs.getString("address","")?:"";val parts=value.split(':');val secret=prefs.getString("pair-token","")?:""
        val host=parts.firstOrNull()?:"";val port=parts.getOrNull(1)?.toIntOrNull()?:0
        if(parts.size==2 && secret.length==32 && CadenceClient.validEndpoint(host,port,secret)) connectCadence(host,port,secret)
        else showConnectionDialog()
    }
    private fun connectCadence(host:String,port:Int,secret:String) {
        val epoch=++connectionEpoch;cadenceStatus("connecting")
        cadenceClient.connect(host,port,secret,{packet->runOnUiThread {
            if(connectionEpoch==epoch && !isDestroyed) {
                val json=org.json.JSONObject().put("seq",packet.seq).put("rpm",packet.rpm).put("confidence",packet.confidence).put("state",packet.state)
                web.evaluateJavascript("window.onCadencePacket && window.onCadencePacket($json)",null)
            }
        }},{status->runOnUiThread {
            if(connectionEpoch==epoch && !isDestroyed) {
                cadenceStatus(status)
                if(status=="auth_failed" || status=="disconnected") android.widget.Toast.makeText(this,"휴대폰 측정 시작과 Wi-Fi를 확인하세요. 주소가 바뀌면 연결 설정에서 다시 등록하세요.",android.widget.Toast.LENGTH_LONG).show()
            }
        }},{token->runOnUiThread {if(connectionEpoch==epoch && !isDestroyed)getSharedPreferences("cadence",MODE_PRIVATE).edit().putString("pair-token",token).apply()}})
    }
    private fun showConnectionDialog() {
        val prefs=getSharedPreferences("cadence",MODE_PRIVATE)
        val form=android.widget.LinearLayout(this).apply {orientation=android.widget.LinearLayout.VERTICAL;setPadding(32,16,32,16)}
        val address=android.widget.EditText(this).apply {hint="휴대폰 주소:포트 · 예 192.168.1.4:40000";setSingleLine();setText(prefs.getString("address",""));inputType=android.text.InputType.TYPE_CLASS_TEXT or android.text.InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS}
        val code=android.widget.EditText(this).apply {hint="8자리 임시 코드";setSingleLine();inputType=android.text.InputType.TYPE_CLASS_NUMBER or android.text.InputType.TYPE_NUMBER_VARIATION_PASSWORD}
        form.addView(android.widget.TextView(this).apply {text="두 기기를 같은 가정 Wi-Fi에 연결하세요. 휴대폰에서 측정을 시작한 뒤 표시되는 값을 입력하세요."})
        form.addView(address);form.addView(code)
        val dialog=android.app.AlertDialog.Builder(this).setTitle("휴대폰 RPM 연결").setView(form).setPositiveButton("연결",null).setNegativeButton("취소",null).setNeutralButton("연결 해제") {_,_-> connectionEpoch++;cadenceClient.close();cadenceStatus("disconnected") }.create()
        dialog.setOnShowListener {dialog.getButton(android.app.AlertDialog.BUTTON_POSITIVE).setOnClickListener {
            val value=address.text.toString().trim();val parts=value.split(':');val host=parts.firstOrNull()?:"";val port=parts.getOrNull(1)?.toIntOrNull()?:0;val secret=code.text.toString().trim()
            if(parts.size!=2 || !CadenceClient.validEndpoint(host,port,secret)) {address.error="올바른 Wi-Fi IPv4 주소·포트와 8자리 코드를 입력하세요";return@setOnClickListener}
            prefs.edit().putString("address",value).apply()
            prefs.edit().remove("pair-token").apply()
            connectCadence(host,port,secret)
            dialog.dismiss()
        }}
        dialog.show()
    }
    private fun blocked() = WebResourceResponse("text/plain", "UTF-8", 403, "Forbidden", emptyMap(), ByteArrayInputStream(ByteArray(0)))
    private fun openExternal(uri: Uri) {
        web.evaluateJavascript("window.pauseRide && window.pauseRide()", null)
        try { startActivity(Intent(Intent.ACTION_VIEW, uri).addCategory(Intent.CATEGORY_BROWSABLE)) }
        catch (_: Exception) { android.widget.Toast.makeText(this, "링크를 열 수 있는 브라우저가 없습니다", android.widget.Toast.LENGTH_SHORT).show() }
    }
    @Suppress("DEPRECATION")
    private fun fullscreen(on: Boolean) {
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            window.insetsController?.apply {
                if (on) hide(WindowInsets.Type.systemBars()) else show(WindowInsets.Type.systemBars())
                systemBarsBehavior = WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
            }
        } else {
            window.decorView.systemUiVisibility = if (on) View.SYSTEM_UI_FLAG_FULLSCREEN or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION or View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY else View.SYSTEM_UI_FLAG_VISIBLE
        }
    }
    private fun hideCustom() {
        customLayout?.let {root.removeView(it);it.removeAllViews()};customLayout=null;statsView=null;custom=null
        web.visibility = View.VISIBLE
        customCallback?.onCustomViewHidden(); customCallback = null
    }
    @Suppress("DEPRECATION")
    override fun onBackPressed() {
        if (custom != null) { hideCustom(); return }
        web.evaluateJavascript("window.handleBack ? window.handleBack() : false") { value -> if (value != "true") finish() }
    }
    override fun onPause() {
        web.evaluateJavascript("window.pauseRide && window.pauseRide()", null)
        web.onPause()
        super.onPause()
    }
    override fun onResume() {
        super.onResume()
        if (::web.isInitialized) { web.onResume(); web.evaluateJavascript("window.foregroundRide && window.foregroundRide()", null) }
    }
    override fun onDestroy() {
        connectionEpoch++; cadenceClient.close(); hideCustom(); web.stopLoading(); web.destroy(); super.onDestroy()
    }
}
