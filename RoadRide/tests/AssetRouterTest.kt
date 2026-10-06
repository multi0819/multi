import com.multi0819.roadride.AssetRouter
fun main() {
 check(AssetRouter.assetPath(AssetRouter.startUrl) == "index.html") { "Startup page is blocked by local asset routing" }
 check(AssetRouter.assetPath("https://com.multi0819.roadride/style.css") == "style.css")
 check(AssetRouter.assetPath("https://evil.example/index.html") == null)
 check(AssetRouter.assetPath("https://com.multi0819.roadride/../private") == null)
 check(AssetRouter.assetPath("data:text/html,untrusted") == null)
 println("Asset routing: 5 checks PASS")
}
