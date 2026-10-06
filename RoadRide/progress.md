# SDD ledger — plan: docs/plan.md
Pre-flight: Task 1 state interfaces match Task 2 consumers; Task 2 pauseRide interface matches Task 3 lifecycle hook.
Ruling: Fresh dedicated project on feat/roadride is already isolated from existing apps; no extra worktree needed.
Task 1: state tests RED missing module → GREEN 4/4.
Ruling: Installed toolchain has Kotlin compiler but no javac or cached AGP. Use Kotlin for Activity and direct SDK build locally; keep Gradle project for GitHub builds. Cost: lint requires CI environment.
Ruling: Official YouTube documentation requires app ID HTTPS Referer. Serve local assets under https://com.multi0819.roadride and loadDataWithBaseURL; avoid AndroidX dependency. Cost: custom small asset loader needs security review.
Task 2: player tests RED missing module → GREEN 4/4; all model tests 8/8. UI code and syntax checks complete.
Task 3: direct SDK build, APK v2/v3 signature and alignment PASS. Gradle failed before configuration due unavailable distribution download. No Android target attached.

Final review: independent reviewer found one Important readiness-timeout issue and one Minor empty supported-rate edge.
Final: fixed readiness infinite wait — DOM no-ready watchdog RED→GREEN, suite 12/12.
Final: minor (deferred): disable rate selection/no-op commands when advertised rate list is empty.
Final: Ruling: Actual YouTube identity acceptance, full domain allowlist, Android background sequencing, native links/fullscreen lack device evidence — ship as test APK with these explicitly unverified rather than assert production readiness — cost: device-specific playback may require fixes.
Ruling: Browser Chromium executable crashes with SIGSEGV — validate UI logic using Happy DOM; do not claim layout/stream verification — cost: visual or platform defects may remain.
Ruling: User requested GitHub delivery without specifying new repository. Add RoadRide folder on a new roadride-app branch of owned multi repository, retaining base tree and leaving main untouched — cost: user may prefer moving app to a standalone repository later.

CI: First GitHub run failed in setup-android before tests/build: removed SDK package tools. Explicit platforms;android-35/build-tools;35.0.0 packages added. Gradle manifest source now omits package attribute; direct build stages its own package-qualified manifest.

CI: Second GitHub run 37419808471 SUCCESS including SDK setup, npm ci, 12 tests, Gradle assembleDebug/lintDebug and APK artifact upload. GitHub APK/ZIP bytes independently matched local SHA-256.

1.0.1: Startup data: URI was blocked by own request filter. Switched startup to HTTPS asset URL. AssetRouter regression RED blocked startup → GREEN 5 checks. JavaScript suite 12/12; signed APK rebuilt with existing key.
