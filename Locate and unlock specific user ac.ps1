# Look for all locked user and save in a CSV file

$path="E:\GitHubRepositories\PowerShell"

Search-ADAccount -LockedOut -UsersOnly -ResultPageSize 2000 -resultSetSize $null | Select-Object Name, SamAccountName, DistinguishedName | Export-CSV "$path\LockedOutUsers.CSV" -NoTypeInformation

Locate and unlock specific user

# Replace 'USERNAME' with the actual user account name
$userAccountName = "Arnaud"

# Locate the user account
$account = Get-ADUser -Filter {SamAccountName -eq $userAccountName} -Properties LockedOut

# Check if the account is found and locked
if ($account.LockedOut -eq $true) {
    # Unlock the user account
    Unlock-ADAccount -Identity $account
    Write-Host "The account has been unlocked."
} else {
    Write-Host "Account not found or not locked."
}
