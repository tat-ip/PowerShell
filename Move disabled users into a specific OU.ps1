#Open Active Directory Users and Computers, create a "Disabled" OU under Adatum.com

# Define the target domain and Disabled OU distinguished name
$targetDomain = "ADATUM"
$disabledOUDN = "OU=Disabled,DC=ADATUM,DC=com"

# Get all disabled user accounts in the target domain
$disabledUsers = Get-ADUser -Filter 'Enabled -eq $false' -SearchBase "DC=$targetDomain,DC=com"

# Move each disabled user to the Disabled OU
foreach ($user in $disabledUsers) {
    # Move the user to the Disabled OU
    Move-ADObject -Identity $user.DistinguishedName -TargetPath $disabledOUDN
    Write-Host "Moved user $($user.SamAccountName) to the Disabled OU."
}

Write-Host "All disabled users have been moved to the Disabled OU."