# MemoryNote 1.8.5 (versionCode 25)

This snapshot preserves the complete installed 1.8.4 executable source, including the 1.6–1.8 toolbar, paging and rehide changes absent from the original Gradle source tree. `smali/` is the canonical executable source; java/ contains maintained paging helpers. Stubs and fake classes are tests only and must never be packaged.

Fix: a small initial vertical wobble no longer permanently disables a subsequent horizontal swipe. A vertical displacement of the commit distance still locks scrolling; horizontal paging still requires 80dp, single finger, horizontal dominance, and release. Photos remain stationary. Image-only whitespace separators are omitted from reader layout, without changing note text, image pixels, saved data or text span offsets.

Verification: reproduced first-swipe cancellation with a failing regression before the change; regression passes after the fix. All eight host test programs pass, covering classifier, 3 display densities, 102-page navigation, dispatch ownership, controls, S Pen, pinch, cancellation, layout ancestry, rehide and blank image separators. Package linkage, resource compression/alignment/checksum and v2/v3 signature validation pass. Actual Samsung tablet input and native rendering remain unverified.

Build: compile java/ against Android API 35 + stubs, D8 only production helpers (never stubs/fake), disassemble and overlay helpers into smali/, assemble all smali to classes.dex, run package.py, zipalign, sign with the existing private update key. base.apk is the signed 1.8.4 resource baseline; package.py replaces DEX, removes old signatures and advances manifest version. The original Gradle tree is historical 1.5.0 and does not represent this binary.
