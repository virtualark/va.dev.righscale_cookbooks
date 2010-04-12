new-item c:\temp -force -type directory
set-content c:\temp\hello_world.txt -value (Date).ToLongDateString()
add-content c:\temp\hello_world.txt -value (Date).ToLongTimeString()

$PARAMETER = $env:MY_PARAMETER
#if ("$PARAMETER" -eq "")
#{
    #Write-Error "PARAMETER environment variable was not set"
    #exit 100
#}

add-content c:\temp\hello_world.txt -value  "my parameter $env:MY_PARAMETER "
Write-EventLog -LogName System  -EntryType Information -Source EventLog -EventId 6009 -Message "*************** Hello World from Chef Cook Book ****************"