const {test}=require('node:test');const assert=require('node:assert/strict');
const {RideController}=require('../app/src/main/assets/player.js');
function fixture(){let time=0;const commands=[];const p={pauseVideo(){commands.push('pause')},setPlaybackRate(x){commands.push(x)},getAvailablePlaybackRates(){return [0.5,1,1.5]},getCurrentTime(){return 12}};const c=new RideController('alps',p,()=>time);return {c,commands,setTime(x){time=x}};}
test('buffering and errors stop the active workout clock',()=>{const f=fixture();f.c.onState(1);f.setTime(1000);f.c.onState(3);f.setTime(4000);assert.equal(f.c.elapsed(),1000);f.c.onState(1);f.setTime(6000);f.c.onError(101);f.setTime(9000);assert.equal(f.c.elapsed(),3000);assert.equal(f.c.status,'error');});
test('background pause stops timer before asynchronous player callback',()=>{const f=fixture();f.c.onState(1);f.setTime(2000);f.c.pause();f.setTime(8000);assert.equal(f.c.elapsed(),2000);assert.deepEqual(f.commands,['pause']);});
test('unsupported speed never reaches playback rate command',()=>{const f=fixture();assert.equal(f.c.setRate(2),1);assert.deepEqual(f.commands,[1]);});
test('finished session cannot restart on late state events',()=>{const f=fixture();f.c.onState(1);f.setTime(3000);assert.equal(f.c.finish().elapsedMs,3000);f.c.onState(1);f.setTime(6000);assert.equal(f.c.elapsed(),3000);assert.equal(f.c.finish(),null);});
