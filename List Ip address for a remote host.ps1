#List Ip address for a remote host
# Get IP address details for a remote computer using CIM
$remoteComputer = "LON-SVR1"
$ipDetails = Get-CimInstance -ComputerName $remoteComputer -ClassName Win32_NetworkAdapterConfiguration | Select-Object -Property IPAddress, PSComputerName

# Display the IP address and the remote computer name
$ipDetails
