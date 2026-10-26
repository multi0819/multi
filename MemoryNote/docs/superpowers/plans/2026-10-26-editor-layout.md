# Editor layout implementation plan

Goal: implement the user's approved body-first editor and distinguish action buttons by color.
Architecture: retain the 1.8.8 APK and its existing editor, database, draft and gesture behavior. Add an EditorLayout adapter after show() to rearrange native views. Compile only the adapter against app stubs and overlay its smali.
Scope: compact fixed header with Back/Save; side-by-side subject/chapter; visible type choices; larger body; contextual answer/cloze/color actions; picture menu; collapsible mistakes/cautions and pen toolbar; green save, blue answer, amber cloze, purple image, neutral navigation.
Constraints: same application ID and signing certificate; version 1.9.0/code 29; preserve existing notes, photo behavior, rehide and swipe controls. No external AI service is configured, so do not simulate AI output. Existing local draft saving remains active.

- [x] Verify latest APK and source APIs; create host integration checks for view parenting, existing text, callbacks, folding, type switching and color contrast.
- [x] Implement EditorLayout and attach after existing CardEditorControls. Keep hidden Spinner as the source of type change events.
- [x] Compile and run host integration checks and existing core suite. Build from latest 1.8.8; check dex linkage and package signature/alignment/version. Deliver update APK and preserve source.

Review focus: edited notes with existing caution text; empty subject lists; small screen/large font wrapping; active selections when toolbar opens; card/general type switches retaining content.
