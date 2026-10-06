(function(root){
'use strict';
class CadenceSync {
 constructor(actions){this.actions=actions;this.enabled=false;this.baseline=60;this.manual=false;this.autoPaused=false;this.resetConnection()}
 resetConnection(){this.packet=null;this.received=-Infinity;this.seq=-1;this.smooth=null;this.lastRate=null;this.changed=-Infinity;this.candidate=null;this.candidateAt=-Infinity;this.playingSince=null;this.pendingRate=null}
 setEnabled(value){this.enabled=Boolean(value);if(!this.enabled){this.autoPaused=false;this.lastRate=null}}
 manualPause(){this.manual=true;this.autoPaused=false}
 manualPlay(){this.manual=false;this.autoPaused=false}
 update(p,now){if(!p||!Number.isSafeInteger(p.seq)||p.seq<=this.seq||!Number.isFinite(p.rpm)||p.rpm<0||p.rpm>300||!Number.isFinite(p.confidence)||p.confidence<0||p.confidence>1||!['ready','tracking','stopped','unstable'].includes(p.state))return false;this.seq=p.seq;this.packet=p;this.received=now;if(p.state==='tracking'&&p.confidence>=.65&&p.rpm>0)this.smooth=this.smooth===null?p.rpm:this.smooth*.65+p.rpm*.35;return true}
 tick(now){
  if(!this.enabled)return;
  const p=this.packet;const valid=p&&now-this.received<=5000&&p.state==='tracking'&&p.confidence>=.65&&p.rpm>0;
  if(!valid){if(!this.manual&&!this.autoPaused){this.autoPaused=true;this.actions.pause()}return}
  if(this.manual)return;
  const rates=(this.actions.rates()||[]).filter(n=>Number.isFinite(n)&&n>0).sort((a,b)=>a-b);
  const canChange=this.actions.canChangeRate?.()!==false;
  if(!canChange){this.playingSince=null;this.candidate=null}
  else if(this.playingSince===null)this.playingSince=now;
  if(rates.length&&canChange){
   const goal=this.smooth/this.baseline;const next=rates.reduce((a,b)=>Math.abs(b-goal)<Math.abs(a-goal)?b:a);
   const actual=this.actions.currentRate?.();
   if(Number.isFinite(actual))this.lastRate=actual;
   if(this.pendingRate!==null&&(actual===this.pendingRate||now-this.changed>=15000))this.pendingRate=null;
   const margin=this.lastRate===null?Infinity:Math.abs(goal-this.lastRate)-Math.abs(goal-next);
   if(next!==this.candidate){this.candidate=next;this.candidateAt=now}
   const usesSettling=Boolean(this.actions.canChangeRate);
   const settled=!usesSettling||(now-this.playingSince>=2000&&now-this.candidateAt>=2000);
   if(next!==this.lastRate&&now-this.changed>=5000&&margin>.12&&settled&&this.pendingRate===null){this.pendingRate=Number.isFinite(actual)?next:null;this.actions.rate(next);this.lastRate=next;this.changed=now}
  }
  if(this.autoPaused){this.autoPaused=false;this.actions.play()}
 }
}
if(typeof module==='object')module.exports=CadenceSync;else root.CadenceSync=CadenceSync;
})(typeof window==='object'?window:globalThis);
