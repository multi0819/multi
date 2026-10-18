"""Regression guard for Activity lifecycle and packaged playback service contract."""
from pathlib import Path
import subprocess,xml.etree.ElementTree as ET
root=Path(__file__).resolve().parents[1]
a=(root/'app/src/main/java/kr/memorynotes/MainActivity.java').read_text()
pause=a.split('protected void onPause(){',1)[1].split('\n',1)[0]
assert 'speech.close' not in pause, 'Backgrounding must not stop reading'
assert 'speech.detach()' in a, 'Destroying UI must release its observer'
manifest=ET.parse(root/'app/src/main/AndroidManifest.xml').getroot()
ns='{http://schemas.android.com/apk/res/android}'
perms={p.attrib[ns+'name'] for p in manifest.findall('uses-permission')}
assert {'android.permission.FOREGROUND_SERVICE','android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK','android.permission.WAKE_LOCK'} <= perms
service=manifest.find("application/service")
assert service.attrib[ns+'foregroundServiceType']=='mediaPlayback'
assert service.attrib[ns+'exported']=='false'
print('PASS background reading lifecycle and manifest regression guards')
