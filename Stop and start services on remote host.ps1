# Change these values to suit your needs:
$SvcName = 'Spooler'  # Specify the service name
$SvrName = 'LON-SVR1'  # Specify the remote computer name

# Initialize variables:
[string]$WaitForIt = ""
[string]$Verb = ""
[string]$Result = "FAILED"

$svc = Get-Service -ComputerName $SvrName -Name $SvcName
Write-Host "$SvcName on $SvrName is $($svc.Status)"

Switch ($svc.Status) {
    'Stopped' {
        Write-Host "Starting $SvcName..."
        $Verb = "start"
        $WaitForIt = 'Running'
        $svc.Start()
    }
    'Running' {
        Write-Host "Stopping $SvcName..."
        $Verb = "stop"
        $WaitForIt = 'Stopped'
        $svc.Stop()
    }
    Default {
        Write-Host "$SvcName is $($svc.Status). Taking no action."
    }
}

if ($WaitForIt -ne "") {
    Try {
        $svc.WaitForStatus($WaitForIt)
        $Result = "SUCCESS"
    } Catch {
        Write-Host "Error waiting for service status change: $_"
    }
}

Write-Host "Service operation result: $Result"
