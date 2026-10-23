# MemoryNote 1.8.6 (versionCode 26)

Apply this incremental overlay to the complete updates/1.8.5 snapshot.
WindowChrome.java is compiled against Android API 35 with the existing compile-time stubs (Ui requires a public int bg matching the actual packaged class). Only WindowChrome.class is passed to D8. Overlay the two smali files into the previous snapshot. Reassemble DEX and use package.py with the 1.8.4 base.apk retained in the previous snapshot, then zipalign and sign with the existing private update key. Never package stubs or tests.

Fixes: synchronize caption/status/navigation icon appearance with the app dark setting; supply matching window background for transparent caption controls on API 35+; hide only navigation bars using transient-by-swipe behavior, with legacy immersive navigation fallback on API 26–29. Reapply after shell reconstruction and on focus regain. System status bar and window caption are not hidden.

Validation: Android API 35 compilation; policy checks for light/dark and pre/post API35; existing eight paging/layout/rehide/photo-spacing host programs pass; DEX linkage, APK resources/checksum/alignment and v2/v3 signature checks pass. Samsung device window caption/taskbar/native rendering and multiwindow behavior remain unverified. System gestures can reveal navigation temporarily; system-controlled desktop taskbars may remain visible in desktop windowing.
