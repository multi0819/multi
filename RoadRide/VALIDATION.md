# 검증 상태
- 운동시간과 저장값 모델: Node 테스트 4개 통과.
- 재생 상태·버퍼링·오류·배속·배경 일시정지: Node 테스트 4개 통과.
- 공개 코스 8개: YouTube oEmbed 응답과 원본 제목 확인 (2026-10-06).
- Android SDK 35/Kotlin 직접 빌드: 통과. APK v2/v3 서명 검증 및 zipalign 검사 통과.
- 로컬 Gradle/lint는 다운로드 제한으로 실행하지 못했으나 GitHub Actions의 Gradle assembleDebug 및 lintDebug 검증은 통과했습니다. 실행: https://github.com/multi0819/multi/actions/runs/37419808471 .
- Android 실기기/에뮬레이터: 연결된 기기가 없어 설치·주행 미검증.
- DOM 통합 테스트 4개 통과: 코스 8개, 즐겨찾기, 일시정지 타이머, 몰입 조작부, 기록·이어보기, 플레이어 준비 시간초과 복구. Happy DOM에서 실제 앱 JavaScript를 실행하고 외부 플레이어는 테스트 대역으로 제공했습니다. 렌더링 브라우저 테스트는 Chromium 실행이 SIGSEGV로 종료되어 미완료입니다. 실제 영상 재생 검증과 화면 렌더링 검증을 완료했다고 주장하지 않습니다.

- 독립 코드 검토: Critical 없음, Important 1건(플레이어 준비가 무한 대기하는 경우) 수정 후 회귀 테스트 RED→GREEN. 전체 Node/DOM 테스트 12개 통과.
- 미룬 Minor: 플레이어가 지원 배속 목록을 빈 배열로 반환할 때 선택을 비활성화하는 처리. 정상 YouTube API는 1배속을 포함하므로 일반 동작에는 영향이 제한적입니다.

- GitHub에 업로드한 APK와 소스 ZIP은 로컬 원본과 SHA-256을 비교해 동일함을 확인했습니다.

## 1.0.1
사용자 스크린샷의 data: ERR_HTTP_RESPONSE_CODE_FAILURE를 기존 시작 경로와 라우팅 제한에서 확인했습니다. HTTPS 내부 index.html로 시작하도록 수정했으며, 시작 주소·정상 자산·외부 호스트·경로 이탈·data: 차단 5개 검사 RED→GREEN을 확인했습니다. 전체 JavaScript 테스트 12개 통과, 수정 APK 직접 빌드와 서명 검사 통과. 실기기 재확인은 아직 하지 못했습니다.

## 1.1.0 RPM update
- Synthetic cadence: 30/60/90/120/150 RPM within 5 RPM, slowly rotating axes, stationary and random-noise rejection.
- Real JVM loopback sockets: temporary-code authentication, bounded lines, increasing sequence, disconnect/reconnect and old callback generation suppression.
- JS/DOM: supported rates, 3s hold, stale/low-confidence stop, auto-pause ownership, manual pause, reconnect, manual rate restoration; complete suite 20/20 passing after final review fixes.
- Native service compiled with SDK 35; explicit foreground start, stop notification, 4h wake-lock timeout, no camera/microphone/location permissions.
- Actual hardware, pocket accuracy, real Wi-Fi between devices and screen-off behavior remain unverified.

Final review regressions: sensor gaps invalidate the old reading immediately; stopped windows discard historical pedaling before a one-off bump; embedded YouTube Play restores RPM synchronization after manual Pause.

Deferred minor: notification permission denial has no in-app result explanation; README provides the stop path. No hardware-level permission/lifecycle validation was claimed.

## 1.2.0 update
- Pairing/restart real JVM loopback: first short-code authentication receives a 128-bit-format saved token; restarted sender accepts that token at the same port with a different short code. Includes socket-generation regression and single-client bounds. UUID token has UUID-v4 entropy.
- Metrics model: 60RPM→20km/h, distance and MET energy integration, pause/stale/no-cadence/long-gap exclusion, range-checked settings.
- Rate policy: same current rate produces no command, buffering defers changes, 2s stability/5s hold, pending acknowledgement suppresses duplicate requests.
- DOM integration: immersive dashboard values, clock/time, settings persistence; suite 26/26 before independent review.
- Native YouTube full-screen stats column compiles; no actual device or layout validation available here. Android pairing storage and Wi-Fi IP-change fallback also require device confirmation.

Independent 1.2.0 review found an incomplete-handshake persistence edge: saved pairing credentials now commit only after final OK. Malformed/EOF handshakes reproduce failure before fix and pass after fix, alongside successful saved-token restart.
