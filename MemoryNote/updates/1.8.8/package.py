import zipfile,struct
with zipfile.ZipFile('base.apk') as z,zipfile.ZipFile('unsigned.apk','w') as out:
 for info in z.infolist():
  if info.filename.startswith('META-INF/'):continue
  b=z.read(info.filename)
  if info.filename=='classes.dex':b=open('classes.dex','rb').read()
  if info.filename=='AndroidManifest.xml':
   b=bytearray(b);off=8;ids=[];changed=False
   while off<len(b):
    typ,head,size=struct.unpack_from('<HHI',b,off)
    if typ==0x180:ids=list(struct.unpack_from('<'+'I'*((size-head)//4),b,off+head))
    if typ==0x102:
     a,s,n=struct.unpack_from('<HHH',b,off+24)
     for i in range(n):
      pos=off+16+a+i*s;name=struct.unpack_from('<I',b,pos+4)[0]
      if name<len(ids) and ids[name]==0x0101021b:struct.pack_into('<I',b,pos+16,28);changed=True
    off+=size
   assert changed
   assert b.count('1.8.4'.encode('utf-16le'))==1
   b=b.replace('1.8.4'.encode('utf-16le'),'1.8.8'.encode('utf-16le'))
  out.writestr(info,b)
