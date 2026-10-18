package kr.memorynotes;
import android.speech.tts.*;
/** Test APK only: deterministic PCM, no voice downloads or network required. */
public class TestSpeechEngine extends TextToSpeechService {
 protected String[] onGetLanguage(){return new String[]{"kor","KOR",""};}
 protected int onIsLanguageAvailable(String language,String country,String variant){return "kor".equals(language)||"ko".equals(language)?(country.isEmpty()?TextToSpeech.LANG_AVAILABLE:TextToSpeech.LANG_COUNTRY_AVAILABLE):TextToSpeech.LANG_NOT_SUPPORTED;}
 protected int onLoadLanguage(String language,String country,String variant){return onIsLanguageAvailable(language,country,variant);}
 protected void onStop(){}
 protected void onSynthesizeText(SynthesisRequest request,SynthesisCallback callback){
  callback.start(16000,android.media.AudioFormat.ENCODING_PCM_16BIT,1);
  byte[] pcm=new byte[3200];for(int i=0;i<10;i++)if(callback.audioAvailable(pcm,0,pcm.length)!=TextToSpeech.SUCCESS)return;
  callback.done();
 }
}
