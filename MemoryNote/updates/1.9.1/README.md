# MemoryNote 1.9.1

User requested the same visual cleanup for the note detail screen and whole-handwriting clearing under the eraser.

DetailLayout retains original content and callbacks, adds compact fixed back/title/meta/pen/edit header, differentiates question/answer headings, groups green review and purple speech actions, amber favorite and neutral More. More contains the original convert/delete controls with their existing confirmation callbacks. Speech remains absent for image notes. Pen palette folds as in the editor.

EraseMenu replaces only the original eraser-mode runnable with a two-choice dialog: eraser mode / clear all handwriting. Eraser mode uses the same enabled/eraser flags and refresh callback. Clear all confirms and invokes original InkPage.clear, which checkpoints all note.ink, replaces it with an empty array, saves through the existing changed callback and invalidates. It therefore clears all scopes of the current note, never other notes or text/photos, and the original undo restores the checkpoint. Existing More clear label is also made explicit.

Build: same dependencies/arguments as ../1.9.0/build.py; base must be the verified 1.9.0 APK. Requires sibling 1.9.0 compiler stubs and palette source. VersionCode 30/versionName 1.9.1, same application ID/certificate. No signing keys are committed.

Validation: 4 host detail scenarios (dark/light, speech eligible/excluded), preserved original action callbacks, folding, confirmed clear routing and eraser mode; all 12 editor integration scenarios; 45 original core assertions. APK check validates resources, alignment and CRCs; actual new DEX linkage 87 fields/86 methods. Old/new classes compare unchanged except MainActivity and InkToolbar; InkPage clear/undo/checkpoint remains byte-identical. Signature v2/v3 verified. Host UI simulations are not device tests; native Samsung layout/touch has not been verified.
