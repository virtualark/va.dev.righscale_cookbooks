maintainer       "RightScale, Inc."
maintainer_email "support@rightscale.com"
license          IO.read(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'LICENSE')))
description      "Manages a SQL Server instance"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.3"

recipe "db_sqlserver::default", "Not yet implemented"
recipe "db_sqlserver::do_backup", "Backs up all non-system SQL Server databases to a backup directory."
recipe "db_sqlserver::do_restore_master", "Restore all databases from a backup directory."

# general
attribute "db_sqlserver",
  :display_name => "General SQL Server database options",
  :type => "hash"

attribute "db_sqlserver/server_name",
  :display_name => "SQL Server instance network name",
  :description => "The network name of the SQL Server instance used by recipes.",
  :default => "localhost\\SQLEXPRESS"

# backup
attribute "db_sqlserver/backup",
  :display_name => "SQL Server database backup options",
  :type => "hash"

attribute "db_sqlserver/backup/database_backup_dir",
  :display_name => "SQL Server backup .bak directory",
  :description => "The local drive path or UNC path to the directory which will contain new SQL Server database backup (.bak) files. Note that network drives are not supported by SQL Server.",
  :default => "d:\\datastore\\sqlserver\\databases"

# restore
attribute "db_sqlserver/restore",
  :display_name => "SQL Server database restore options",
  :type => "hash"

attribute "db_sqlserver/restore/database_restore_dir",
  :display_name => "SQL Server restore .bak directory",
  :description => "The local drive path or UNC path to the directory containing existing SQL Server database backup (.bak) files to be restored. Note that network drives are not supported by SQL Server.",
  :default => "d:\\datastore\\sqlserver\\databases"
