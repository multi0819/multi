#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
: "${ROADRIDE_KOTLIN_LIB:?Set compiler library path}"
mkdir -p build/network-tests
java -cp "$ROADRIDE_KOTLIN_LIB/*" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -no-reflect -classpath "$ROADRIDE_KOTLIN_LIB/kotlin-stdlib-2.0.20.jar" -d build/network-tests app/src/main/java/com/multi0819/roadride/CadenceEstimator.kt app/src/main/java/com/multi0819/roadride/CadenceProtocol.kt app/src/main/java/com/multi0819/roadride/CadenceServer.kt app/src/main/java/com/multi0819/roadride/CadenceClient.kt tests/CadenceNetworkTest.kt
java -cp "build/network-tests:$ROADRIDE_KOTLIN_LIB/kotlin-stdlib-2.0.20.jar" CadenceNetworkTestKt
