BACKUP DATABASE [db-name] TO  DISK = N'C:\path\to\folder\database-backup.bak' WITH NOFORMAT, NOINIT,  NAME = N'db-name - Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'db-name' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'db-name' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''db-name'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'C:\path\to\folder\database-backup.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
