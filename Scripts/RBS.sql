use [IntraLew_Content2]
if not exists 
(select * from sys.symmetric_keys 
where name = N'##MS_DatabaseMasterKey##')
create master key encryption by password = N'Admin Key Password !2#4'



if not exists 
(select groupname from sysfilegroups 
where groupname=N'RBSFilestreamProvider')
alter database [IntraLew_Content2]
add filegroup RBSFilestreamProvider contains filestream


alter database [IntraLew_Content2]
 add file (name = RBSFilestreamFile, filename = 
'c:\Blobstorage') 
to filegroup RBSFilestreamProvider

