#Disable user accounts that have that have not been used to logon with in 30 or more days

# Define the time limit (30 days)
$timeLimit = (Get-Date).AddDays(-30)

# Search for user accounts that have not logged on within the time limit
$usersToDisable = Get-ADUser -Filter {LastLogonTimeStamp -lt $timeLimit -and Enabled -eq $true} -Properties LastLogonTimeStamp

# Disable each account
foreach ($user in $usersToDisable) {
    # Output the name and last logon timestamp of the user being disabled
    Write-Output "Disabling user: $($user.SamAccountName) - Last Logon: $($user.LastLogonTimeStamp)"
    
    # Disable the user account
    Disable-ADAccount -Identity $user.DistinguishedName
}

# Output the total number of disabled accounts
Write-Output "Total disabled accounts: $($usersToDisable.Count)"
