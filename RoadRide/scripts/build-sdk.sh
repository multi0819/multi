#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
: "${ROADRIDE_SDK:?Set ROADRIDE_SDK to Android SDK root}"
: "${ROADRIDE_KOTLIN_LIB:?Set ROADRIDE_KOTLIN_LIB to Gradle lib folder containing kotlin compiler}"
bt="$ROADRIDE_SDK/build-tools/35.0.0"
stage=build/sdk
mkdir -p "$stage/classes" "$stage/dex" .signing
java -cp "$ROADRIDE_KOTLIN_LIB/*" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -no-reflect -jvm-target 17 -classpath "$ROADRIDE_SDK/platforms/android-35/android.jar:$ROADRIDE_KOTLIN_LIB/kotlin-stdlib-2.0.20.jar" -d "$stage/classes" app/src/main/java/com/multi0819/roadride/MainActivity.kt
python3 - <<'PY'
from pathlib import Path
import zipfile
base=Path('build/sdk')
manifest=Path('app/src/main/AndroidManifest.xml').read_text().replace('<manifest xmlns:', '<manifest package="com.multi0819.roadride" xmlns:')
(base/'AndroidManifest.xml').write_text(manifest)
with zipfile.ZipFile(base/'classes.jar','w',zipfile.ZIP_DEFLATED) as z:
 for p in (base/'classes').rglob('*.class'): z.write(p,p.relative_to(base/'classes'))
PY
"$bt/aapt2" compile --dir app/src/main/res -o "$stage/res.zip"
"$bt/aapt2" link -o "$stage/base.apk" --manifest "$stage/AndroidManifest.xml" -I "$ROADRIDE_SDK/platforms/android-35/android.jar" --min-sdk-version 26 --target-sdk-version 35 --version-code 1 --version-name 1.0.0 -A app/src/main/assets "$stage/res.zip"
"$bt/d8" --min-api 26 --lib "$ROADRIDE_SDK/platforms/android-35/android.jar" --output "$stage/dex" "$stage/classes.jar" "$ROADRIDE_KOTLIN_LIB/kotlin-stdlib-2.0.20.jar"
python3 - <<'PY'
import zipfile
from pathlib import Path
with zipfile.ZipFile('build/sdk/base.apk','a',zipfile.ZIP_DEFLATED) as z:
 for p in Path('build/sdk/dex').glob('*.dex'):z.write(p,p.name)
PY
if [ ! -f .signing/roadride-debug.jks ]; then
 keytool -genkeypair -keystore .signing/roadride-debug.jks -alias androiddebugkey -storepass android -keypass android -dname 'CN=RoadRide Debug' -keyalg RSA -keysize 2048 -validity 10000
fi
"$bt/zipalign" -f 4 "$stage/base.apk" "$stage/aligned.apk"
"$bt/apksigner" sign --ks .signing/roadride-debug.jks --ks-key-alias androiddebugkey --ks-pass pass:android --key-pass pass:android --out build/RoadRide-v1.0.0.apk "$stage/aligned.apk"
"$bt/apksigner" verify --verbose build/RoadRide-v1.0.0.apk
"$bt/zipalign" -c 4 build/RoadRide-v1.0.0.apk
