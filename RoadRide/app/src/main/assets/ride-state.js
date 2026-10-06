(function(root){
'use strict';
class RideState{
 constructor(id){this.id=id;this.total=0;this.since=null;this.finished=false;}
 setPlaying(playing,now){if(this.finished)return;if(playing){if(this.since===null)this.since=now;}else if(this.since!==null){this.total+=Math.max(0,now-this.since);this.since=null;}}
 elapsed(now){return this.total+(this.since===null?0:Math.max(0,now-this.since));}
 finish(now){if(this.finished)return null;this.setPlaying(false,now);this.finished=true;return {id:this.id,elapsedMs:this.total,date:new Date().toISOString()};}
}
function restoreData(raw){let d;try{d=JSON.parse(raw);}catch(e){}d=d&&typeof d==='object'?d:{};return {
 history:Array.isArray(d.history)?d.history.filter(x=>x&&typeof x.id==='string'&&Number.isFinite(x.elapsedMs)&&x.elapsedMs>0&&typeof x.date==='string'&&Number.isFinite(Date.parse(x.date))).slice(0,100):[],
 favorites:Array.isArray(d.favorites)?[...new Set(d.favorites.filter(x=>typeof x==='string'))]:[],
 resume:d.resume&&typeof d.resume.id==='string'&&Number.isFinite(d.resume.position)&&d.resume.position>=0?{id:d.resume.id,position:d.resume.position}:null};}
function chooseRate(rates,wanted){const valid=Array.isArray(rates)?rates.filter(x=>Number.isFinite(x)&&x>0):[];return valid.includes(wanted)?wanted:(valid.includes(1)?1:(valid[0]||1));}
const api={RideState,restoreData,chooseRate};if(typeof module!=='undefined')module.exports=api;else root.RoadCore=api;
})(typeof window!=='undefined'?window:globalThis);
