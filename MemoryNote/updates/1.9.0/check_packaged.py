"""Check adapter references and invariants in the disassembled deliverable."""
from pathlib import Path
import re,sys
root=Path(sys.argv[1]);fail=[];fields=methods=0
for p in list((root/'kr/memorynotes').glob('EditorLayout*.smali'))+[root/'kr/memorynotes/EditorPalette.smali']:
 s=p.read_text()
 for owner,field,desc in re.findall(r'(Lkr/memorynotes/[^;]+;)->([^\s:(]+):([^\s,]+)',s):
  t=root/(owner[1:-1]+'.smali');fields+=1
  if not t.exists() or not re.search(r'^\.field [^\n]*\b'+re.escape(field+':'+desc)+r'(?:\s|$)',t.read_text(),re.M):fail.append(owner+'->'+field+':'+desc)
 for owner,method in re.findall(r'(Lkr/memorynotes/[^;]+;)->([^\s(]+\([^\n]*?\)[^\s,]+)',s):
  methods+=1;original=owner
  while owner.startswith('Lkr/memorynotes/'):
   t=root/(owner[1:-1]+'.smali')
   if not t.exists():fail.append(original+'->'+method);break
   source=t.read_text()
   if any(line.startswith('.method ') and line.endswith(' '+method) for line in source.splitlines()):break
   owner=re.search(r'^\.super (.+)$',source,re.M).group(1)
assert not fail,'\n'.join(sorted(set(fail)))
editor=(root/'kr/memorynotes/NoteEditor.smali').read_text()
assert editor.count('Lkr/memorynotes/EditorLayout;->attach')==1
assert not (root/'com/android/internal/view/menu/MenuBuilder.smali').exists(), 'compiler stub leaked into APK'
assert (root/'kr/memorynotes/NoteEditor.smali').stat().st_size>50000,'application class replaced by stub'
print(f'PASS: adapter linkage ({fields} fields, {methods} methods); single editor hook; compiler stubs excluded')
