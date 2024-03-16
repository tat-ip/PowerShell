try {
    $adapters = Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IpEnabled -eq $true -and $_.DhcpEnabled -eq $true } -ErrorAction Stop

    if (!$adapters) {
        Write-Output "DHCP is not enabled on this system."
        Exit
    }

    foreach ($adapter in $adapters) {
        Write-Output "Renewing IP address for adapter $($adapter.Description)"
        $adapter.RenewDHCPLease() | Out-Null
        if ($?) {
            Write-Output "IP address has been renewed for adapter $($adapter.Description)"
        } else {
            Write-Error "IP address could not be renewed for adapter $($adapter.Description)"
        }
    }
} catch {
    Write-Error $_.Exception.Message
}
