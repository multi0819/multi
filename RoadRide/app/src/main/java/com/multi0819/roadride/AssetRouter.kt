package com.multi0819.roadride
object AssetRouter {
 const val HOST = "com.multi0819.roadride"
 const val startUrl = "https://com.multi0819.roadride/index.html"
 private val allowed = setOf("index.html", "style.css", "app.js", "player.js", "cadence-sync.js", "ride-metrics.js", "ride-state.js", "routes.json")
 fun assetPath(url: String): String? = try {
  val uri = java.net.URI(url)
  if (uri.scheme == "https" && uri.host == HOST) uri.path.removePrefix("/").takeIf { it in allowed } else null
 } catch (_: Exception) { null }
}
