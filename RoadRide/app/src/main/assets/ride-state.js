(function(root){
'use strict';
class RideState{
 constructor(id){this.id=id;this.total=0;this.since=null;this.finished=false;}
 setPlaying(playing,now){if(this.finished)return;if(playing){if(this.since===null)this.since=now;}else if(this.since!==null){this.total+=Math.max(0,now-this.since);this.since=null;}}
 elapsed(now){return this.total+(this.since===null?0:Math.max(0,now-this.since));}
 finish(now){if(this.finished)return null;this.setPlaying(false,now);this.finished=true;return {id:this.id,elapsedMs:this.total,date:new Date().toISOString()};}
}
function restoreData(raw){let d;try{d=JSON.parse(raw);}catch(e){}d=d&&typeof d==='object'?d:{};return {
 history:Array.isArray(d.history)?d.history.filter(x=>x&&typeof x.id==='string'&&Number.isFinite(x.elapsedMs)&&x.elapsedMs>0&&typeof x.date==='string'&&Number.isFinite(Date.parse(x.date))):[],
 favorites:Array.isArray(d.favorites)?[...new Set(d.favorites.filter(x=>typeof x==='string'))]:[],
 resume:d.resume&&typeof d.resume.id==='string'&&Number.isFinite(d.resume.position)&&d.resume.position>=0?{id:d.resume.id,position:d.resume.position}:null};}
function chooseRate(rates,wanted){const valid=Array.isArray(rates)?rates.filter(x=>Number.isFinite(x)&&x>0):[];return valid.includes(wanted)?wanted:(valid.includes(1)?1:(valid[0]||1));}
function localDateKey(date){return `${date.getFullYear()}-${String(date.getMonth()+1).padStart(2,'0')}-${String(date.getDate()).padStart(2,'0')}`;}
function historyCalendar(records,selected){
 const date=new Date(selected+'T12:00:00');const year=date.getFullYear(),month=date.getMonth();
 const start=new Date(year,month,date.getDate()-((date.getDay()+6)%7));const end=new Date(start);end.setDate(end.getDate()+6);
 const weekStart=localDateKey(start),weekEnd=localDateKey(end),monthKey=selected.slice(0,7),byDay={};
 const blank=()=>({elapsedMs:0,count:0,days:0,distanceKm:0,calories:0,metricCount:0});
 const day=blank(),week=blank(),monthly=blank();const weekDays=new Set(),monthDays=new Set();
 function add(total,r){total.elapsedMs+=r.elapsedMs;total.count++;if(Number.isFinite(r.distanceKm)&&r.distanceKm>=0){total.distanceKm+=r.distanceKm;total.metricCount++;}if(Number.isFinite(r.calories)&&r.calories>=0)total.calories+=r.calories;}
 for(const r of records){const d=new Date(r.date);if(!Number.isFinite(d.getTime())||!Number.isFinite(r.elapsedMs)||r.elapsedMs<=0)continue;const key=localDateKey(d);if(!byDay[key])byDay[key]=blank();add(byDay[key],r);if(key===selected)add(day,r);if(key>=weekStart&&key<=weekEnd){add(week,r);weekDays.add(key);}if(key.slice(0,7)===monthKey){add(monthly,r);monthDays.add(key);}}
 week.days=weekDays.size;monthly.days=monthDays.size;day.days=day.count?1:0;
 const cells=Array(new Date(year,month,1).getDay()).fill(null);for(let n=1;n<=new Date(year,month+1,0).getDate();n++){const key=localDateKey(new Date(year,month,n));cells.push({key,date:n,...(byDay[key]||blank())});}
 return {day,week,month:monthly,weekStart,weekEnd,cells};
}
const api={RideState,restoreData,chooseRate,localDateKey,historyCalendar};if(typeof module!=='undefined')module.exports=api;else root.RoadCore=api;
})(typeof window!=='undefined'?window:globalThis);
