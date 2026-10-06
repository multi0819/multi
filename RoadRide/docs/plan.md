# RoadRide Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 센서 없이 고화질 도로 영상을 감상하며 운동할 수 있는 한국어 안드로이드 APK와 GitHub 소스를 제공한다.

**Architecture:** Android Java 앱 셸과 HTTPS 로컬 자산 WebView에서 공식 YouTube 플레이어를 제공한다. 코스 목록과 운동 상태 모델을 UI에서 분리하고 내부 저장소에 기록한다. 별도 유료 서버 없이 온라인 영상을 이용한다.

**Tech Stack:** Android SDK 35, Java, AndroidX WebKit, HTML/CSS/JavaScript, YouTube IFrame Player API, Gradle.

**Spec:** RoadRide-design.md

## Global Constraints
- 센서나 앱 구독 없이 사용한다.
- 한국어 UI, 가로 전체화면, 전방 1인칭 연속 주행 영상을 제공한다.
- 영상은 공식 임베드로 재생하며 다운로드·재배포하지 않는다.
- 4K 원본을 우선하되 실제 4K 출력이나 광고 제거를 보장하지 않는다.
- 실제 속도·거리·칼로리를 측정값처럼 표시하지 않는다.
- 기존 GitHub 저장소를 임의로 덮어쓰지 않는다.

## Review Focus
- 영상 차단 또는 삭제: 타이머를 멈추고 다른 코스 및 원본 링크를 제공한다.
- 버퍼링과 일시정지: 운동시간에 누적하지 않는다.
- 앱 배경 이동: 재생과 운동시간을 중단한다.
- 저장된 값 손상: 초기 상태로 안전하게 복구한다.
- 지원하지 않는 배속: 플레이어가 제공한 지원 배속만 선택한다.

---

### Task 1: 코스 목록과 운동 상태
**Files:** `app/src/main/assets/routes.json`, `app/src/main/assets/ride-state.js`, `tests/ride-state.test.js`.
**Interfaces:** 코스 `{id,title,category,videoId,sourceUrl}`; `RideState.setPlaying(playing,nowMs)`, `RideState.elapsed(nowMs)`, `RideState.finish(nowMs)`.
- [ ] 재생→버퍼링→재생→종료 시 재생 구간만 합산하고 종료를 두 번 호출해도 기록이 중복되지 않는 실패 테스트를 작성한다.
- [ ] `node --test tests/ride-state.test.js`를 실행하여 구현 부재로 실패를 확인한다.
- [ ] 상태 모델을 구현하고 손상 저장값은 기본값으로 복구한다.
- [ ] 공개 영상 후보의 원본 링크·영상 유형·임베드 상태를 확인해 코스 JSON에 등록한다. 확인 불가 영상은 검증 완료로 표기하지 않는다.
- [ ] 동일 테스트로 통과를 확인하고 커밋한다.

### Task 2: 홈과 주행 화면
**Files:** `app/src/main/assets/index.html`, `app/src/main/assets/style.css`, `app/src/main/assets/app.js`, `tests/player.test.js`.
**Interfaces:** `openRoute(routeId,resume)`, `onPlayerStateChange(event)`, `pauseRide()`, `showPlayerError(code)`; Task 1 상태 모델을 소비한다.
- [ ] 플레이어 목 객체로 버퍼링·오류·미지원 배속·배경 일시정지의 상태 전이를 검증하는 실패 테스트를 작성한다.
- [ ] `node --test tests/player.test.js`를 실행하여 실패를 확인한다.
- [ ] 코스 카드, 분류 필터, 즐겨찾기, 이어보기, 기록 목록과 가로 몰입 화면을 구현한다. 앱 컨트롤은 YouTube 플레이어를 가리지 않는 별도 영역에 둔다.
- [ ] 공식 플레이어의 지원 배속만 사용하고, 오류 시 재시도·다른 코스·원본 열기를 제공한다.
- [ ] 두 테스트 파일을 실행해 통과를 확인하고 가능한 브라우저에서 실제 영상 재생과 UI를 점검한다. 검증 불가 항목은 README에 남긴 뒤 커밋한다.

### Task 3: Android APK와 전달
**Files:** `app/src/main/java/app/roadride/MainActivity.java`, `app/src/main/AndroidManifest.xml`, `app/build.gradle`, `settings.gradle`, `.github/workflows/android.yml`, `README.md`.
**Interfaces:** Activity가 HTTPS 자산 로더와 WebView를 생성하고 Activity 생명주기에서 `pauseRide()`를 호출한다. 외부 링크는 시스템 브라우저로 연다.
- [ ] SDK 35 및 최소 Android 8을 대상으로 Gradle 프로젝트를 구성한다. 필요한 인터넷 권한과 화면 꺼짐 방지만 사용한다.
- [ ] HTTPS 자산 로더, 도메인 제한, 가로 주행 화면, 뒤로가기, 배경 일시정지와 전체화면 종료를 구현한다.
- [ ] `./gradlew assembleDebug lintDebug`를 실행하여 빌드·검사를 확인한다. 설치 가능 APK의 패키지·버전·서명을 검사한다.
- [ ] 실기기 또는 에뮬레이터를 사용할 수 있으면 재생과 복원을 확인한다. 없으면 실기기 미검증을 명시한다.
- [ ] GitHub Actions APK 빌드 workflow와 한국어 설치 안내를 작성한다. 승인된 새 저장소 또는 기존 저장소의 별도 폴더·브랜치에 소스를 업로드하고 기존 앱 파일은 보존한다.
- [ ] APK, 소스 링크, 수행한 검증과 남은 제한을 사용자에게 전달한다.

## 실행 제안
한 앱의 연결된 세 작업이므로 이 세션에서 직접 구현하는 방식을 권장한다. 새 GitHub 저장소 생성 기능이 연결에 없으므로, 사용자가 새 저장소를 만들거나 기존 저장소 내 별도 경로를 지정해야 한다. 코드 작성 전에 이 계획을 확인받는다.
