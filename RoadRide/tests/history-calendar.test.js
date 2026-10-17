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
