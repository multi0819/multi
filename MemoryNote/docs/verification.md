# 검증 결과

- JVM 단위 테스트: 18개 통과, 실패 0.
- 독립 실행 핵심/백업 경로 검사: 20개 assertion 통과.
- Android API 29 에뮬레이터: APK 설치 성공. 한글 저장·검색, 과목명 변경 후 연결 유지, 복습 기록, 사진 포함 백업/복원과 가림 좌표 보존, 손상 ZIP 거부 후 DB 유지, 초안 보호, 주요 화면 열기 등 통합 assertion 11개 통과.
- Gradle assembleDebug 및 lintDebug 성공. Lint 오류 0, 경고 3(백업 규칙 선언, 코드 전용 커스텀 뷰 생성자, 커스텀 뷰 접근성 클릭 처리).
- APK v2 서명 검증 성공.
- 실제 사용자 기기, 갤러리 선택 UI, 제스처, 저장 공간 부족, Android 15 폴더블 화면은 별도 실기기 확인 필요.

첫 GitHub Actions 실행은 SDK 준비 액션이 폐지된 tools 패키지를 요청해 실패했다. 워크플로는 필요한 platform-tools, Android 35 플랫폼과 빌드 도구만 요청하도록 수정했다.
