maintainer       "Virtual Ark"
maintainer_email "rnd@vitualark.com"
license          IO.read(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'LICENSE')))
description      "A set of test scripts trying RightLink"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

recipe "hello_world::do_hello_world", "Prints hellow world to a text file c:\temp\hello_world.txt and to the eventviewer"

attribute "hello_world/test_string",
  :display_name => "Passes sample string to hello world script",
  :description => "Passes sample string to hello world script",
  :default => "Hello World",
  :recipes => ["hello_world::do_hello_world"]