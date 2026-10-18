# 암기노트 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 여러 과목을 지원하는 개인용 안드로이드 암기·오답노트 앱을 GitHub에서 관리하고 설치 APK를 제공한다.

**Architecture:** 안드로이드 네이티브 화면과 SQLite 저장소를 분리한다. 사진은 내부 파일로 복사하며 ZIP 백업은 검증·임시 복원을 거쳐 원자적으로 적용한다. GitHub Actions에서 테스트와 APK 빌드를 수행한다.

**Tech Stack:** Java, Android SDK, SQLite, Gradle, JUnit, GitHub Actions.

**Spec:** ../specs/2026-10-18-memory-notes-design.md

## Global Constraints
- 로그인 없이 오프라인으로 사용한다.
- 과목, 단원, 글·사진 노트, 빈칸, 사진 가림, 문답, 오답, 복습, 검색, 통계, 백업·복원을 포함한다.
- 모름 다음 날, 헷갈림 3일 뒤, 외웠음 7·14·30일 뒤. 휴대폰 현지 날짜 기준.
- 안드로이드 최소 API 26, 대상 API 35. 한국어 UI.
- 앱 서명 키를 저장소에 넣지 않는다. 지속적인 업데이트용 키는 GitHub 비밀값으로 관리하며, 없으면 테스트 APK임을 명시한다.

## Review Focus
- 긴 한글과 특수문자 입력 후 재시작해도 내용을 보존한다.
- 사진 선택 취소와 저장 공간 부족 시 기존 노트를 보존한다.
- 과목·단원 이름 변경 시 기존 노트 연결을 유지한다.
- 손상·경로 탈출 ZIP 복원은 거부하고 기존 데이터를 보존한다.
- 현지 자정과 월말에 복습 날짜를 정확히 계산한다.

### Task 1: 저장·복습 기반
**Files:** app/build.gradle, settings.gradle, build.gradle, app/src/main/AndroidManifest.xml, app/src/main/java/kr/memorynotes/{Note,NoteDb,ReviewScheduler}.java, app/src/test/java/kr/memorynotes/ReviewSchedulerTest.java
**Interfaces:** NoteDb.save(Note), NoteDb.query(String), ReviewScheduler.next(LocalDate,int,int).
- [ ] 복습 날짜의 월말·윤년·모름 초기화 테스트를 작성하고 실패 확인.
- [ ] Gradle 구성, SQLite 스키마, 과목·단원·노트 CRUD, 날짜 계산 구현.
- [ ] 테스트 실행 및 SQLite 삽입·조회·관계 유지 검증 후 커밋.

### Task 2: 작성과 학습 화면
**Files:** app/src/main/java/kr/memorynotes/{MainActivity,NoteEditor,ReviewScreen,ImageMaskView}.java, app/src/main/res/values/{strings,styles}.xml
**Interfaces:** NoteEditor는 NoteDb.save(Note)를 호출하며 ReviewScreen은 복습 결과를 저장한다. ImageMaskView는 이미지 상대 좌표 사각형을 읽고 쓴다.
- [ ] 긴 한글 저장, 과목 이름 변경, 선택 취소에 대한 화면 검증 절차를 작성.
- [ ] 홈·과목·단원 관리·일반 노트·문답·오답 편집·사진 첨부/확대·텍스트 빈칸·사진 가림 구현.
- [ ] 오늘 복습·전체/과목별 복습·이해도·즐겨찾기·검색 필터·통계 구현.
- [ ] 큰 글씨·다크모드·뒤로가기·입력 중 회전/재시작의 초안 복구를 검증 후 커밋.

### Task 3: 백업·복원
**Files:** app/src/main/java/kr/memorynotes/{BackupManager,SettingsScreen}.java, app/src/test/java/kr/memorynotes/BackupValidationTest.java
**Interfaces:** BackupManager.exportTo(OutputStream), BackupManager.validateAndRestore(InputStream). 설정 화면은 Android 파일 선택기를 통해 스트림을 전달한다.
- [ ] 손상 ZIP·누락 사진·경로 탈출·중복 항목·미지원 버전 거부 테스트를 작성하고 실패 확인.
- [ ] DB·이미지·복습 정보를 버전 포함 ZIP으로 내보내고 임시 폴더 검증 후 복원. 대체 전 확인 화면 제공.
- [ ] 사진 가림과 날짜까지 왕복 비교하고 실패 시 데이터 보존 검증 후 커밋.

### Task 4: GitHub와 설치본
**Files:** .github/workflows/android.yml, README.md, .gitignore, docs/manual-checks.md
**Interfaces:** GitHub Actions는 Gradle testDebugUnitTest 및 assembleDebug 실행 후 APK artifact 업로드.
- [ ] 전용 GitHub 저장소와 기본 브랜치를 확인하고 기존 자료를 보존해 등록.
- [ ] 테스트·빌드 워크플로 작성. 출시 서명은 별도 비밀값이 제공된 경우만 사용.
- [ ] 테스트와 빌드 결과를 확인하고 실패 시 로그를 근거로 수정.
- [ ] 소스·APK 제공. 실기기에서 검증하지 못한 항목은 명확히 안내.

## 실행 전 확인
새 저장소 생성 도구가 제공되지 않으므로 사용자가 빈 저장소를 만든 후 링크를 제공하거나 사용할 기존 저장소를 지정해야 한다. 실행은 현재 세션에서 직접 구현하는 방식을 권장한다. 계획 검토 후 구현을 시작한다.
