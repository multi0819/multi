# MemoryNote2.1.4 — skip empty new-note drafts

Root cause: NoteEditor.show/pause/watchers persist the draft even without content, leave always prompts, MainActivity.edit treats any draft string as a pending note. Guard persistence after collect; bypass leave prompt for empty unsaved notes; remove stale empty unsaved drafts before home/edit. Metadata-only subject/chapter/type choices do not count as authored content. Title/body/question/answer/mistake/caution/tags/favorite/images/ink count as content. Persisted notes are never discarded solely because their edits are blank. Unrelated meaningful drafts and malformed drafts remain protected.

Validation: meaningful-content tests, native build, packaged hook/member linkage, unchanged note DB/storage/PDF classes and signed aligned APK. DeviceUI not directly validated.
