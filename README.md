
# SQL-Server-Daily-Database-Backup

This is just a simple script to take daily backup of an SQL Server Database. Made with the purpose of taking backups of databases that are running on SQL Express.

### ✔️ Prerequisites
 - System running Windows (tested on Windows 10 & Windows Server 2019)
 - [sqlcmd](https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility?view=sql-server-ver16) must be installed
 - Text editor
 - SQL Server details (instance name & database user credentials)
 - [7-zip](https://www.7-zip.org/) must be installed

### ⚙️ Process
 - Download a [copy of repository](https://github.com/smsheese/SQL-Server-Daily-Database-Backup/archive/refs/heads/main.zip) & extract to the backup folder path
 - Update the parameters in the following files with text editor
	 - backup-script.sql
		 - Replace `db-name` with the name of the database to be backed up
		 - Replace `C:\path\to\folder\` with the backup folder path
	- backup-script.bat
		- Replace `sql-server-instance` with the SQL Server [instance name](https://itsiti.com/how-to-find-sql-server-instance-name/)
		- Replace `username` with the database username that has [access](https://www.mytechmantra.com/sql-server/permissions-required-to-take-database-backup-in-sql-server/) to the database (commonly *sa* is used, but not recommended)
		- Replace `password` with the password for the database user above
		- Replace `C:\path\to\folder` with the backup folder path
- Schedule backup using Task Scheduler
	- Run *Task Scheduler* as Administrator
	- Create Basic Task (on right side of window)
	- Give a name for task (for eg. Daily database backup db-name); Next
	- Select how frequently you want the database to be backed up; Next
	- Set time for when you want the task to run; Next
	- Select *Start a program*; Next
	- For *Program/Script*, select the `backup-script.bat` file in the backup folder
	- For *Start in (optional)*, enter the backup folder path; Next
	- Confirm the details; check the box for `Open the properties dialog for this task when I click finish`; Finish
	- In *General > Security* options, select `Run whether user is logged on or not`
	- In Settings, check the box for `Run task as soon as possible after a scheduled task is missed`
	- In Settings, check the box for `Stop the task if it runs longer than:` and select `1 hour` (this depends on the database size); OK
<br>

Now, the database that you've selected will run as scheduled. Hope this helps you ✌️
