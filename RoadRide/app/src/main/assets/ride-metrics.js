(function(root){'use strict';
class RideMetrics {
 constructor(settings={}){this.weight=70;this.met=6;this.referenceSpeed=20;this.configure(settings);this.distance=0;this.calories=0;this.speed=0;this.last=null;this.wasActive=false}
 configure(s){for(const [key,lo,hi] of [['weight',30,200],['met',2,12],['referenceSpeed',5,50]])if(Number.isFinite(s[key])&&s[key]>=lo&&s[key]<=hi)this[key]=s[key]}
 update(now,playing,packet,received){const active=Boolean(playing&&packet&&packet.state==='tracking'&&packet.confidence>=.65&&packet.rpm>0&&now-received<=5000);const speed=active?packet.rpm/60*this.referenceSpeed:0;const dt=this.last===null?0:now-this.last;if(active&&this.wasActive&&dt>0&&dt<=2500){this.distance+=(this.speed+speed)/2*dt/3600000;this.calories+=this.met*this.weight*dt/3600000}this.speed=speed;this.last=now;this.wasActive=active;return this}
}
if(typeof module==='object')module.exports=RideMetrics;else root.RideMetrics=RideMetrics;
})(typeof window==='object'?window:globalThis);
