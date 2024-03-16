 #Free up disk space on a computer hard drive
 # Get free disk space for all drives
 Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID, FreeSpace

 # Identify space-consuming files (greater than 1GB)
 Get-ChildItem -Path C: -File | Where-Object { $_.Length -gt 1GB }
 
 # Delete unnecessary files (adjust as needed)
 # For example, to delete all files older than 30 days:
 Get-ChildItem -Path C: -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force
 