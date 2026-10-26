"""Build an update from a verified 1.9.3 base; dependencies and signing key stay outside git."""
from pathlib import Path
import os,shutil,subprocess,sys,tempfile,zipfile
HERE=Path(__file__).resolve().parent
base,apktool,r8,android,signer,key,output=map(lambda s:Path(s).resolve(),sys.argv[1:])
def run(*args):subprocess.run([str(a) for a in args],check=True)
with tempfile.TemporaryDirectory(prefix='memorynote-editor-') as name:
 w=Path(name);classes=w/'classes';classes.mkdir();dex=w/'dex';dex.mkdir()
 sources=list((HERE/'java').rglob('*.java'))+list((HERE/'stubs').rglob('*.java'))+list((HERE.parent/'1.9.0/compiler-stubs').rglob('*.java'))+[HERE.parent/'1.9.0/java/kr/memorynotes/EditorPalette.java',HERE.parent/'1.9.2/java/kr/memorynotes/WidthPolicy.java',HERE.parents[1]/'app/src/main/java/kr/memorynotes/InlineImageText.java']
 run('javac','--release','8','-encoding','UTF-8','-cp',android,'-d',classes,*sources)
 packaged=list((classes/'kr/memorynotes').glob('Pdf*.class'))+list((classes/'kr/memorynotes').glob('StudyPdfCanvas*.class'))
 run('java','-cp',r8,'com.android.tools.r8.D8','--min-api','26','--lib',android,'--output',dex,*packaged)
 adapter=w/'adapter.apk'
 with zipfile.ZipFile(base) as src,zipfile.ZipFile(adapter,'w') as dst:
  for info in src.infolist():
   if not info.filename.startswith('META-INF/'):dst.writestr(info,(dex/'classes.dex').read_bytes() if info.filename=='classes.dex' else src.read(info.filename))
 run('java','-jar',apktool,'d','-r','-f',adapter,'-o',w/'adapter')
 run('java','-jar',apktool,'d','-r','-f',base,'-o',w/'app')
 package=w/'app/smali/kr/memorynotes'
 for p in (w/'adapter/smali/kr/memorynotes').glob('*.smali'):shutil.copy2(p,package/p.name)
 import re
 editor=package/'NoteEditor.smali';text=editor.read_text()
 anchor='    invoke-static {v0}, Lkr/memorynotes/EditorLayout;->attach(Lkr/memorynotes/NoteEditor;)V'
 assert text.count(anchor)==1
 text=text.replace(anchor,anchor+'\n\n    invoke-static {v0}, Lkr/memorynotes/PdfStudy;->addEntry(Lkr/memorynotes/NoteEditor;)V');editor.write_text(text)
 main=package/'MainActivity.smali';text=main.read_text()
 anchor='    invoke-static {p0, p1}, Lkr/memorynotes/DetailLayout;->attach(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V'
 assert text.count(anchor)==1
 text=text.replace(anchor,anchor+'\n\n    invoke-static {p0, p1}, Lkr/memorynotes/PdfStudy;->addSource(Lkr/memorynotes/MainActivity;Lkr/memorynotes/Note;)V')
 def hook(signature,code):
  global text
  pattern=r'(\.method [^\n]*'+re.escape(signature)+r'\n\s+\.locals \d+\n)'
  text,count=re.subn(pattern,lambda m:m.group(1)+'\n'+code+'\n',text);assert count==1,signature
 hook('onActivityResult(IILandroid/content/Intent;)V','    invoke-static {p0, p1, p2, p3}, Lkr/memorynotes/PdfStudy;->result(Lkr/memorynotes/MainActivity;IILandroid/content/Intent;)Z\n    move-result v0\n    if-eqz v0, :pdf_result_continue\n    return-void\n    :pdf_result_continue')
 hook('onBackPressed()V','    invoke-static {p0}, Lkr/memorynotes/PdfStudy;->back(Lkr/memorynotes/MainActivity;)Z\n    move-result v0\n    if-eqz v0, :pdf_back_continue\n    return-void\n    :pdf_back_continue')
 hook('onPause()V','    invoke-static {p0}, Lkr/memorynotes/PdfStudy;->pause(Lkr/memorynotes/MainActivity;)V')
 hook('onDestroy()V','    invoke-static {p0}, Lkr/memorynotes/PdfStudy;->destroy(Lkr/memorynotes/MainActivity;)V')
 main.write_text(text)
 run('java','-jar',apktool,'b',w/'app','-o',w/'rebuilt.apk')
 run(sys.executable,HERE/'package.py',base,w/'rebuilt.apk',w/'unsigned.apk')
 run('java','-jar',signer,'sign','--ks',key,'--ks-key-alias','androiddebugkey','--ks-pass','env:MEMORYNOTE_SIGN_PASSWORD','--key-pass','env:MEMORYNOTE_SIGN_PASSWORD','--out',output,w/'unsigned.apk')
 run('java','-jar',signer,'verify','--verbose',output)
 generated=HERE/'smali/kr/memorynotes';generated.mkdir(parents=True,exist_ok=True)
 for p in list(generated.glob('Pdf*.smali'))+list(generated.glob('StudyPdfCanvas*.smali')):p.unlink()
 for p in (w/'adapter/smali/kr/memorynotes').glob('*.smali'):shutil.copy2(p,generated/p.name)
 shutil.copy2(editor,HERE/'NoteEditor.smali');shutil.copy2(main,HERE/'MainActivity.smali')
