# MemoryNote 2.0.3 — PDF find and direct navigation

The bottom navigation includes Find. The bottom bar explicitly shows current / total PDF pages and a separate Page Jump button. Navigation and capture/save use separate compact rows so fixed action widths cannot collapse the page count on narrower screens. Jump accepts only 1..pageCount and keeps invalid input visible with an error. Printed textbook page numbers may differ from PDF page indexes.

Find opens an inline optional panel: query / find / previous / next / close, status/progress underneath. Uses public Android 15 (API35+) PdfRenderer.Page.searchText and PageMatchBounds.getBounds via reflection so older devices can still run the app. Older systems receive a capability explanation instead of a missing-method crash. Results are highlighted in yellow with an orange active bound. Previous/next navigates matches on the page then searches the remaining document once, wrapping. Search checks one page at a time off the UI thread; cancel, manual navigation, changing document, and screen destruction invalidate callbacks. No document upload, OCR, or permanent PDF modification. Image-only scanned PDFs need a text layer before words can be found.

Search highlights do not enter image crops or handwriting files. Locked zoom/pan remains fixed; unlocked views center the first line of the active match. Existing capture/storage/schema/draft behavior is retained from 2.0.2.

Validation: native API23 compilation with runtime reflection for API35 search; 7,870 pure page-order/input assertions; capture/parser/swipe regressions; original core suite; final DEX linkage, preserved resources and signatures. Native Android15/16 search and tablet UI/touch require physical-device verification.
