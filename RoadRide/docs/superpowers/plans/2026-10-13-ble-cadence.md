# S314 BLE Cadence Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 갤럭시탭에서 S314 케이던스 센서를 직접 연결해 영상 배속과 기존 주행 정보를 연동하는 업데이트 APK를 제공한다.

**Architecture:** Android BLE GATT 연결부가 표준 CSC 알림을 받아 순수 Kotlin 파서/차분 계산기로 RPM을 만든다. 기존 CadencePacket 및 WebView 연동을 재사용하고 휴대폰/센서 중 한 입력원만 활성화한다. 사용자 화면과 APK 패키지·서명은 기존 프로젝트를 유지한다.

**Tech Stack:** 기존 Kotlin/Android SDK 35, BluetoothLeScanner/BluetoothGatt, 순수 JVM 검사, Node/Happy DOM, 기존 직접 SDK 빌드와 GitHub Gradle/lint.

**Spec:** `docs/ble-cadence-design.md`

## Global Constraints
- Magene S314 표준 CSC 케이던스를 대상으로 하며 휴대폰/Wi-Fi 중계는 필요하지 않다. 영상 재생용 인터넷은 계속 필요하다.
- CSC 서비스 0x1816 / Measurement 0x2A5B 알림을 사용하며 일반 Android Bluetooth 페어링을 선행 조건으로 요구하지 않는다.
- 검색은 사용자가 시작할 때만 최대 15초 실행하고 종료/취소/앱 배경에서 중단한다.
- 기존 휴대폰 측정·영상·기록·몰입 화면·운동정보를 유지한다. 시속·거리·칼로리는 계속 추정값이다.
- 연결이 끊겨도 다른 입력원으로 자동 전환하지 않는다. 사용자가 멈춘 영상을 임의로 재개하지 않는다.
- Android 12 이상은 SCAN(neverForLocation)/CONNECT 권한, Android 8~11은 legacy Bluetooth와 검색용 위치 권한을 API 30까지로 제한한다. 실제 위치를 읽거나 저장하지 않는다.
- 센서 식별자는 네이티브 앱 내부에만 저장하며 센서 데이터를 외부 서버에 업로드하지 않는다.
- 기존 패키지/서명과 GitHub roadride-app 브랜치로 전달한다. 실제 센서/Android 기기 검증이 없으면 이를 명시한다.

## Review Focus
- Android 권한 요청 중 입력원 전환/앱 배경: 늦은 승인으로 원치 않는 검색이나 연결이 시작되지 않아야 한다.
- 오래된 GATT 콜백/두 입력원 경쟁: 이전 연결의 RPM이나 종료 이벤트가 새 입력원을 덮어쓰지 않아야 한다.
- 동일 이벤트와 알림 침묵: 페달 정지와 데이터 미수신을 구분하고 오래된 RPM을 새 수신으로 포장하지 않아야 한다.
- GATT 연결만 성공하고 서비스/알림 구독이 실패: RPM 연결 성공으로 표시하지 말고 재시도 경로를 제공해야 한다.
- 센서 주소 변화/다른 앱 연결/잘못된 모드: 기억한 센서가 실패할 때 검색·선택과 모드 안내로 복구할 수 있어야 한다.

---

### Task 1: CSC 바이너리와 RPM 계산
**Files:** 새 `app/src/main/java/com/multi0819/roadride/CscCadence.kt`, `tests/CscCadenceTest.kt`, `scripts/test-csc-cadence.sh`.
**Interfaces:** `CscSample(crankRevolutions: Int?, crankEventTicks: Int?)`; `CscDecoder.decode(bytes: ByteArray): CscSample?`; `CscCadence.add(sample: CscSample, receivedAtMs: Long): CadenceReading`; `reset()`.
- [ ] 실패 검사 작성: flags=2, rev 10→11, ticks 1000→2024이면 60RPM; ticks 변화 683이면 약90RPM; 변화512이면120RPM. flags=3에서 6바이트 wheel 필드를 건너뛰어 같은 RPM이 나와야 한다. flags=1은 crank=null, 짧은 필드/미지원 flags는 decode=null.
- [ ] 실패 검사 작성: rev65535→0와 ticks65000→488은60RPM; 첫 샘플 ready; 같은 이벤트가3초 이어지면 stopped; gap>5000ms 후 첫 샘플 ready; dt=0/300RPM초과/센서 초기화 차분은 tracking이 아니며 이후 정상 차분으로 복구한다. 중복은3초 전까지만 이전 유효값을 유지한다.
- [ ] `ROADRIDE_KOTLIN_LIB=<Gradle lib> scripts/test-csc-cadence.sh` 실행. Expected: 기능 부재로 FAIL.
- [ ] 순수 Kotlin 파서와 16비트 모듈러 차분을 구현한다. 이벤트 시각은 계산에만 쓰고 최신 여부는 수신 기기의 단조 시계로 판단한다. 잘못된 샘플로 오래된 tracking을 되살리지 않는다.
- [ ] 같은 명령 재실행. Expected: 모든 CSC 검사 PASS. 기존 `scripts/test-cadence-core.sh`도 PASS. 커밋한다.

### Task 2: 네이티브 BLE 검색·연결·권한
**Files:** 새 `BleCadenceClient.kt`, `BleConnectionGate.kt`, `BlePermissions.kt`, `tests/BleConnectionTest.kt`, `scripts/test-ble-connection.sh`; 수정 `AndroidManifest.xml`, `MainActivity.kt`.
**Interfaces:** `BleConnectionGate.next(): Long`, `isCurrent(token: Long): Boolean`, `invalidate()`; `BlePermissions.required(api: Int): List<String>`; `BleCadenceClient(activity, onReading: (CadenceReading)->Unit, onStatus: (String)->Unit)`의 `showPicker()`, `connectSaved()`, `stopScan()`, `close()`, 권한 결과 전달 메서드. 센서 이름/주소는 네이티브 화면에서만 처리한다.
- [ ] 순수 연결 게이트/권한 실패 검사 작성: 새 세대 뒤 이전 토큰은 무효; close 뒤 무효; API30 목록에는 FINE_LOCATION, API31 이상에는 SCAN/CONNECT이며 위치 없음. `scripts/test-ble-connection.sh` 실행. Expected: 기능 부재 FAIL.
- [ ] 게이트/권한 계산 구현 후 재실행. Expected: PASS. 모든 GATT/검색 콜백은 세대와 현재 GATT 객체를 검증한다.
- [ ] Android 12 이상 권한과 API30까지 레거시 권한/위치 선언을 추가하고 BLE hardware feature는 required=false로 둔다. 권한 거절은 상태 안내하고 자동 재요청 루프를 만들지 않는다. Bluetooth 켜기는 시스템 선택 화면을 사용한다.
- [ ] 최대15초 검색과 장치 선택 네이티브 다이얼로그를 구현한다. 저장 장치 연결 실패 시 검색 버튼을 제공한다. 검색 취소/배경/Activity종료 시 스캔 중지. 권한 결과가 늦게 오면 현재 요청·foreground 상태를 검증하고 무효 요청에서 검색하지 않는다.
- [ ] GATT connectGatt(autoConnect=false, TRANSPORT_LE) → discoverServices → CSC characteristic → setCharacteristicNotification → CCCD 0x2902 알림 활성화 순서로 처리한다. Android33+ descriptor write API와 이전 API를 분기한다. 구독 성공 뒤 connected, 절차 전체15초 타임아웃. 실패/닫힘에서 GATT close 및 타이머 정리.
- [ ] 알림을 Task1에 전달한다. 첫 샘플 ready; wheel-only는 mode_required; 손상은 unstable. 침묵 중 유효 RPM을 반복 전송하지 않는다. 프런트엔드5초 stale 보호를 유지한다. 연결 내 순번은 MainActivity 어댑터에서 증가시킨다.
- [ ] SDK 직접 빌드 및 연결 검사 실행. Expected: Android Kotlin 컴파일/manifest 검사와 순수 검사 PASS. 실기기 검색/GATT는 미검증으로 기록하고 커밋한다.

### Task 3: 기존 주행에 입력원 통합
**Files:** 수정 `MainActivity.kt`, `app/src/main/assets/index.html`, `app.js`, `style.css`, `tests/startup.test.js`.
**Interfaces:** `window.onCadenceStatus(status, source='phone')`, 기존 `window.onCadencePacket({seq,rpm,confidence,state})`. source='ble'일 때 센서 RPM으로 표시한다. 새 native commands `ble-connect`, `ble-settings`, `cadence-disconnect`는 내부 앱 문서의 main-frame에서만 허용한다.
- [ ] DOM 실패 검사 추가: 센서 연결 버튼 존재, ble connected+packet은 ‘센서 RPM’ 표시, phone source로 전환하면 ‘추정 RPM’ 표시, source 변경은 이전 packet을 비우고 순번을 새로 받는다. 자동 연동에서 disconnect/stale는 pause, 수동pause는 다른 입력원 유효값이 임의로 재개하지 않는다. `npm test` 실행. Expected: 새 기능 검사 FAIL.
- [ ] 홈과 주행 연결 설정에 휴대폰/센서 선택을 추가한다. 입력원 전환 시 공통 epoch를 올리고 이전 TCP/GATT를 종료한다. 현재 입력원과 epoch가 일치하는 콜백만 숫자/상태로 WebView에 전달한다. 코드·Bluetooth주소는 JavaScript에 전달하지 않는다.
- [ ] 센서 권한·Bluetooth꺼짐·검색·모드·구독 실패 상태 문구를 표시한다. 연결 해제/재검색을 명시적으로 제공한다. Background는 기존 pauseRide를 유지하며 새 연결을 시작하지 않는다.
- [ ] `npm test`와 CSC/연결/기존Kotlin회귀 검사 실행. Expected: 모든 검사 PASS. 직접 APK 빌드 PASS. 커밋한다.

### Task 4: 검토·업데이트 APK·GitHub 전달
**Files:** 수정 `app/build.gradle`, `scripts/build-sdk.sh`, `.github/workflows/android.yml`, `README.md`, `VALIDATION.md`; 새 `downloads/RoadRide-v1.3.0.apk`, `downloads/RoadRide-source-v1.3.0.zip`.
- [ ] 1.3.0/versionCode5로 올리고 CSC/연결 검사를 CI에 추가한다. 기존 서명으로 빌드한다. Expected: APK 버전/패키지/서명/zipalign PASS, 이전1.2.0과 인증서 일치.
- [ ] 전체 Node/DOM·CSC·연결·기존Kotlin검사를 실행한다. Expected: PASS. 독립 코드 검토를 받아 중요한 발견을 실패→통과 회귀검사로 수정한다.
- [ ] 한국어 사용 순서와 필요한 센서 모드, Android권한, 검색 실패/다른앱 연결/저장주소변경 복구, 실기기 미검증을 README/VALIDATION에 기록한다.
- [ ] 소스·APK·ZIP과 루트 GitHub workflow를 기존 branch에 업로드한다. 원격 APK/ZIP 바이트 비교 및 GitHub Gradle assembleDebug/lintDebug/전체검사 확인. Expected: 바이트 MATCH, CI SUCCESS.
- [ ] 탭에 업데이트할 APK와 ‘페달 돌려 깨우기→센서 연결→권한허용→S314선택→RPM자동연동’ 순서를 전달한다. 휴대폰은 BLE 모드에서 필요하지 않으며 기존폰방식을 사용할 때만 기존 설치를 유지한다.

## 실행 방식
이전 작업처럼 이 세션에서 직접 구현한다. 마지막에 한 번 독립 검토를 받으며, 실제 사용자 S314와 갤럭시탭의 수신 확인은 자동검사와 구분한다.
