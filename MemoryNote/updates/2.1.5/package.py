"""Overlay rebuilt dex on authoritative 2.0.0 APK, preserve resources and align stored entries."""
import struct,sys,zipfile
base,rebuilt,output=sys.argv[1:]
with zipfile.ZipFile(base) as src,zipfile.ZipFile(rebuilt) as code,zipfile.ZipFile(output,'w') as dst:
 for info in src.infolist():
  if info.filename.startswith('META-INF/'):continue
  b=src.read(info.filename)
  if info.filename=='classes.dex':b=code.read('classes.dex')
  if info.filename=='AndroidManifest.xml':
   b=bytearray(b);off=8;ids=[];changed=False
   while off<len(b):
    typ,head,size=struct.unpack_from('<HHI',b,off)
    if typ==0x180:ids=list(struct.unpack_from('<'+'I'*((size-head)//4),b,off+head))
    if typ==0x102:
     start,stride,count=struct.unpack_from('<HHH',b,off+24)
     for i in range(count):
      pos=off+16+start+i*stride;name=struct.unpack_from('<I',b,pos+4)[0]
      if name<len(ids) and ids[name]==0x0101021b:
       assert struct.unpack_from('<I',b,pos+16)[0]==48
       struct.pack_into('<I',b,pos+16,49);changed=True
    off+=size
   assert changed
   old='2.1.4'.encode('utf-16le');new='2.1.5'.encode('utf-16le')
   assert b.count(old)==1;b=b.replace(old,new)
  info.extra=b''
  if info.compress_type==zipfile.ZIP_STORED:
   pad=(-(dst.fp.tell()+30+len(info.filename.encode('utf-8'))))%4
   if pad:info.extra=struct.pack('<HH',0xd935,pad)+bytes(pad)
  dst.writestr(info,b)
