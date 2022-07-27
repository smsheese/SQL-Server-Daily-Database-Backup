set mydate=%date:~10,4%%date:~4,2%%date:~7,2%
sqlcmd -S sql-server-instance -U username -P password -i backup-script.sql
"C:\Program Files\7-Zip\7z.exe" a -tzip "C:\path\to\folder\db-backup-%mydate%.zip" "C:\path\to\folder\database-backup.bak"
del "C:\path\to\folder\database-backup.bak"