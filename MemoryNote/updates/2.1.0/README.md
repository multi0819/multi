# MemoryNote 2.1.0 — PDF library and complete study backup

User-approved features:
- Document library: original size, local PDF/ink use, last page/date, recent/name/size ordering, rename, safe remove.
- Imports: copy by default or persistent original URI link. SHA256 compares bytes rather than names, including legacy imported copies. Reconnecting/storage conversion preserves document ID, page ink, bookmarks and note sources; mismatched originals rejected.
- Removal deletes only app PDF registration/copy/page ink/bookmarks; existing notes/captured images and external original remain. Source shortcut hidden when no surviving document exists.
- Book page offset matching, PDF/book numbering jump; per-page named/category bookmarks with jump/edit/delete.
- Current-PDF notes: list/details or review all matching notes (including cross-document appended clips).
- Complete backup: notes/images/source metadata/bookmarks/page ink and streamed PDF originals including linked files. Restore materializes all PDFs into app copies, so external URI permissions aren't required on destination.

Native notes backup limits remain512MB total,25MB per image; complete archive allows4GB perPDF/16GB total. Uses staged validation and transactional rollback/recovery before changing live notes. Existing app SQLite schema and signatures preserved. Native rendering/touch, system file picker grants, and crash process death still require device confirmation.

Host checks cover document metadata/offset/bookmark routing, content identity on400MB stream at64MB heap, complete archive validation/remap/corrupt input/recovery and existing regression suites. FinalAPK member linkage, signatures, resources and alignment checked before delivery.

UI paths: 문서→PDF 추가/정렬/전체백업; document ⋮→rename/storage/delete. 설정→책갈피/교재별노트/책쪽수/문서관리/전체백업. Same safety flows apply to documents imported by older releases.
