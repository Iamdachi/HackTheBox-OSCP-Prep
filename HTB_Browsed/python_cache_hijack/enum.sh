#! /bin/bash

larry@browsed:~$ ls -la

larry@browsed:/home$ ls
# git  larry

# User with shells
larry@browsed:/$ cat /etc/passwd | grep 'sh$'
#root:x:0:0:root:/root:/bin/bash
#larry:x:1000:1000:larry:/home/larry:/bin/bash
#git:x:110:110:Git Version Control,,,:/home/git:/bin/bash


larry@browsed:~$ sudo -l
# ... snip...
#User larry may run the following commands on browsed:
#    (root) NOPASSWD: /opt/extensiontool/extension_tool.py


larry@browsed:/opt/extensiontool$ ls -l
#total 16
#drwxrwxr-x 5 root root 4096 Mar 23  2025 extensions
#-rwxrwxr-x 1 root root 2739 Mar 27  2025 extension_tool.py
#-rw-rw-r-- 1 root root 1245 Mar 23  2025 extension_utils.py
#drwxrwxrwx 2 root root 4096 Dec 11 07:57 __pycache__


larry@browsed:/opt/extensiontool$ ls -la __pycache__/
#total 8
#drwxrwxrwx 2 root root 4096 Dec 11 07:57 .
#drwxr-xr-x 4 root root 4096 Dec 11 07:54 ..

#If I run sudo /opt/extensiontool/extension_tool.py, a .pyc file will be created in __pycache__:

larry@browsed:/opt/extensiontool$ ls -la __pycache__/
#total 12
#drwxrwxrwx 2 root root 4096 Mar 10 11:55 .
#drwxr-xr-x 4 root root 4096 Dec 11 07:54 ..
#-rw-r--r-- 1 root root 1880 Mar 10 11:55 extension_utils.cpython-312.pyc

# The most important thing to note about __pycache__ is that it’s world writable!


