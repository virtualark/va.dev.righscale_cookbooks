maintainer       "RightScale, Inc."
maintainer_email "support@rightscale.com"
license          IO.read(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'LICENSE')))
description      "Manages IIS"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.2"

recipe "web_iis::default", "Not yet implemented"
recipe "web_iis::do_simple_app_deploy", "Deploys all web app from zipped source to wwwroot under IIS"
recipe "web_iis::update_page", "Update page content and title"

# general
attribute "web_iis",
  :display_name => "General IIS web server options",
  :type => "hash"

# deploy
attribute "web_iis/deploy",
  :display_name => "IIS web server deployment options",
  :type => "hash"

attribute "web_iis/deploy/web_app_src_zips",
  :display_name => "Web App Source Zips Directory",
  :description => "The path to the directory containing one or more web application source .zip file(s).",
  :default => "d:\\datastore\\aspdotnet\\webapps"

# update
attribute "web_iis/page_title",
  :display_name => "Page Title",
  :description => "Page title",
  :default => "Page Title"
  
attribute "web_iis/page_content",
  :display_name => "Page Content",
  :description => "Page content",
  :default => "Page Content"
