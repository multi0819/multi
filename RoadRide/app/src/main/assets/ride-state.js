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
 weeklyGoalMinutes:Number.isInteger(d.weeklyGoalMinutes)&&d.weeklyGoalMinutes>=15&&d.weeklyGoalMinutes<=3000?d.weeklyGoalMinutes:150,
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
function historyInsights(records,selected,goalMinutes=150){
 const view=historyCalendar(records,selected),d=new Date(selected+'T12:00:00');const prev=new Date(view.weekStart+'T12:00:00');prev.setDate(prev.getDate()-7);
 const previousWeek=historyCalendar(records,localDateKey(prev)).week;const previousMonth=historyCalendar(records,localDateKey(new Date(d.getFullYear(),d.getMonth()-1,1))).month;
 const keys=[...new Set(records.filter(r=>r.elapsedMs>0).map(r=>localDateKey(new Date(r.date))).filter(k=>k<=selected))].sort();const used=new Set(keys);
 const cursor=new Date(selected+'T12:00:00');if(!used.has(localDateKey(cursor)))cursor.setDate(cursor.getDate()-1);let currentStreak=0;
 while(used.has(localDateKey(cursor))){currentStreak++;cursor.setDate(cursor.getDate()-1);}
 let bestStreak=0,run=0,last=null;for(const key of keys){const previous=new Date(key+'T12:00:00');previous.setDate(previous.getDate()-1);run=last===localDateKey(previous)?run+1:1;bestStreak=Math.max(bestStreak,run);last=key;}
 return {...view,previousWeek,previousMonth,goalMinutes,goalPercent:Math.min(100,Math.floor(view.week.elapsedMs/(goalMinutes*60000)*100)),currentStreak,bestStreak,weekChangeMs:view.week.elapsedMs-previousWeek.elapsedMs,monthChangeMs:view.month.elapsedMs-previousMonth.elapsedMs};
}
function createBackup(data,metricPreferences={}){return JSON.stringify({format:'RoadRideBackup',version:1,createdAt:new Date().toISOString(),data:restoreData(JSON.stringify(data)),metricPreferences});}
function mergeBackup(current,raw){
 if(typeof raw!=='string'||raw.length>5000000)throw new Error('백업 파일 크기를 확인해 주세요.');
 const parsed=JSON.parse(raw);if(!parsed||parsed.format!=='RoadRideBackup'||parsed.version!==1||!parsed.data||!Array.isArray(parsed.data.history)||!Array.isArray(parsed.data.favorites))throw new Error('지원하는 로드라이드 백업 파일이 아닙니다.');
 const incoming=restoreData(JSON.stringify(parsed.data));if(incoming.history.length!==parsed.data.history.length)throw new Error('백업 기록이 손상되어 복원하지 않았습니다.');
 const fingerprint=r=>JSON.stringify([r.id,r.date,r.elapsedMs]);const seen=new Set(current.history.map(fingerprint));const history=[...current.history];let added=0;
 for(const r of incoming.history)if(!seen.has(fingerprint(r))){seen.add(fingerprint(r));history.push(r);added++;}
 history.sort((a,b)=>Date.parse(b.date)-Date.parse(a.date));
 const metricPreferences={};const m=parsed.metricPreferences||{};for(const [key,min,max] of [['weight',30,200],['referenceSpeed',5,50],['met',2,12]])if(Number.isFinite(m[key])&&m[key]>=min&&m[key]<=max)metricPreferences[key]=m[key];
 return {data:{...current,history,favorites:[...new Set([...current.favorites,...incoming.favorites])],weeklyGoalMinutes:incoming.weeklyGoalMinutes},metricPreferences,added};
}
const api={RideState,restoreData,chooseRate,localDateKey,historyCalendar,historyInsights,createBackup,mergeBackup};if(typeof module!=='undefined')module.exports=api;else root.RoadCore=api;
})(typeof window!=='undefined'?window:globalThis);
