import base64
import codecs
import re
import sys

"""
Captured hash:
    pbkdf2:sha256:600000$AMtzteQIG7yAbZIa$0673ad90a0b4afb19d662336f0fce3a9edd0b7b19193717be28ce4d66c887133

Hashes can be given in different formats and HashCat expects them as given here:
    https://hashcat.net/wiki/doku.php?id=example_hashes

The one we got is mode 10900, PBKDF2-HMAC-SHA256.
HashCat expects it like this:
    sha256:1000:MTc3MTA0MTQwMjQxNzY=:PYjCU215Mi57AYPKva9j7mvF4Rc5bCnt
which is a format
    <HMAC>:<iterations>:<salt base64>:<hash base64>
"""

if len(sys.argv) != 2:
    print(f'usage: {sys.argv[0]} <werkzeug hash file>')
    print('Input file has Werkzeug hashes one per line')
    sys.exit(1)

with open(sys.argv[1], 'r') as f:
    hashes = f.readlines()

for h in hashes:
    m = re.match(r'pbkdf2:sha256:(\d*)\$([^\$]*)\$(.*)', h)
    iterations =  m.group(1)
    salt = m.group(2)
    hashe = m.group(3)
    # encode() / decode() is between byte <-> string conversion
    print(f"sha256:{iterations}:{base64.b64encode(salt.encode()).decode()}:{base64.b64encode(codecs.decode(hashe,'hex')).decode()}")

