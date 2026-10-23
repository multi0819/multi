# MemoryNote 1.8.7 (versionCode 27)

Incremental overlay on updates/1.8.5 plus updates/1.8.6. Canonical executable source is smali.

Review now offers Edit; edits use a deep copy, and saving a matching note replaces the same review item, retains the index/scope, and resets answer visibility without rating it. Ordinary saves still open detail. Exiting through normal navigation clears the pending review return. Existing draft handling is retained.

Question and answer fields in card/incorrect-answer editor have separate phrase-selection buttons. Review stages: initial question with cloze masks, reveal answer with masks retained, reveal masked phrases, hide again. Next/previous/skip and save reset visibility. Cards without clozes skip the phrase step; general-note behavior remains one-step. Remove the title/answer/cloze legend and the editor color explanation.

Validation: new review-stage and edit-return/click tests plus all eight prior host programs pass; API35 compilation and 174-field/70-method packaged linkage checks pass; v2/v3 signing, manifest, resource compression, alignment and checksums pass. Actual Samsung/native rendering remains unverified.

Build new ReviewFlow, ReviewActions, CardEditorControls Java classes against API35 plus updated compile-time stubs. D8 only these new production classes (including nested classes); overlay smali into the complete previous snapshots and assemble. Use package.py with base.apk from 1.8.5, zipalign, then sign with the existing private update key. Never package stubs/fake/test.
