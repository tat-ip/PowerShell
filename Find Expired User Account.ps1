# PowerShell script to enumerate expired user accounts

# Run the following PowerShell command to get a list of expired user accounts
# Note: You need to have appropriate permissions to query user accounts.

# Get a list of expired user accounts

$Cutoff = Read-Host -Prompt "Enter expiration Cutoff Date"

#Get-AdUser -Filter * -Properties Enabled,AccountExpirationDate,accountExpires | Where {$PSItem.Enabled -eq $true -and $PSItem.AccountExpirationDate -lt $Cutoff} | Select-Object Name, SamAccountName, AccountExpirationDate

Get-ADUser -Filter {Enabled -eq $true -and  AccountExpirationDate  -lt $Cutoff} -Properties AccountExpirationDate  | Select-Object Name, SamAccountName, AccountExpirationDate

# Explanation:
# - Get-ADUser: Cmdlet to retrieve Active Directory user accounts
# - Filter: Filters the user accounts based on the specified conditions
#   - Enabled -eq $true: Only enabled user accounts
#   - AccountExpirationDate -lt (Get-Date): Accounts with expiration date less than the current date
# - Select-Object: Selects specific properties (Name, SamAccountName, AccountExpirationDate) for display

# Note: Replace the filter conditions as needed for your specific environment.

#Challenge: Create a script to find all users have never logged on into the system.
