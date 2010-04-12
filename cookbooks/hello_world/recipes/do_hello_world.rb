

# Print Hello World to a text file  c:\temp\hello_world.txt
powershell "Print Hello World to a text file  c:\temp\hello_world.txt" do

	chef_attribute = Chef::Node::Attribute.new(
                      {'MY_PARAMETER' => "Sample parameter passed using chef attributes",
                      {},
                      {})
	parameters(chef_attribute)
	# FIX: avoiding remote_file provider in windows until it is tested.
	source_file_path = File.expand_path(File.join(File.dirname(__FILE__), '.', 'do_hello_world.ps1'))
	source_path(source_file_path)
end
