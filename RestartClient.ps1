
#Restarts Client workstations ProductType -EQ 1

$computerlist = Get-Adcomputer -Filter *   | Select-Object -ExpandProperty Name

Foreach($computer in $computerlist){
$os = Get-CimInstance -ComputerName $computer -ClassName Win32_OperatingSystem  
$properties = @{'Computername' = $computer;
                'ProductType' = $os.ProductType
                }
    $obj = New-Object -TypeName PSobject -Property $properties
    Write-Output $obj | Where-Object ProductType -EQ 1 | Restart-Computer -Force
    }
 
    # Create task in Schedule, In Action Pane, input powershell.exe -executionpolicy bypass c:\scripts\restartclient.ps1

    #In General Pane, Check with highest privileges
    #Trigger Pane, add a daily task on 12:00 AM

    # Need to exclude the workstation from rebooting OR run the schedule at DC or server.