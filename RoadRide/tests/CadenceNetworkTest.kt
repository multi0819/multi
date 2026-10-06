import com.multi0819.roadride.*
import java.net.*
import java.util.concurrent.*
fun main() {
 val server=CadenceServer(); val port=server.start("12345678") { CadenceReading(60.0,.9,"tracking") }
 fun raw(auth:String):String? { Socket("127.0.0.1",port).use { s -> s.soTimeout=2000; s.getOutputStream().write((auth+"\n").toByteArray()); return s.getInputStream().bufferedReader().readLine() } }
 check(raw("RR1\t00000000")==null); check(raw("x".repeat(600))==null)
 val client=CadenceClient(); val got=CountDownLatch(1)
 client.connect("127.0.0.1",port,"12345678",{check(it.rpm==60.0);got.countDown()},{})
 check(got.await(3,TimeUnit.SECONDS)); client.close(); server.stop()
 check(!CadenceClient.validEndpoint("evil.example",80,"12345678")); check(!CadenceClient.validEndpoint("192.168.1.1",70000,"12345678"))
 check(CadenceClient.validEndpoint("192.168.1.4",40000,"12345678"))
 val fake=ServerSocket(0); val packets=java.util.Collections.synchronizedList(mutableListOf<Long>())
 val t=Thread { fake.accept().use { s -> s.getInputStream().bufferedReader().readLine(); s.getOutputStream().write("OK\nRPM\t2\t60\t1\ttracking\nRPM\t2\t60\t1\ttracking\nRPM\t1\t60\t1\ttracking\nRPM\t3\t60\t1\ttracking\n".toByteArray()); Thread.sleep(300) } };t.start()
 val done=CountDownLatch(2);client.connect("127.0.0.1",fake.localPort,"12345678",{packets.add(it.seq);done.countDown()},{})
 check(done.await(2,TimeUnit.SECONDS)); check(packets==listOf(2L,3L));client.close();fake.close();t.join()
 val slow=ServerSocket(0);val fresh=CadenceServer();val freshPort=fresh.start("12345678") {CadenceReading(90.0,1.0,"tracking")}
 val old=Thread { slow.accept().use { s -> try {s.getInputStream().bufferedReader().readLine();Thread.sleep(350);s.getOutputStream().write("OK\nRPM\t1\t30\t1\ttracking\n".toByteArray())}catch(_:Exception){} } };old.start()
 val stale=java.util.concurrent.atomic.AtomicInteger(0);val ready=CountDownLatch(1)
 client.connect("127.0.0.1",slow.localPort,"12345678",{stale.incrementAndGet()},{stale.incrementAndGet()})
 Thread.sleep(80); val before=stale.get()
 client.connect("127.0.0.1",freshPort,"12345678",{check(it.rpm==90.0);ready.countDown()},{})
 check(ready.await(2,TimeUnit.SECONDS)); old.join();check(stale.get()==before);client.close();fresh.stop();slow.close()
 println("Cadence network: auth, bounds, packets, sequence, reconnect generation PASS")
}
