(() => {
  if (!window.AndroidStudy) return;
  let sequence=0, active=null;
  window.SpeechSynthesisUtterance=function(text) { this.text=String(text||'');this.rate=1;this.lang='ko-KR'; };
  window.speechSynthesis={
    speaking:false, paused:false,
    getVoices:()=>[{name:'Android 한국어',lang:'ko-KR',localService:true}],
    speak(u) { active={id:String(++sequence),u};this.speaking=true;this.paused=false;AndroidStudy.speak(u.text,Number(u.rate)||1,active.id); },
    cancel() { active=null;this.speaking=false;this.paused=false;AndroidStudy.stop(); },
    pause() {}, resume() {}
  };
  window.studySpeechEvent=(id,event)=>{
    if (!active || active.id!==id) return;
    const u=active.u;
    if(event==='start') { if(u.onstart) u.onstart();return; }
    active=null;speechSynthesis.speaking=false;
    if(event==='done') { if(u.onend) u.onend(); }
    else if(u.onerror) u.onerror({error:'synthesis-failed'});
  };
  let saving=false;
  window.saveNativeBlob=async(blob,name)=>{
    if(saving) { alert('다른 파일을 저장 중입니다. 잠시 후 다시 눌러 주세요.');return; }
    saving=true;
    try {
      AndroidStudy.saveStart(name,blob.type||'application/octet-stream');
      for(let offset=0;offset<blob.size;offset+=32768) {
        const bytes=new Uint8Array(await blob.slice(offset,offset+32768).arrayBuffer());
        let binary='';for(const byte of bytes) binary+=String.fromCharCode(byte);
        AndroidStudy.saveChunk(btoa(binary));
      }
      AndroidStudy.saveFinish();
    } catch(e) { alert('파일 준비에 실패했습니다. 다시 시도해 주세요.'); }
    finally { saving=false; }
  };
  window.print=()=>AndroidStudy.printPage();
})();
