#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
: "${ROADRIDE_KOTLIN_LIB:?Set compiler library path}"
rm -rf build/cadence-tests
mkdir -p build/cadence-tests
java -cp "$ROADRIDE_KOTLIN_LIB/*" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -no-reflect -classpath "$ROADRIDE_KOTLIN_LIB/kotlin-stdlib-2.0.20.jar" -d build/cadence-tests app/src/main/java/com/multi0819/roadride/CadenceEstimator.kt app/src/main/java/com/multi0819/roadride/CadenceProtocol.kt tests/CadenceCoreTest.kt
java -cp "build/cadence-tests:$ROADRIDE_KOTLIN_LIB/kotlin-stdlib-2.0.20.jar" CadenceCoreTestKt
