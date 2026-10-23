# Verification ledger

Plan: docs/superpowers/plans/2026-10-23-pdf-memory.md

Implemented: separate identity/storage; streaming PDF import; bundled Korean OCR; foreground page checkpointing; conservative colored-layout marker recognition; editable question/answer cards; original page regions; stylus ink; cloze stages; today/all/pending reviews.

Independent code review found potential whole-document memory growth, same-page handwriting overwrite, ignored review dates, unsafe bitmap release during OCR timeout, and missed question-marker confidence. The implementation now streams stored OCR pages and emits cards one at a time; bounds card text; reloads stored ink before append/undo; filters today by due and confirmed status; waits for OCR completion before releasing input; flags number gaps/repeated answer markers and inferred numbers.

Ruling: use the uploaded sample's colored marker layout as a conservative first-version rule, rather than claim arbitrary textbook layout parsing. Other layouts may require review; separate answer-book matching is not implemented.

Ruling: bundled Korean OCR and no INTERNET permission. This increases APK size but avoids initial model download and keeps document processing on-device.

Ruling: native Samsung/emulator testing and actual 400MB PDF validation are unavailable. Host algorithm results and APK checks do not substitute for those tests.

Deferred minor limitations: legacy Activity/window inset methods; custom view not intended for XML inflation; optional cache-space allocation API; drawing-path allocations. Native gesture/S Pen smoothness requires device testing.
