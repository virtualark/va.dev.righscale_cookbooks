new-item c:\temp -force -type directory
set-content c:\temp\hello_world.txt -value (Date).ToLongDateString()
add-content c:\temp\hello_world.txt -value (Date).ToLongTimeString()
add-conetnt c:\temp\hello_world.txt -value  $env:MY_PARAMETER 
Write-EventLog -LogName System  -EntryType Information -Source EventLog -EventId 6009 -Message "*************** Hello World from Chef Cook Book ****************"