"""Validate linkage and page integration against the APK's actual disassembled DEX."""
from pathlib import Path
import re,sys
root=Path(sys.argv[1]);failures=[];fields=methods=0
paths=[root/'kr/memorynotes'/f'{name}.smali' for name in ('NoteSwipe','SwipePager','SwipeGesture','ReviewFlow','ReviewFlow$State','ReviewActions','CardEditorControls','WindowChrome','ReviewLayout','ReviewLayout$Symbol')]+list((root/'kr/memorynotes').glob('ReviewControls*.smali'))
paths+=list((root/'kr/memorynotes').glob('ReviewActions$*.smali'))+list((root/'kr/memorynotes').glob('CardEditorControls$*.smali'))
for p in paths:
 s=p.read_text()
 for owner,field,desc in re.findall(r'(Lkr/memorynotes/[^;]+;)->([^\s:(]+):([^\s,]+)',s):
  t=root/(owner[1:-1]+'.smali');fields+=1
  if not t.exists() or not re.search(r'^\.field [^\n]*\b'+re.escape(field+':'+desc)+r'(?:\s|$)',t.read_text(),re.M):failures.append(owner+'->'+field+':'+desc)
 for owner,method in re.findall(r'(Lkr/memorynotes/[^;]+;)->([^\s(]+\([^\n]*?\)[^\s,]+)',s):
  methods+=1;original=owner
  while owner.startswith('Lkr/memorynotes/'):
   t=root/(owner[1:-1]+'.smali')
   if not t.exists():failures.append(original+'->'+method);break
   source=t.read_text()
   if any(line.startswith('.method ') and line.endswith(' '+method) for line in source.splitlines()):break
   owner=re.search(r'^\.super (.+)$',source,re.M).group(1)
assert not failures, '\n'.join(sorted(set(failures)))
main=(root/'kr/memorynotes/MainActivity.smali').read_text();review=(root/'kr/memorynotes/ReviewScreen.smali').read_text()
assert '.method public dispatchTouchEvent(' not in main,'global Activity touch hook must be removed'
assert '.method public swipeCancel(' not in main,'legacy cancellation bridge must be removed'
assert 'Lkr/memorynotes/NoteSwipe;->bindReview' in review
assert 'Lkr/memorynotes/ReviewNavigation;' not in review
assert not list((root/'kr/memorynotes').glob('ReviewNavigation*.smali'))
print(f'PASS: {fields} field and {methods} method references; body pager integrated; global touch hook and added header removed')
