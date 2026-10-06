const {test}=require('node:test');
const assert=require('node:assert/strict');
const {RideState,restoreData,chooseRate}=require('../app/src/main/assets/ride-state.js');
test('counts only playback and finishes exactly once',()=>{const s=new RideState('alps');s.setPlaying(true,1000);s.setPlaying(false,5000);assert.equal(s.elapsed(10000),4000);s.setPlaying(true,10000);assert.equal(s.elapsed(12000),6000);assert.equal(s.finish(13000).elapsedMs,7000);assert.equal(s.finish(15000),null);s.setPlaying(true,16000);assert.equal(s.elapsed(18000),7000);});
test('duplicate PLAYING events do not lose elapsed time',()=>{const s=new RideState('alps');s.setPlaying(true,100);s.setPlaying(true,500);assert.equal(s.elapsed(1100),1000);});
test('invalid saved data recovers without corrupting history',()=>{assert.deepEqual(restoreData('{bad'),{history:[],favorites:[],resume:null});assert.deepEqual(restoreData('{"history":[null],"favorites":[4],"resume":{"id":"a","position":-2}}'),{history:[],favorites:[],resume:null});});
test('only supported rates are chosen',()=>{assert.equal(chooseRate([0.5,1,1.5],1.25),1);assert.equal(chooseRate([],2),1);assert.equal(chooseRate([1,2],2),2);});
