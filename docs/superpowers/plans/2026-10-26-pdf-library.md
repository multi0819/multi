# PDF library implementation plan

Goal: all user-approved PDF management, complete backup, page labels/bookmarks, per-document notes, and copy/link storage.
Architecture: keep Note DB schema, PDF state.json docs/notes mapping, per-page ink. Add PdfDocuments persistence/I/O, PdfLibrary management UI, PdfFullBackup archive. Native Java overlay on2.0.3, version2.1.0/code44, signing identity unchanged.

Global constraints: Never delete created notes/images when deleting a PDF. Linked originals never deleted. Preserve PDF IDs/ink/source mappings when relinking or changing storage. Persist metadata atomically before cleanup. Existing notes retain display/masks. No network transfer of documents. Large PDFs streamed. Invalid backup leaves existing data recoverable.

Tasks:
- [x] Complete full backup engine exportTo(MainActivity,OutputStream), restoreFrom(MainActivity,InputStream), including notes, images, PDF originals (materialize links), state and handwriting. Stage/validate before restore, rollback safeguards. Host archive tests.
- [x] Add copy/link import and content SHA256 duplicate detection, descriptor access shared by render/search, migration of existing copied files. Reconnect and storage conversion same IDs.
- [x] Add document library list size/recent-page/name/date sort, rename, safe delete, full backup entry. Allow list only after flushing current ink.
- [x] Add book offset matching/jump, named category bookmarks, per-document note list/detail/review/source.
- [x] Integrate request result/lifecycle; compile; tests; independent review; sign and save APK; persist sources.

Review focus: file permission loss; same filename different bytes vs same bytes different name; deleting active doc during render; malicious/truncated backup; storage/metadata write failures.

Verification: APK2.1.0/API26 minimum/code44 builds and verifies with previous certificate. Host core58, backup33, recovery36, rules15, page routing7870, swipe12;400MB identity under64MB heap; member linkage2447fields/1116methods; original SQLite/review/editor classes/resources retained. Tablet runtime unavailable. Source reviewed by editor_review and pdf_canvas; all important findings addressed.
