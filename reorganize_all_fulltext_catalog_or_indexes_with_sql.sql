use master;
set nocount on
declare @reorganize_all_fti varchar(max)
set @reorganize_all_fti = ''
select @reorganize_all_fti = @reorganize_all_fti + 'use [' + name + ']' + char(10) +
'declare @get_ftc_name varchar(4000)' + char(10) +
'set @get_ftc_name = ''''' + char(10) +
'select @get_ftc_name = @get_ftc_name +
''alter fulltext catalog '' + name + '' reorganize;'' + char(10) from sys.fulltext_catalogs' + char(10) + 'exec (@get_ftc_name);' + char(10) +
'go' + char(10)
from sys.databases where name not in ('master', 'model', 'msdb', 'tempdb') and state_desc = 'online' order by name asc
 
exec (@reorganize_all_fti)
