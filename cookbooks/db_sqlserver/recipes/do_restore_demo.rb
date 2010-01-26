# Cookbook Name:: db_sqlserver
# Recipe:: do_restore_master
#
# Copyright 2009, RightScale, Inc.
#
# All rights reserved - Do Not Redistribute

# do the restore.
# TODO: currently no distinction between master or slave
# TODO: currently reliant on local volumes, no support for buckets.
powershell "Restore the demo database from a cookbook-relative directory" do
  server_name = @node[:db_sqlserver][:server_name]

  # FIX: avoiding remote_file provider in windows until it is tested.
  database_restore_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'files', 'default', 'i386'))
  chef_attribute = Chef::Node::Attribute.new(
                      {'SQL_BACKUP_DIR_PATH' => database_restore_dir,
                       'SQL_SERVER_NAME' => server_name},
                      {},
                      {})
  parameters(chef_attribute)

  source_file_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'files', 'default', 'do_restore_master.ps1'))
  source(File::read(source_file_path))
end
