# SDD ledger — plan: docs/superpowers/plans/2026-10-13-ble-cadence.md
Pre-flight: Task1 CadenceReading matches Task2 onReading; Task2 callbacks match Task3 packet adapter. Task3 source defaults phone for old callers. Task4 reuses build/CI with new test scripts. No interface conflicts.
Task 1: complete (commits a581cd2..d26db99, tests: scripts/test-csc-cadence.sh → CSC: rates, wheel fields, bounds, wrap, duplicate/stop, gap, reset PASS)
Task 2: complete (commits d26db99..0ed7d7f, tests: scripts/test-ble-connection.sh → BLE: old callback invalidation and API-specific permissions PASS)
Task 3: complete (commits 0ed7d7f..b23fa4d, tests: npm test → ℹ duration_ms 2782.294976)
Final: fixed wrong-mode connection retention — wheel-only release/epoch regression RED→GREEN; native binding closes GATT and provides mode-specific recovery.
Final: fixed stale home reception confirmation — re-graded Important because pre-ride setup confirmation misleads; home settings/freshness DOM regression RED→GREEN, Node29/29.
Final: minor (deferred): full executable Android BLE lifecycle harness absent; tested primitives/mode-release and DOM do not establish radio/Activity behavior.
Final: Ruling: S314 discovery/notifications/firmware mode switching/physical accuracy cannot be verified without attached hardware — deliver test APK with explicit device-validation limits — cost: device-specific fixes may be needed.
Final: Ruling: GATT setup started in foreground may complete while app is backgrounded — retain that connection and pause video; new scans/connect requests require foreground — cost: OEM lifecycle behavior may differ.
Final: Ruling: Signing/download/CI are outside source review — perform those delivery checks separately rather than infer approval from review — cost if wrong: unusable delivery; checks must pass before final.
CI: First source-only run failed lint MissingPermission despite broad exception handlers; explicit SecurityException revocation handling added, full lint kept enabled.
Task 4: complete (commits b23fa4d..5e3b93c, tests: bash -c 'scripts/test-csc-cadence.sh && scripts/test-ble-connection.sh && scripts/test-cadence-core.sh && scripts/test-cadence-network.sh && scripts/test-asset-router.sh && npm test' → ℹ duration_ms 2037.85115)

Delivery: GitHub run38387030774 on247bb483d46863a464e36e738ce08549ee336e21 SUCCESS (Gradle assembleDebug/lintDebug, Node29, CSC/BLE/core/network/router); signed certificate equals1.2.0; published APK and ZIP bytes MATCH.
Integration: authorized roadride-app delivery completed; no main merge.
