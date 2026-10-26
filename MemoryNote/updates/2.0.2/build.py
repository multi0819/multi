"""Build an update from a verified 2.0.1 base; dependencies and signing key stay outside git."""
from pathlib import Path
import os,shutil,subprocess,sys,tempfile,zipfile
HERE=Path(__file__).resolve().parent
base,apktool,r8,android,signer,key,output=map(lambda s:Path(s).resolve(),sys.argv[1:])
def run(*args):subprocess.run([str(a) for a in args],check=True)
with tempfile.TemporaryDirectory(prefix='memorynote-editor-') as name:
 w=Path(name);classes=w/'classes';classes.mkdir();dex=w/'dex';dex.mkdir()
 sources=list((HERE/'java').rglob('*.java'))+list((HERE/'stubs').rglob('*.java'))+list((HERE.parent/'1.9.0/compiler-stubs').rglob('*.java'))+[HERE.parent/'1.9.0/java/kr/memorynotes/EditorPalette.java',HERE.parent/'1.9.2/java/kr/memorynotes/WidthPolicy.java',HERE.parents[1]/'app/src/main/java/kr/memorynotes/InlineImageText.java']
 run('javac','--release','8','-encoding','UTF-8','-cp',android,'-d',classes,*sources)
 packaged=list((classes/'kr/memorynotes').glob('Pdf*.class'))+list((classes/'kr/memorynotes').glob('StudyPdfCanvas*.class'))+list((classes/'kr/memorynotes').glob('CompactStudyMetadata*.class'))+list((classes/'kr/memorynotes').glob('CaptureRole*.class'))+list((classes/'kr/memorynotes').glob('DraftArchive*.class'))
 packaged=[p for p in packaged if not p.stem.endswith('Test')]
 run('java','-cp',r8,'com.android.tools.r8.D8','--min-api','26','--lib',android,'--output',dex,*packaged)
 adapter=w/'adapter.apk'
 with zipfile.ZipFile(base) as src,zipfile.ZipFile(adapter,'w') as dst:
  for info in src.infolist():
   if not info.filename.startswith('META-INF/'):dst.writestr(info,(dex/'classes.dex').read_bytes() if info.filename=='classes.dex' else src.read(info.filename))
 run('java','-jar',apktool,'d','-r','-f',adapter,'-o',w/'adapter')
 run('java','-jar',apktool,'d','-r','-f',base,'-o',w/'app')
 package=w/'app/smali/kr/memorynotes'
 adapters=list((w/'adapter/smali/kr/memorynotes').glob('*.smali'))
 outers={p.stem.split('$')[0] for p in adapters}
 for p in list(package.glob('*.smali')):
  if p.stem.split('$')[0] in outers:p.unlink()
 for p in adapters:shutil.copy2(p,package/p.name)
 editor=package/'NoteEditor.smali';main=package/'MainActivity.smali'
 for filename,call,register in [('MainActivity.smali','Lkr/memorynotes/DetailLayout;->attach(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V','p0'),('ReviewScreen.smali','Lkr/memorynotes/ReviewBoxes;->apply(Lkr/memorynotes/MainActivity;)V','v1')]:
  path=package/filename;text=path.read_text();lines=text.splitlines();hits=[i for i,line in enumerate(lines) if call in line];assert len(hits)==1
  lines.insert(hits[0]+1,'    invoke-static {'+register+'}, Lkr/memorynotes/CaptureRoleBoxes;->apply(Lkr/memorynotes/MainActivity;)V');path.write_text('\n'.join(lines)+'\n')

 assert editor.read_text().count('Lkr/memorynotes/PdfStudy;->addEntry')==1
 assert 'Lkr/memorynotes/PdfStudy;->result' in main.read_text()
 # Editing a saved note must not be intercepted by an unrelated global draft.
 text=main.read_text();start=text.index('.method edit(Lkr/memorynotes/Note;)V');pos=text.index('    :cond_0',start)+len('    :cond_0')
 text=text[:pos]+"\n    if-eqz p1, :new_note_draft_check\n    invoke-static {p0, v0}, Lkr/memorynotes/DraftArchive;->archive(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)Z\n    move-result v1\n    if-nez v1, :archive_ok\n    return-void\n    :archive_ok\n    invoke-virtual {p0, p1}, Lkr/memorynotes/MainActivity;->openEditor(Lkr/memorynotes/Note;)V\n    return-void\n    :new_note_draft_check\n"+text[pos:];main.write_text(text)
 run('java','-jar',apktool,'b',w/'app','-o',w/'rebuilt.apk')
 run(sys.executable,HERE/'package.py',base,w/'rebuilt.apk',w/'unsigned.apk')
 run('java','-jar',signer,'sign','--ks',key,'--ks-key-alias','androiddebugkey','--ks-pass','env:MEMORYNOTE_SIGN_PASSWORD','--key-pass','env:MEMORYNOTE_SIGN_PASSWORD','--out',output,w/'unsigned.apk')
 run('java','-jar',signer,'verify','--verbose',output)
 generated=HERE/'smali/kr/memorynotes';generated.mkdir(parents=True,exist_ok=True)
 for p in list(generated.glob('Pdf*.smali'))+list(generated.glob('StudyPdfCanvas*.smali'))+list(generated.glob('CompactStudyMetadata*.smali')):p.unlink()
 for p in (w/'adapter/smali/kr/memorynotes').glob('*.smali'):shutil.copy2(p,generated/p.name)
 shutil.copy2(editor,HERE/'NoteEditor.smali');shutil.copy2(main,HERE/'MainActivity.smali')
