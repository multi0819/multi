"""Preserve aapt2 entry compression, especially the uncompressed resource table."""
import sys,zipfile
base,dex,output=sys.argv[1:]
with zipfile.ZipFile(base) as resources,zipfile.ZipFile(dex) as code,zipfile.ZipFile(output,'w') as out:
    for source in (resources,code):
        for entry in source.infolist():
            if not entry.filename.startswith('META-INF/'):
                out.writestr(entry,source.read(entry.filename))
