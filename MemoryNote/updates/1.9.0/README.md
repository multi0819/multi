# MemoryNote 1.9.0 — editor layout

Based on Library-authoritative 1.8.8 (versionCode 28); update is 1.9.0/code 29, same kr.memorynotes ID and existing update certificate.

Changes: fixed compact back/title/save header, side-by-side subject/chapter, three type tabs, expanded body, compact blue answer/amber cloze/purple image controls, native text selection actions retained, folding mistake/caution fields (existing text opens), optional pen palette, neutral extra options. Existing draft recovery remains in use. No external AI service is configured or simulated.

Architecture: EditorLayout attaches after CardEditorControls in NoteEditor.show. All original fields, listeners and model/save methods are retained. Type tabs explicitly invoke switchType because a GONE spinner may not deliver its layout-driven selection event. Gallery route opens its attachment area before requesting images.

Build: use build.py with arguments BASE_APK APKTOOL_JAR R8_JAR ANDROID_JAR APKSIGNER_JAR KEYSTORE OUTPUT_APK. Set MEMORYNOTE_SIGN_PASSWORD in the environment. Requires Java 17, javac, Python 3, apktool 2.11.1, R8 8.3.37 and Android API23 or newer jar. The compiler-stubs directory compensates for removed internal interfaces in Ubuntu's API23 jar. Only EditorLayout* and EditorPalette are packaged; app/framework stubs MUST NOT be packaged. Repacking preserves every original resource byte and patches only versionName/versionCode and dex.

Validation: 12 host integration combinations (theme x existing-content x type), 12 palette contrast checks >=4.5, existing core/backup/text/bulk-selection/speech suite (45 assertions), actual APK adapter linkage (174 fields/149 methods), same application ID and signing certificate, v2/v3 signature verification, resource alignment/compression/ZIP checksums, exact old/new existing-class comparison: only NoteEditor.show changes. Reviewer found hidden-spinner dispatch issue; regression failed before explicit dispatch and passed after. Host UI fakes are simulations, not an emulator. Samsung native rendering, keyboard and touch have not been exercised on physical hardware.
