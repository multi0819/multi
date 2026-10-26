# MemoryNote 1.9.2

Replaces the app's legacy thickness/settings buttons and color/thickness list dialog with a compact inline width row under the pen palette: minus, slider, numeric value, plus. Applies to editor, detail and review because it hooks the shared InkToolbar. Width is 0.5–30 in half-unit steps, persists under ink_thickness and restores on later screens. Existing color circles and eraser/clear-all menu stay available. No modal dialog is used for width.

The floating Samsung S Pen overlay belongs to the device; this change removes only application-owned legacy controls.

Build uses ../1.9.1 APK as base, Java17/javac, Android23+ jar, R8 8.3.37 and apktool2.11.1; same build.py arguments/environment as the previous update. Keeps sibling 1.9.0 palette source/compiler stubs as build-only dependencies. Packages only ThicknessControl* and WidthPolicy. Version 1.9.2/code31 with original kr.memorynotes signing certificate. Shared InkToolbar attaches ThicknessControl after constructing its palette. InkPage.settings redirects to the inline bar; all other InkPage methods remain unchanged.

Validation: 60 width roundtrips plus boundaries/invalid values; light/dark host control integration (legacy removal, slider, +/−, idempotent attach, saved width); previous 4 detail and 12 editor host scenarios; original core suite 45 assertions. Native DEX linkage 24 fields/37 methods. APK resource alignment/compression/CRC and v2/v3 signature checks pass. Comparison with 1.9.1 confirms only InkPage.settings and InkToolbar attach changed among old classes, preserving strokes, eraser, clear/undo and data handling. Independent review found no important issues. Host simulations do not verify Samsung native rendering/touch.
