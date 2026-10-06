(function(root){'use strict';
const core=typeof module!=='undefined'?require('./ride-state.js'):root.RoadCore;
class RideController{
 constructor(id,player,clock=()=>performance.now()){this.state=new core.RideState(id);this.player=player;this.clock=clock;this.status='ready';}
 onState(code){if(this.state.finished)return;this.state.setPlaying(code===1,this.clock());this.status=({1:'playing',2:'paused',3:'buffering',0:'ended',5:'ready'})[code]||'ready';}
 onError(code){this.state.setPlaying(false,this.clock());this.status='error';this.error=code;}
 pause(){this.state.setPlaying(false,this.clock());this.status='paused';this.player.pauseVideo();}
 elapsed(){return this.state.elapsed(this.clock());}
 setRate(wanted){const rates=this.player.getAvailablePlaybackRates()||[];const actual=this.player.getPlaybackRate?.();if(!rates.length)return actual||1;const r=core.chooseRate(rates,wanted);if(r!==actual)this.player.setPlaybackRate(r);return r;}
 finish(){this.player.pauseVideo();return this.state.finish(this.clock());}
}
if(typeof module!=='undefined')module.exports={RideController};else root.RideController=RideController;
})(typeof window!=='undefined'?window:globalThis);
