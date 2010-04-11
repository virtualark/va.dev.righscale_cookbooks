# Cookbook Name:: db_sqlserver
# Recipe:: do_backup
#
# Copyright 2009, RightScale, Inc.
#
# All rights reserved - Do Not Redistribute

# Print Hello World to a text file  c:\temp\hello_world.txt
powershell "Print Hello World to a text file  c:\temp\hello_world.txt" do

  # FIX: avoiding remote_file provider in windows until it is tested.
  source_file_path = File.expand_path(File.join(File.dirname(__FILE__), '.', 'do_simple_app_deploy.ps1'))
  source_path(source_file_path)
end
