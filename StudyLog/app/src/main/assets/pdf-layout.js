(() => {
 'use strict';
 const escape=text=>String(text??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 function nodeBody(nodes) {
  const paragraphs=[[]];
  for(const node of nodes) {
   if(node.type==='newline')paragraphs.push([]);
   else if(node.type==='text'||node.type==='br')paragraphs[paragraphs.length-1].push(node);
  }
  function fragments(line,skip=0) {
   return line.map(node=>{
    if(node.type==='br')return '<br>';
    const original=String(node.text||'');const text=original.slice(skip);skip=Math.max(0,skip-original.length);
    let color=String(node.color||'');
    if(!/^#[0-9a-f]{6}$/i.test(color))color='';
    if(color) {
     const rgb=[1,3,5].map(offset=>parseInt(color.slice(offset,offset+2),16));
     if((rgb[0]*.299+rgb[1]*.587+rgb[2]*.114)>185)color='';
    }
    const emphasis=parseFloat(node.fontSize)>=24;
    const escaped=escape(text).replace(/\n/g,'<br>');
    return color||emphasis?'<span'+(emphasis?' class="pdf-node-emphasis"':'')+(color?' style="color:'+color+'"':'')+'>'+escaped+'</span>':escaped;
   }).join('');
  }
  return paragraphs.map(line=>{
   const text=line.map(n=>n.type==='text'?String(n.text||''):'\n').join('');
   const marker=text.match(/^\s*([-•]|\d+[.)]|[①-⑳])\s+/);
   if(marker) return '<div class="pdf-list-line"><span class="pdf-list-marker">'+escape(marker[1])+'</span><span>'+fragments(line,marker[0].length)+'</span></div>';
   return '<p>'+ (fragments(line)||'<br>')+'</p>';
  }).join('');
 }
 function cleanBody(html,text) {
  if(!html) return String(text||'').split(/\n\s*\n/).map(p=>'<p>'+escape(p).replace(/\n/g,'<br>')+'</p>').join('') || '<p class="pdf-empty">내용 없음</p>';
  const source=document.createElement('template');source.innerHTML=html;
  const allowed=new Set(['P','DIV','BR','UL','OL','LI','STRONG','B','EM','I','U','S','SPAN','H1','H2','H3','H4','BLOCKQUOTE','HR','TABLE','THEAD','TBODY','TR','TH','TD']);
  const discard=new Set(['SCRIPT','STYLE','IFRAME','OBJECT','EMBED','LINK','META','INPUT','BUTTON','SELECT','TEXTAREA','SVG']);
  function copy(node) {
   if(node.nodeType===3) return escape(node.textContent);
   if(node.nodeType!==1||discard.has(node.tagName))return '';
   const children=Array.from(node.childNodes).map(copy).join('');
   if(!allowed.has(node.tagName))return children;
   const tag=node.tagName.toLowerCase();
   let style='';
   for(const property of ['text-align','font-weight','font-style','text-decoration','color','background-color']) {
    const value=node.style.getPropertyValue(property);
    if(value&&!/[<>"'{};]|url\(/i.test(value))style+=property+':'+value+';';
   }
   const attrs=style?' style="'+escape(style)+'"':'';
   if(tag==='br'||tag==='hr')return '<'+tag+'>';
   return '<'+tag+attrs+'>'+children+'</'+tag+'>';
  }
  return Array.from(source.content.childNodes).map(copy).join('') || '<p class="pdf-empty">내용 없음</p>';
 }
 function build(records,images,options={}) {
  const title=options.title?.trim()||'학습기록';
  const format=options.formatDate||((value)=>new Date(value).toLocaleString('ko-KR'));
  const body=records.map((item,index)=>{
   const tags=(item.tags||[]).map(escape).join(' · ');
   const photos=options.includeImages===false?'':(item.imageIds||[]).map((id,n)=>{
    const src=images[id];if(!src||!(/^(data:image\/|blob:)/i.test(src)))return '<figure class="study-pdf-photo"><div class="pdf-photo-missing">사진 '+(n+1)+' · 원본 사진을 찾지 못했습니다.</div></figure>';
    return '<figure class="study-pdf-photo"><img src="'+escape(src)+'" alt="첨부 사진 '+(n+1)+'"><figcaption>사진 '+(n+1)+'</figcaption></figure>';
   }).join('');
   const content=Array.isArray(item.nodes)&&item.nodes.length?nodeBody(item.nodes):cleanBody(item.contentHtml,item.contentText);
   return '<section class="study-pdf-record" data-record-id="'+escape(item.id)+'"><header class="study-pdf-record-header"><span class="study-pdf-number">'+String(index+1).padStart(2,'0')+'</span><div><h2>'+escape(format(item.studiedAt||item.createdAt))+'</h2><div class="study-pdf-meta">학습 '+escape(Number(item.minutes||0))+'분'+(item.favorite?' · 중요 기록':'')+(tags?' · '+tags:'')+'</div></div></header><div class="study-pdf-body">'+content+'</div>'+photos+'</section>';
  }).join('');
  return '<article class="study-pdf-report"><header class="study-pdf-report-header"><p class="study-pdf-eyebrow">LEARNING JOURNAL</p><h1>'+escape(title)+'</h1><p>'+records.length+'건의 학습기록 · 총 '+records.reduce((sum,r)=>sum+Number(r.minutes||0),0)+'분</p></header>'+body+'<footer class="study-pdf-footer">학습기록</footer></article>';
 }
 window.StudyPdf={build,cleanBody,nodeBody};
})();
