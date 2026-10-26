# MemoryNote 2.0.2 — PDF capture presentation and edit flow

User requirements: separate problem/statement/solution boxes in saved PDF capture notes and review, visible line/thickness controls, no unrelated-draft prompt when editing a saved note, colocate PDF capture/save.

Existing SQLite schema and body role marker storage remain intact. Existing captured notes receive the presentation change. Same-note unsaved edits still resume; unrelated draft does not block editing a saved note. New-note draft recovery remains available. Meaningful unrelated drafts are synchronously archived per ID before the editor can replace the global draft slot; editor exposes explicit recovery when archives exist. Failure to archive blocks replacement.

PDF save and capture are adjacent in the persistent bottom toolbar, including focus mode. Pen width receives a numeric label and contrasting progress track. Mode buttons show the actual active tool; the initial canvas now receives the selected pen mode explicitly rather than relying on the canvas default.

Native device UI/touch behavior requires device confirmation; host compilation, regression tests, final DEX linkage and APK signature checks are performed before delivery.

Selection rectangles now commit final ACTION_UP coordinates (quick drags), choose the nearest overlapping handle, and use a white/navy/blue outline independent of bitmap paint.

Verification: API23 native Java overlay compile; 58 core assertions; PDF capture regression suite; capture role parser cases; 12 page-swipe gates; packaged DEX member linkage; same signing certificate; v2/v3 signatures; stored resource alignment/CRC. No physical tablet/emulator runtime available.
