
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
 