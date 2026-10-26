# MemoryNote 2.1.1 — separate native PDF text selection

User scope: preserve rectangle selection and AI Select clipboard import, add drag/tap PDF text selection with copy and direct problem/statement/solution creation.

Toolbar adds 글자 선택 (mode4); original 선택 (rectangle,mode1), navigation,pen,eraser unchanged. In text mode a compact action bar shows selection status/copy/memory-add/close. Tap selects a word via native PDF text layer; drag selects range with two independent endpoint handles. Finger gestures in this mode never trigger page swipes. Pinch, cancellation, mode exit/page/document changes invalidate outstanding selections.

PdfTextSelection uses public API35 Page.selectContent(SelectionBoundary(Point),SelectionBoundary(Point)) through runtime reflection. Native text/bounds/endpoints are read off the UI thread, debounced100ms while dragging, submitted immediately on release. Generation/document/page/mode/screen guards prevent stale results being copied/imported. No PDF modification or OCR service. Older OS receives a capability explanation; existing area/AI Select routes remain available. Image-only pages cannot yield text without a text layer.

Normalized viewport coordinates convert to integer PDF points, never bitmap pixels. Highlights are visual overlays excluded from crops and ink. Existing copied/linked PDF opening, backup and book tools retained.

Verification includes actual canvas source with minimal host touch doubles (tap/reverse/handles/pinch/cancel/no swipe), actual reflection extraction with API35-shaped host doubles, pure text coordinate checks, native API23 compilation and preserved original app classes/resource/signatures. Host doubles are test-only and never packaged. Physical Samsung tablet selection/OCR layer behavior is not verified here.
