package com.multi0819.studylog

import android.app.Activity
import android.app.AlertDialog
import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.os.Build
import android.view.WindowInsets
import android.widget.FrameLayout
import android.print.PrintAttributes
import android.print.PrintManager
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import android.util.Base64
import android.webkit.*
import android.widget.Toast
import android.net.Uri
import java.io.File
import java.io.FileOutputStream
import java.util.Locale
import org.json.JSONObject

class MainActivity : Activity() {
 private lateinit var web: WebView
 private var chooser: ValueCallback<Array<Uri>>? = null
 private var tts: TextToSpeech? = null
 private var ttsReady=false
 private var ttsInitialized=false
 private var pendingSpeech: Triple<String,Float,String>?=null
 private var exportFile: File?=null
 private var exportStream: FileOutputStream?=null
 private var exportName="study-log-backup.json"
 private var exportMime="application/json"
 private var saving=false
 private val origin="https://appassets.androidplatform.net/"

 override fun onCreate(state: Bundle?) {
  super.onCreate(state)
  window.statusBarColor=Color.rgb(9,17,29)
  window.navigationBarColor=Color.rgb(9,17,29)
  web=WebView(this)
  val host=FrameLayout(this)
  host.addView(web,FrameLayout.LayoutParams(-1,-1));setContentView(host)
  if(Build.VERSION.SDK_INT>=35) {
   host.setOnApplyWindowInsetsListener { view,insets ->
    val safe=insets.getInsets(WindowInsets.Type.systemBars() or WindowInsets.Type.displayCutout() or WindowInsets.Type.ime())
    view.setPadding(safe.left,safe.top,safe.right,safe.bottom)
    insets
   }
   host.requestApplyInsets()
  }
  web.settings.apply {
   javaScriptEnabled=true;domStorageEnabled=true;allowFileAccess=false;allowContentAccess=true
   mixedContentMode=WebSettings.MIXED_CONTENT_NEVER_ALLOW;mediaPlaybackRequiresUserGesture=false
  }
  web.addJavascriptInterface(Bridge(),"AndroidStudy")
  web.webViewClient=object:WebViewClient() {
   override fun shouldInterceptRequest(view:WebView,request:WebResourceRequest):WebResourceResponse {
    val uri=request.url
    if(uri.scheme=="https" && uri.host=="appassets.androidplatform.net") {
     val name=uri.path?.removePrefix("/")?.ifEmpty { "index.html" } ?: "index.html"
     if(name.matches(Regex("[a-zA-Z0-9._-]+"))) try {
      val mime=when { name.endsWith(".js")->"application/javascript";name.endsWith(".html")->"text/html";name.endsWith(".css")->"text/css";else->"application/octet-stream" }
      return WebResourceResponse(mime,"UTF-8",assets.open(name))
     } catch(_:Exception) {}
    }
    return WebResourceResponse("text/plain","UTF-8",404,"Not Found",emptyMap(),"".byteInputStream())
   }
   override fun shouldOverrideUrlLoading(view:WebView,request:WebResourceRequest):Boolean = request.url.toString()!=origin+"index.html"
  }
  web.webChromeClient=object:WebChromeClient() {
   override fun onJsAlert(v:WebView,url:String,message:String,result:JsResult):Boolean {
    AlertDialog.Builder(this@MainActivity).setMessage(message).setPositiveButton("확인") { _,_->result.confirm() }.setOnCancelListener { result.cancel() }.show();return true
   }
   override fun onJsConfirm(v:WebView,url:String,message:String,result:JsResult):Boolean {
    AlertDialog.Builder(this@MainActivity).setMessage(message).setPositiveButton("확인") { _,_->result.confirm() }.setNegativeButton("취소") { _,_->result.cancel() }.setOnCancelListener { result.cancel() }.show();return true
   }
   override fun onShowFileChooser(v:WebView,callback:ValueCallback<Array<Uri>>,params:FileChooserParams):Boolean {
    chooser?.onReceiveValue(null);chooser=callback
    val image=params.acceptTypes.any { it.startsWith("image/") }
    val intent=Intent(Intent.ACTION_OPEN_DOCUMENT).apply { addCategory(Intent.CATEGORY_OPENABLE);type=if(image) "image/*" else "*/*";putExtra(Intent.EXTRA_ALLOW_MULTIPLE,params.mode==FileChooserParams.MODE_OPEN_MULTIPLE) }
    try { startActivityForResult(intent,100) } catch(_:Exception) { chooser?.onReceiveValue(null);chooser=null;toast("파일 선택기를 열 수 없습니다.") }
    return true
   }
  }
  tts=TextToSpeech(this) { status ->
   ttsInitialized=true
   ttsReady=status==TextToSpeech.SUCCESS
   if(ttsReady) {
    ttsReady=(tts?.setLanguage(Locale.KOREAN) ?: -1)>=0
    tts?.setOnUtteranceProgressListener(object:UtteranceProgressListener() {
     override fun onStart(id:String)=speechEvent(id,"start")
     override fun onDone(id:String)=speechEvent(id,"done")
     @Deprecated("Legacy Android callback") override fun onError(id:String)=speechEvent(id,"error")
    })
   }
   pendingSpeech?.let { pendingSpeech=null; speakText(it.first,it.second,it.third) }
  }
  web.loadUrl(origin+"index.html")
 }
 private fun toast(text:String) { runOnUiThread { Toast.makeText(this,text,Toast.LENGTH_LONG).show() } }
 private fun speechEvent(id:String,event:String) { runOnUiThread { if(!isFinishing) web.evaluateJavascript("window.studySpeechEvent(${JSONObject.quote(id)},${JSONObject.quote(event)});",null) } }
 private fun speakText(text:String,rate:Float,id:String) {
  if(!ttsReady) { toast("휴대폰의 한국어 TTS 음성을 확인해 주세요.");speechEvent(id,"error");return }
  tts?.setSpeechRate(rate.coerceIn(0.5f,2f))
  if((tts?.speak(text,TextToSpeech.QUEUE_FLUSH,null,id) ?: TextToSpeech.ERROR)==TextToSpeech.ERROR) speechEvent(id,"error")
 }
 inner class Bridge {
  @JavascriptInterface fun speak(text:String,rate:Float,id:String) { runOnUiThread { if(ttsInitialized) speakText(text,rate,id) else { pendingSpeech=Triple(text,rate,id);toast("음성 엔진 준비 중입니다.") } } }
  @JavascriptInterface fun stop() { runOnUiThread { pendingSpeech=null;tts?.stop() } }
  @JavascriptInterface @Synchronized fun saveStart(name:String,mime:String) {
   if(saving) throw IllegalStateException("Save already active")
   saving=true; exportName=name.replace(Regex("[^a-zA-Z0-9._-]"),"_").take(100);exportMime=mime
   exportFile=File(cacheDir,"export-${System.nanoTime()}");exportStream=FileOutputStream(exportFile)
  }
  @JavascriptInterface @Synchronized fun saveChunk(data:String) { exportStream?.write(Base64.decode(data,Base64.NO_WRAP)) }
  @JavascriptInterface @Synchronized fun saveFinish() {
   exportStream?.close();exportStream=null
   runOnUiThread {
    try { startActivityForResult(Intent(Intent.ACTION_CREATE_DOCUMENT).apply { addCategory(Intent.CATEGORY_OPENABLE);type=exportMime;putExtra(Intent.EXTRA_TITLE,exportName) },101) }
    catch(_:Exception) { exportFile?.delete();saving=false;toast("저장 창을 열 수 없습니다.") }
   }
  }
  @JavascriptInterface fun printPage() { runOnUiThread {
   val attributes=PrintAttributes.Builder().setMediaSize(PrintAttributes.MediaSize.ISO_A4).setMinMargins(PrintAttributes.Margins.NO_MARGINS).setColorMode(PrintAttributes.COLOR_MODE_COLOR).build()
   (getSystemService(PRINT_SERVICE) as PrintManager).print("학습기록",web.createPrintDocumentAdapter("학습기록"),attributes)
  } }
 }
 override fun onActivityResult(request:Int,result:Int,data:Intent?) {
  super.onActivityResult(request,result,data)
  if(request==100) {
   val uris=if(result==RESULT_OK) data?.clipData?.let { clip -> Array(clip.itemCount) { clip.getItemAt(it).uri } } ?: data?.data?.let { arrayOf(it) } else null
   chooser?.onReceiveValue(uris);chooser=null
  } else if(request==101) {
   val file=exportFile
   val uri=if(result==RESULT_OK) data?.data else null
   if(uri!=null && file!=null) Thread {
    try {
     val out=contentResolver.openOutputStream(uri,"wt") ?: throw IllegalStateException("No output stream")
     out.use { target -> file.inputStream().use { it.copyTo(target) } };toast("파일을 저장했습니다.")
    } catch(_:Exception) { toast("파일 저장에 실패했습니다. 다시 시도해 주세요.") }
    finally { file.delete();saving=false }
   }.start() else { file?.delete();saving=false }
  }
 }
 @Deprecated("Supported for Android 8+") override fun onBackPressed() {
  web.evaluateJavascript("(function(){if(document.getElementById('pdfPreviewOverlay')){document.getElementById('pdfPreviewCloseBtn').click();return true;}if(typeof closeSideNav==='function')closeSideNav();return false;})()") { handled -> if(handled!="true") { tts?.stop();finish() } }
 }
 override fun onDestroy() { chooser?.onReceiveValue(null);tts?.stop();tts?.shutdown();exportStream?.close();web.destroy();super.onDestroy() }
}
