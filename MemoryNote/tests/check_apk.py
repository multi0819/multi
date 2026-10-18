import struct,sys,zipfile
path=sys.argv[1]
with zipfile.ZipFile(path) as z:
    info=z.getinfo('resources.arsc')
    assert info.compress_type==zipfile.ZIP_STORED, 'resources.arsc must be uncompressed for Android 11+'
    with open(path,'rb') as f:
        f.seek(info.header_offset)
        header=f.read(30)
        name_len,extra_len=struct.unpack_from('<HH',header,26)
        offset=info.header_offset+30+name_len+extra_len
    assert offset%4==0, f'resources.arsc is not 4-byte aligned: {offset}'
    assert z.testzip() is None, 'ZIP checksum failure'
    assert 'classes.dex' in z.namelist()
print('PASS: APK resource compression, alignment, checksums and DEX presence')
