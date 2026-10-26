# MemoryNote 2.0.1

Seven requested corrections:
1. PDF viewport lock keeps current zoom/pan, including across page changes; pen/selection and deliberate page turns remain available.
2. Editor subject/chapter/type now use one compact row of the existing native Spinners. The large metadata/type-tab area is removed, fields/listeners remain intact.
3. PDF starts in pen mode; stylus inks and fingers pan/page. >=80dp horizontal swipe and >=1.5x vertical distance triggers a turn. Selection, pinch, cancel and stylus do not turn pages.
4. Explicit top Save persists PDF state/current note and opens that note; Back also returns to the current captured note, avoiding the original blank editor.
5. Memory Add can consume AI Select clipboard text or image without app rectangle selection. If a rectangle exists, source is explicit. Clipboard images decode at <=3M pixels and preview before roles/save; text remains native text. Solution text uses delimiter-safe cloze; original text retained in source record for role changes/undo.
6. PDF uses width-fit and vertically pans tall pages. Root cause of clipped/hidden menu and footer buttons: existing Ui.button returns MATCH_PARENT LayoutParams, inherited by horizontal controls. PdfStudy.button now resets to WRAP_CONTENT x44dp and single line. Save/settings/page label/focus remain visible. User must still use device AI Select's Copy before Memory Add.
7. New-note visibility/save return flow clarified, current title shown on success. Existing transactional creation path remains; captured-note detail opens on Save/Back rather than original draft. The screenshot already showed a current DB note, so no unsupported claim of reproducing a SQLite insertion failure is made.

Data guards from2.0.0 retained. Solution text containing literal '}}' gets an invisible separator between braces inside its cloze marker, preventing parser-level answer leakage. Reviewer regression failed before fix and passed after. Overlays now remove stale old anonymous classes for replaced outer classes before adding newly generated classes.

Build base2.0.0, version2.0.1/code41, original kr.memorynotes ID/certificate. New generated smali/snapshots ignored; Java/test/build inputs are canonical. No original editor/review/navigation/database classes are modified; only PDF classes replaced plus compact metadata adapter. Existing backup limitations remain: PDF originals/page handwriting/source metadata are outside old note backup; captured note images are included.

Validation: API23 compile, capture-model/deep-copy/role/undo/clipboard text/solution delimiter masking tests; 12 JVM swipe-threshold checks from canvas implementer; prior58 core assertions; actual DEX linkage and APK compression/alignment/CRC/v2-v3 signature checks. Independent review completed and parser delimiter finding fixed. Device drawing, AI Select URI grants and native layout remain physically unverified on Samsung.
