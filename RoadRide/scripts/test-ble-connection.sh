#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
: "${ROADRIDE_KOTLIN_LIB:?Set compiler library path}"
mkdir -p build/ble-tests
java -cp "$ROADRIDE_KOTLIN_LIB/*" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -no-reflect -classpath "$ROADRIDE_KOTLIN_LIB/kotlin-stdlib-2.0.20.jar" -d build/ble-tests app/src/main/java/com/multi0819/roadride/BleConnectionGate.kt app/src/main/java/com/multi0819/roadride/BlePermissions.kt app/src/main/java/com/multi0819/roadride/CadenceEstimator.kt app/src/main/java/com/multi0819/roadride/CscCadence.kt tests/BleConnectionTest.kt
java -cp "build/ble-tests:$ROADRIDE_KOTLIN_LIB/kotlin-stdlib-2.0.20.jar" BleConnectionTestKt
