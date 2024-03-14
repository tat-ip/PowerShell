# Specify the inactivity range value (in days)
$DaysInactive = 30

# Convert $DaysInactive to LastLogonTimeStamp property format
$time = (Get-Date).AddDays(-$DaysInactive)

# Identify inactive computer accounts
$inactiveComputers = # Get computers that haven't logged on in the last 30 days
Get-ADComputer -Filter * -Properties LastLogonDate |
    Where-Object { $_.LastLogonDate -lt (Get-Date).AddDays(-30) }


# Export the list of stale computer accounts to a CSV file
$inactiveComputers | Export-CSV "C:\Temp\StaleComps.CSV" -NoTypeInformation

# Display the results
$inactiveComputers | Format-Table -AutoSize

