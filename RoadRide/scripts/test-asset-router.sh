#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
: "${ROADRIDE_KOTLIN_LIB:?Set compiler library path}"
mkdir -p build/router-tests
java -cp "$ROADRIDE_KOTLIN_LIB/*" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -no-reflect -classpath "$ROADRIDE_KOTLIN_LIB/kotlin-stdlib-2.0.20.jar" -d build/router-tests app/src/main/java/com/multi0819/roadride/AssetRouter.kt tests/AssetRouterTest.kt
java -cp "build/router-tests:$ROADRIDE_KOTLIN_LIB/kotlin-stdlib-2.0.20.jar" AssetRouterTestKt
