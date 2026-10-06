package com.multi0819.roadride

import kotlin.math.*

data class CadenceReading(val rpm: Double, val confidence: Double, val state: String)

/** Bounded, in-memory autocorrelation estimator. Pocket motion is an estimate, not a sensor calibration. */
class CadenceEstimator {
    private data class Sample(val t: Long, val v: DoubleArray)
    private val samples = java.util.ArrayDeque<Sample>()
    private var count = 0
    private var last = CadenceReading(0.0, 0.0, "ready")
    @Synchronized fun add(timeNs: Long, x: Double, y: Double, z: Double): CadenceReading {
        if (!x.isFinite() || !y.isFinite() || !z.isFinite()) return last
        if (samples.isNotEmpty() && timeNs <= samples.last.t) return last
        if (samples.isNotEmpty() && timeNs-samples.last.t > 250_000_000L) {
            samples.clear();count=0;last=CadenceReading(0.0,0.0,"ready")
        }
        samples.add(Sample(timeNs, doubleArrayOf(x,y,z)))
        while (samples.size > 450 || (samples.isNotEmpty() && timeNs-samples.first.t > 8_000_000_000L)) samples.removeFirst()
        if (++count % 25 != 0) return last
        val s=samples.toList()
        if (s.size < 150 || s.last().t-s.first().t < 3_000_000_000L) return last
        val recent=s.filter { timeNs-it.t <= 1_500_000_000L }
        fun energy(items: List<Sample>): Double {
            val means=DoubleArray(3) { axis -> items.sumOf { it.v[axis] }/items.size }
            return items.sumOf { a -> (0..2).sumOf { (a.v[it]-means[it]).pow(2) } }/items.size
        }
        if (energy(recent) < .025) {
            last=CadenceReading(0.0,1.0,"stopped")
            // Restart needs new periodic evidence; historical pedaling cannot validate a pocket bump.
            val tail=samples.last;samples.clear();samples.add(tail);count=0
            return last
        }
        val means=DoubleArray(3) { axis -> s.sumOf { it.v[axis] }/s.size }
        val v=s.map { a -> DoubleArray(3) { a.v[it]-means[it] } }
        val dt=(s.last().t-s.first().t)/1e9/(s.size-1)
        val lo=max(2,(.4/dt).roundToInt()); val hi=min(s.size/2,(2.05/dt).roundToInt())
        val scores=DoubleArray(hi+2)
        for (lag in lo..hi) {
            var dot=0.0; var aa=0.0; var bb=0.0
            for (i in lag until v.size) for(axis in 0..2) {
                val a=v[i][axis]; val b=v[i-lag][axis]
                dot+=a*b; aa+=a*a; bb+=b*b
            }
            scores[lag]=if(aa*bb>1e-9) dot/sqrt(aa*bb) else 0.0
        }
        val peaks=(lo..hi).filter { scores[it]>.65 && (it==lo || scores[it]>=scores[it-1]) && (it==hi || scores[it]>=scores[it+1]) }
        val peak=peaks.firstOrNull()
        last=if(peak==null) CadenceReading(0.0,0.0,"unstable") else CadenceReading(60/(peak*dt),scores[peak].coerceIn(0.0,1.0),"tracking")
        return last
    }
}
