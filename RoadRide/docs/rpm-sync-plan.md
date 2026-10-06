# RoadRide RPM Sync Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 휴대폰 주머니의 추정 RPM을 갤럭시탭 영상 배속에 연결한 업데이트 APK를 제공한다.

**Architecture:** Android 포그라운드 서비스가 가속도 센서를 읽어 RPM을 추정하고, 인증된 로컬 TCP 연결로 전송한다. 탭의 네이티브 클라이언트가 값을 수신하며 기존 WebView 플레이어에는 숫자·상태만 전달한다. 순수 Kotlin 추정/프로토콜과 JavaScript 배속 정책을 분리해 실제 기기가 없어도 핵심 실패 조건을 자동검사한다.

**Tech Stack:** 기존 Android SDK 35, Kotlin/JVM, SensorManager, 포그라운드 서비스, TCP 소켓, 공식 YouTube IFrame API, Node/Happy DOM.

**Spec:** `docs/rpm-sync-design.md`

## Global Constraints
- 휴대폰은 바지 앞주머니에서 측정하고 갤럭시탭은 영상 화면을 제공한다.
- 같은 APK와 같은 Wi-Fi를 사용하며 별도 센서·카메라·구독·중계 서버는 사용하지 않는다.
- 기본 기준 60RPM에서 영상 1배속이며 사용자가 기준을 조절할 수 있다.
- 실제 RPM을 정확히 측정했다고 표시하지 않으며 화면에 ‘추정 RPM’을 표시한다.
- 30~150RPM 구간을 우선 검증한다. 보정 계수는 0.5배·1배·2배다.
- 공식 YouTube 플레이어가 제공하는 배속 중 가까운 단계를 선택한다.
- 사용자가 직접 누른 일시정지를 RPM이 임의로 해제하지 않는다.
- 원본 센서 데이터는 기기에 파일로 저장하지 않는다.
- 기존 패키지와 서명키를 유지하고 GitHub의 roadride-app 브랜치로 전달한다.

## Review Focus
- 두 기기의 시계가 다른 경우: 원격 시각을 비교하지 않고 수신 기기의 단조 시계로 메시지 나이를 판단한다.
- 중복·뒤늦은 메시지: 연결 내 순번을 검증해 오래된 값으로 배속을 되돌리지 않는다.
- 낮은 신뢰도와 실제 정지: ‘측정 불안정’과 ‘정지’를 구분하고 잘못된 자동 재개를 막는다.
- 잠금·권한 거절·서비스 종료: 상태를 안내하고 수동 영상 재생을 유지한다.
- 이전 측정기의 연결 종료 또는 새 연결: 이전 소켓의 늦은 이벤트가 새 연결을 끊지 않게 한다.

---

### Task 1: RPM 추정과 프로토콜
**Files:** 새 `CadenceEstimator.kt`, `CadenceProtocol.kt` (기존 `app/src/main/java/com/multi0819/roadride/` 아래), `tests/CadenceCoreTest.kt`, `scripts/test-cadence-core.sh`.
**Interfaces:** `CadenceEstimator.add(timeNs: Long, x: Double, y: Double, z: Double): CadenceReading`; `CadenceReading(rpm: Double, confidence: Double, state: String)`; `CadenceProtocol.encode(seq: Long, reading: CadenceReading): String`, `decode(line: String): CadencePacket?`.
- [ ] 합성 30/60/90/120/150RPM 신호에 대한 추정 오차 5RPM 이내, 방향 변화, 잡음·정지와 짧은 창의 ‘준비 중’ 상태를 검사하는 실패 테스트를 작성한다. 실제 정확도 보장은 합성 검사와 분리한다.
- [ ] 새 Kotlin 테스트 스크립트를 실행해 기능 부재로 실패를 확인한다.
- [ ] 50Hz 입력을 최대 8초 이동 창에서 처리하고 주기·진폭·상관도를 사용해 추정한다. 원본 샘플은 메모리 창에만 둔다.
- [ ] `RR1\t<8자리 임시코드>` 인증, `OK` 응답, `RPM\t순번\tRPM\t신뢰도\t상태` 줄 프로토콜을 구현한다. 줄 길이는 최대 512자, RPM은 0~300, 신뢰도는 0~1, 상태는 준비/측정/정지/불안정으로 제한한다. NaN·Infinity·손상·초과길이 입력 거부 테스트를 추가한다.
- [ ] 핵심 테스트를 실행해 통과를 확인하고 커밋한다.

### Task 2: 휴대폰 측정 서비스와 로컬 연결
**Files:** 새 `CadenceServer.kt`, `CadenceClient.kt`, `CadenceService.kt`, `CadenceActivity.kt`, `tests/CadenceNetworkTest.kt`; 수정 `AndroidManifest.xml`, `scripts/test-cadence-core.sh`.
**Interfaces:** `CadenceServer.start(code: String, provider: () -> CadenceReading): Int`, `stop()`; `CadenceClient.connect(host: String, port: Int, code: String, onPacket: (CadencePacket) -> Unit, onStatus: (String) -> Unit)`, `close()`.
- [ ] 실제 JVM 루프백 소켓으로 정상 인증/잘못된 코드, 과도한 줄 길이, 종료·재연결·중복순번 거부를 검사하는 실패 테스트를 작성한다. 새 연결 이후 이전 연결 콜백을 무시하는 검사도 포함한다.
- [ ] 네트워크 테스트를 실행해 실패를 확인하고, 서버·클라이언트를 구현한다. 서버는 하나의 인증된 수신자만 허용하고 읽기 제한·타임아웃·잘못된 인증 시도 제한을 둔다. 1초마다 작은 상태 메시지를 전송한다.
- [ ] 포그라운드 서비스에서 센서 리스너와 제한된 CPU 잠금 유지, 중지 가능한 알림, 동일 Wi-Fi 주소·포트·임시코드를 제공한다. 서비스 유형은 외부 네트워크 기기와의 연결 목적에 맞는 connectedDevice로 사용하며 Android 버전별 시작·알림 권한을 처리한다. 서비스 자동 재시작으로 사용자가 끝낸 측정을 되살리지 않는다.
- [ ] 네이티브 측정 화면에 시작·종료, 추정 RPM, 보정 계수, 연결 정보와 센서 없음/배터리 제한 안내를 제공한다. 측정 보정은 전송값에 반영한다.
- [ ] Android 소켓의 실제 주소 연결 전 호스트·포트·코드 형식을 검사한다. 카메라·마이크·위치 권한을 추가하지 않는다.
- [ ] JVM 네트워크·추정 테스트를 통과시키고 Android 컴파일과 manifest 권한을 확인한 뒤 커밋한다. 화면 꺼짐 센서 수신은 실기기 검증 여부를 기록한다.

### Task 3: 탭 연결 화면과 자동 배속 정책
**Files:** 새 `app/src/main/assets/cadence-sync.js`, `tests/cadence-sync.test.js`; 수정 `MainActivity.kt`, `AssetRouter.kt`, `index.html`, `style.css`, `app.js`, `tests/startup.test.js`.
**Interfaces:** `CadenceSync.update(packet, receivedAtMs)`, `CadenceSync.tick(nowMs)`, `CadenceSync.setEnabled(enabled)`, `CadenceSync.manualPause()`; `window.onCadencePacket(packet)`, `window.onCadenceStatus(status)`는 네이티브 수신 콜백이다.
- [ ] 60RPM→1배속, 120RPM→지원되는 가까운 배속, 빈 배속 목록의 무명령, 경계값 흔들림 방지, 정지 후 자동 재개, 수동 정지 보존, 수신 후 5초 이상 갱신 없음의 일시정지, 역순 메시지 무시를 검사하는 실패 테스트를 작성한다.
- [ ] `node --test tests/cadence-sync.test.js`로 실패를 확인하고 정책을 구현한다. 변화 필터와 3초 배속 유지 시간을 사용하고, 정지·오래된 값·낮은 신뢰도에는 자동 재생을 하지 않는다.
- [ ] 홈에 ‘휴대폰 RPM 측정’과 ‘휴대폰 연결’을 추가한다. 연결은 네이티브 입력 화면에서 처리해 임시코드와 로컬 소켓을 WebView 외부 리소스에 노출하지 않는다. 주행 화면에는 추정 RPM·연결 상태·자동 연동·기준 RPM을 플레이어와 분리된 영역에 표시한다.
- [ ] 역할 선택, 자동 연동 켜기/끄기, 수동 배속 복귀, 새 코스 선택, 일시정지, 끊김과 재연결, 배경 전환을 기존 운동기록 흐름에 통합한다. 새 네이티브 명령은 앱 내부 문서에서만 허용한다.
- [ ] Happy DOM 통합검사와 기존 Node/Kotlin 회귀검사를 모두 실행해 통과를 확인하고 커밋한다.

### Task 4: 업데이트 APK와 GitHub 전달
**Files:** 수정 `app/build.gradle`, `scripts/build-sdk.sh`, `.github/workflows/android.yml`, `README.md`, `VALIDATION.md`; 새 `downloads/RoadRide-v1.1.0.apk`, `downloads/RoadRide-source-v1.1.0.zip`.
- [ ] 버전을 1.1.0/code 3으로 올리고 기존 서명키로 빌드한다. 오래된 생성 클래스를 빌드 시작 시 제거한다.
- [ ] Kotlin 센서/루프백 테스트, 전체 Node/DOM 테스트, APK 서명·zipalign·패키지/서비스 선언을 검증한다.
- [ ] 독립 코드 검토를 받아 중요한 오류를 회귀 테스트로 수정한다.
- [ ] 같은 Wi-Fi 연결 순서, 앞주머니 위치, 기준 RPM과 보정, 측정 중지, 실제 정확도/잠금 동작 미검증 여부를 한국어 안내에 기록한다.
- [ ] 소스·APK·아카이브를 GitHub 기존 브랜치에 업로드하고 원격 APK의 바이트와 기존 인증서 일치를 확인한다. GitHub Gradle 빌드와 lint 결과를 확인한다.
- [ ] 사용자에게 두 기기에 설치할 APK 하나와 연결 순서를 전달한다.

## 실행 방식
이전 작업과 같이 이 세션에서 직접 구현하고 마지막에 독립 코드 검토를 받는다. 실제 휴대폰과 갤럭시탭은 실행 환경에 연결되어 있지 않으므로 합성/루프백/DOM 검사 결과를 실사용 정확도나 실제 Wi-Fi 성공으로 표현하지 않는다.
