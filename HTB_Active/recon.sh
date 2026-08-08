#! /bin/bash
nmap -sT -p- --min-rate 5000 -oA nmap/alltcp 10.10.10.100
nmap -sV -sC -p 53,88,135,139,389,445,464,593,636,3268,3269,5722,9389,47001,49152-49158,49169,49170,49179 --min-rate 5
nmap -sU -p- --min-rate 5000 -oA nmap/alludp 10.10.10.100

enum4linux -a 10.10.10.100
smbmap -H 10.10.10.100
smbclient //10.10.10.100/Replication -U ""%""
smbmap -H 10.10.10.100 -R 
smb: \active.htb\Policies\{31B2F340-016D-11D2-945F-00C04FB984F9}\MACHINE\Preferences\Groups\> ls

