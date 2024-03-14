# Set the desired operating system name
$targetOS = "Windows server"

# Get all computers from Active Directory
$computers = Get-ADComputer -Filter * -Properties OperatingSystem

# Filter computers with the specified operating system
$filteredComputers = $computers | Where-Object { $_.OperatingSystem -like "*$targetOS*" }

# Display the list of computers
$filteredComputers | Select-Object Name, OperatingSystem | Format-Table -AutoSize
