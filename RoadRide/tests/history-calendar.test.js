process.env.TZ='Asia/Seoul';
const {test}=require('node:test');const assert=require('node:assert/strict');
const core=require('../app/src/main/assets/ride-state.js');
const ride=(date,mins,extra={})=>({id:'route',date,elapsedMs:mins*60000,...extra});
test('local dates, Monday week and month totals include repeated rides and exclude adjacent dates',()=>{
 const records=[ride('2026-09-30T23:30:00+09:00',5),ride('2026-10-01T00:30:00+09:00',10),ride('2026-10-01T12:00:00+09:00',20),ride('2026-10-04T23:59:00+09:00',15),ride('2026-10-05T00:00:00+09:00',50)];
 const view=core.historyCalendar(records,'2026-10-01');
 assert.equal(view.day.elapsedMs,30*60000);assert.equal(view.day.count,2);assert.equal(view.week.elapsedMs,50*60000);assert.equal(view.month.elapsedMs,95*60000);assert.equal(view.month.days,3);assert.equal(view.weekStart,'2026-09-28');assert.equal(view.weekEnd,'2026-10-04');assert.equal(view.cells.filter(c=>c&&c.key==='2026-10-01')[0].count,2);
});
test('leap February and year boundary are correct, empty summaries stay zero',()=>{
 const view=core.historyCalendar([],'2024-02-29');assert.equal(view.cells.filter(Boolean).length,29);assert.equal(view.month.elapsedMs,0);
 const y=core.historyCalendar([ride('2025-12-31T10:00:00+09:00',4)],'2026-01-01');assert.equal(y.week.elapsedMs,240000);assert.equal(y.month.elapsedMs,0);
});
test('upgrade retains more than 100 historical rides and optional estimated metrics',()=>{
 const records=Array.from({length:150},()=>ride('2026-10-01T12:00:00+09:00',1,{distanceKm:1.2,calories:20}));const restored=core.restoreData(JSON.stringify({history:records}));assert.equal(restored.history.length,150);const v=core.historyCalendar(restored.history,'2026-10-01');assert.equal(Math.round(v.day.distanceKm),180);assert.equal(v.day.calories,3000);
});

test('insights calculate weekly goal, prior periods and consecutive unique local days',()=>{
 const records=[ride('2026-10-15T12:00:00+09:00',30),ride('2026-10-16T12:00:00+09:00',40),ride('2026-10-16T18:00:00+09:00',20),ride('2026-10-07T12:00:00+09:00',10),ride('2026-09-15T12:00:00+09:00',50)];
 const v=core.historyInsights(records,'2026-10-17',60);assert.equal(v.goalPercent,100);assert.equal(v.goalMinutes,60);assert.equal(v.currentStreak,2);assert.equal(v.bestStreak,2);assert.equal(v.previousWeek.elapsedMs,600000);assert.equal(v.previousMonth.elapsedMs,3000000);assert.equal(v.weekChangeMs,80*60000);assert.equal(v.monthChangeMs,50*60000);
 assert.equal(core.historyInsights(records,'2026-10-19',150).currentStreak,0);
});
test('backup roundtrip merges without duplicates and preserves existing history and goals',()=>{
 const local=core.restoreData(JSON.stringify({history:[ride('2026-10-01T12:00:00+09:00',10)],weeklyGoalMinutes:180,favorites:['a']}));
 const imported=core.restoreData(JSON.stringify({history:[...local.history,ride('2026-10-02T12:00:00+09:00',20)],weeklyGoalMinutes:120,favorites:['b']}));
 const backup=core.createBackup(imported,{weight:80,referenceSpeed:25,met:6});const merged=core.mergeBackup(local,backup);assert.equal(merged.data.history.length,2);assert.deepEqual(merged.data.favorites,['a','b']);assert.equal(merged.data.weeklyGoalMinutes,120);assert.equal(merged.metricPreferences.weight,80);assert.equal(core.mergeBackup(merged.data,backup).added,0);assert.equal(local.history.length,1);
});
test('invalid backups are rejected without clearing data; settings are bounded',()=>{
 const data=core.restoreData(null);for(const raw of ['bad','{}',JSON.stringify({format:'RoadRideBackup',version:99,data:{history:[]}}),JSON.stringify({format:'RoadRideBackup',version:1,data:{history:[{id:'broken'}]}})])assert.throws(()=>core.mergeBackup(data,raw));assert.equal(data.history.length,0);assert.equal(core.restoreData(JSON.stringify({weeklyGoalMinutes:-1})).weeklyGoalMinutes,150);
});
test('every backup under the advertised size can roundtrip even after 20000 rides',()=>{const history=Array.from({length:20001},(_,i)=>ride(new Date(Date.UTC(2025,0,1,0,i)).toISOString(),1));const data=core.restoreData(JSON.stringify({history}));const raw=core.createBackup(data);assert.ok(Buffer.byteLength(raw)<5000000);assert.equal(core.mergeBackup(core.restoreData(null),raw).added,20001);});
