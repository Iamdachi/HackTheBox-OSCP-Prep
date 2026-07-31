!# /bin/bash

# use process substitution and <() format
uv run werkzeug_to_hashcat.py <( echo 'pbkdf2:sha256:600000$AMtzteQIG7yAbZIa$0673ad90a0b4afb19d662336f0fce3a9edd0b7b19193717be28ce4d66c887133' ) | tee admin.hash

hashcat admin.hash /opt/SecLists/Passwords/Leaked-Databases/rockyou.txt

