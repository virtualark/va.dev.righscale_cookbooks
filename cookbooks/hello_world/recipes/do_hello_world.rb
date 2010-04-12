

# Print Hello World to a text file  c:\temp\hello_world.txt
powershell "Print Hello World to a text file  c:\temp\hello_world.txt" do


	#test_string = @node[:hello_world][:test_string]
	#parameters('MY_PARAMETER' => test_string)
  
	web_app_src_zips = @node[:web_iis][:deploy][:web_app_src_zips]
	parameters('MY_PARAMETER' => web_app_src_zips)
  
	# FIX: avoiding remote_file provider in windows until it is tested.
	source_file_path = File.expand_path(File.join(File.dirname(__FILE__), '.', 'do_hello_world.ps1'))
	source_path(source_file_path)
end
