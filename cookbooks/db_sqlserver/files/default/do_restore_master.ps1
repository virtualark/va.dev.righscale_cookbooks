# Restores all databases from a backup directory.
#
# Copyright 2009, RightScale, Inc.
#
# All rights reserved - Do Not Redistribute

# check inputs
$backupDirPath = $env:SQL_BACKUP_DIR_PATH
if ("$backupDirPath" -eq "")
{
    Write-Error "The SQL_BACKUP_DIR_PATH environment variable was not set"
    exit 1
}
$serverName = $env:SQL_SERVER_NAME
if ("$serverName" -eq "")
{
    Write-Error "The SQL_SERVER_NAME environment variable was not set"
    exit 1
}

# require existing backup directory.
$backupDir     = Get-Item $backupDirPath -ea Stop
$backupDirPath = $backupDir.FullName
Write-Verbose "Using backup directory ""$backupDirPath"""

# load SQL Server assemblies
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoExtended") | Out-Null
[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.ConnectionInfo") | Out-Null
[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoEnum") | Out-Null

# connect to server.
$server = New-Object ("Microsoft.SqlServer.Management.Smo.Server") $serverName

# iterate backup files restoring each.
# note that there is no checking for redundant .bak files restoring the same
# database multiple times, so use .old for older backups to avoid this.
foreach ($backupFile in $backupDir.GetFiles("*.bak"))
{
    $backupFilePath = $backupFile.FullName
    $backupDevice   = New-Object ("Microsoft.SqlServer.Management.Smo.BackupDeviceItem") ($backupFilePath, "File")
    $restore        = New-Object("Microsoft.SqlServer.Management.Smo.Restore")

    $restore.Devices.Add($backupDevice)
    $restore.NoRecovery      = $false
    $restore.ReplaceDatabase = $true

    $Error.Clear()
    $backupHeader = $restore.ReadBackupHeader($server)
    if ($Error.Count -ne 0)
    {
        Write-Error "Failed to read backup header from ""$backupFilePath"""
        Write-Warning "SQL Server fails to backup/restore to/from network drives but will accept the equivalent UNC path so long as the database user has sufficient network privileges. Ensure that the SQL_BACKUP_DIR_PATH environment variable does not refer to a shared drive."
        exit 2
    }

    $dbName = $backupHeader.Rows[0]["DatabaseName"]
    $restore.Database = $dbName

    # restore.
    $restore.SqlRestore($server)
    if ($Error.Count -eq 0)
    {
        "Restored database named ""$dbName"" to ""$backupFilePath"""
    }
    else
    {
        Write-Error "Failed to restore database named ""$dbName"" to ""$backupFilePath"""
        exit 3
    }
}
