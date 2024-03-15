# Specify the remote computer name or IP address and establish a remote lesson

$computers=New-PSSession –ComputerName LON-DC1

# Get disk information for drive C:
$disk = Invoke-Command -Session $computers -ScriptBlock { Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" }

# Display the results
Write-Host "Disk Size $($disk.deviceID): $($disk.Size) bytes"
Write-Host "Free Space $($disk.deviceID): $($disk.FreeSpace) bytes"
