# Cookbook Name:: db_sqlserver
# Recipe:: do_backup
#
# Copyright 2009, RightScale, Inc.
#
# All rights reserved - Do Not Redistribute

# deploy web app zips to the wwwroot directory.
powershell "Deploy demo web app from cookbook-relative zipped source to wwwroot under IIS" do
  # FIX: avoiding remote_file provider in windows until it is tested.
  web_app_src_zips = File.expand_path(File.join(File.dirname(__FILE__), '..', 'files', 'default', 'i386'))
  chef_attribute = Chef::Node::Attribute.new(
                      {'WEB_APP_ZIP_DIR_PATH' => web_app_src_zips},
                      {},
                      {})
  parameters(chef_attribute)

  source_file_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'files', 'default', 'do_simple_app_deploy.ps1'))
  source(File::read(source_file_path))
end
