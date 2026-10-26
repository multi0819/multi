"""Build an update from a verified 1.8.8 base; dependencies and signing key stay outside git."""
from pathlib import Path
import os,shutil,subprocess,sys,tempfile,zipfile
HERE=Path(__file__).resolve().parent
base,apktool,r8,android,signer,key,output=map(lambda s:Path(s).resolve(),sys.argv[1:])
def run(*args):subprocess.run([str(a) for a in args],check=True)
with tempfile.TemporaryDirectory(prefix='memorynote-editor-') as name:
 w=Path(name);classes=w/'classes';classes.mkdir();dex=w/'dex';dex.mkdir()
 sources=list((HERE/'java').rglob('*.java'))+list((HERE/'stubs').rglob('*.java'))+list((HERE/'compiler-stubs').rglob('*.java'))
 run('javac','--release','8','-encoding','UTF-8','-cp',android,'-d',classes,*sources)
 packaged=list((classes/'kr/memorynotes').glob('EditorLayout*.class'))+[classes/'kr/memorynotes/EditorPalette.class']
 run('java','-cp',r8,'com.android.tools.r8.D8','--min-api','26','--lib',android,'--output',dex,*packaged)
 adapter=w/'adapter.apk'
 with zipfile.ZipFile(base) as src,zipfile.ZipFile(adapter,'w') as dst:
  for info in src.infolist():
   if not info.filename.startswith('META-INF/'):dst.writestr(info,(dex/'classes.dex').read_bytes() if info.filename=='classes.dex' else src.read(info.filename))
 run('java','-jar',apktool,'d','-r','-f',adapter,'-o',w/'adapter')
 run('java','-jar',apktool,'d','-r','-f',base,'-o',w/'app')
 package=w/'app/smali/kr/memorynotes'
 for p in (w/'adapter/smali/kr/memorynotes').glob('*.smali'):shutil.copy2(p,package/p.name)
 editor=package/'NoteEditor.smali';text=editor.read_text()
 anchor='    invoke-static {v0}, Lkr/memorynotes/CardEditorControls;->attach(Lkr/memorynotes/NoteEditor;)V'
 assert text.count(anchor)==1
 text=text.replace(anchor,anchor+'\n\n    invoke-static {v0}, Lkr/memorynotes/EditorLayout;->attach(Lkr/memorynotes/NoteEditor;)V');editor.write_text(text)
 run('java','-jar',apktool,'b',w/'app','-o',w/'rebuilt.apk')
 run(sys.executable,HERE/'package.py',base,w/'rebuilt.apk',w/'unsigned.apk')
 run('java','-jar',signer,'sign','--ks',key,'--ks-key-alias','androiddebugkey','--ks-pass','env:MEMORYNOTE_SIGN_PASSWORD','--key-pass','env:MEMORYNOTE_SIGN_PASSWORD','--out',output,w/'unsigned.apk')
 run('java','-jar',signer,'verify','--verbose',output)
 generated=HERE/'smali/kr/memorynotes';generated.mkdir(parents=True,exist_ok=True)
 for p in generated.glob('Editor*.smali'):p.unlink()
 for p in (w/'adapter/smali/kr/memorynotes').glob('*.smali'):shutil.copy2(p,generated/p.name)
 shutil.copy2(editor,HERE/'NoteEditor.smali')
