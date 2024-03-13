# Requires Active Directory Module to be installed
Import-Module ActiveDirectory

# Get the current date and time
$currentDate = Get-Date

# Get the date and time 24 hours ago
$yesterday = $currentDate.AddDays(-1)

# Enumerate user accounts that expired within the last 24-hour period
Get-ADUser -Filter {accountExpirationDate -gt $yesterday -and accountExpirationDate -le $currentDate} -Properties accountExpirationDate | Select-Object Name, accountExpirationDate
