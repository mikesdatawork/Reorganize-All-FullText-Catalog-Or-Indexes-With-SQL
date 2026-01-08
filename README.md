![MIKES DATA WORK GIT REPO](https://raw.githubusercontent.com/mikesdatawork/images/master/git_mikes_data_work_banner_01.png "Mikes Data Work")        

# Reorganize All FullText Catalog Or Indexes With SQL
**Post Date: June 19, 2014**        



## Contents    
- [About Process](##About-Process)  
- [SQL Logic](#SQL-Logic)  
- [Author](#Author)  
- [License](#License)       

## About-Process

<p>Reorganize all the FullText Catalog or Index with this simple script.</p>      


## SQL-Logic
```SQL
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
```
Hope this is useful. 


[![WorksEveryTime](https://forthebadge.com/images/badges/60-percent-of-the-time-works-every-time.svg)](https://shitday.de/)

## Author

[![Gist](https://img.shields.io/badge/Gist-MikesDataWork-<COLOR>.svg)](https://gist.github.com/mikesdatawork)
[![Twitter](https://img.shields.io/badge/Twitter-MikesDataWork-<COLOR>.svg)](https://twitter.com/mikesdatawork)
[![Wordpress](https://img.shields.io/badge/Wordpress-MikesDataWork-<COLOR>.svg)](https://mikesdatawork.wordpress.com/)

    
## License
[![LicenseCCSA](https://img.shields.io/badge/License-CreativeCommonsSA-<COLOR>.svg)](https://creativecommons.org/share-your-work/licensing-types-examples/)

![Mikes Data Work](https://raw.githubusercontent.com/mikesdatawork/images/master/git_mikes_data_work_banner_02.png "Mikes Data Work")

