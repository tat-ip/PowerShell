# Specify the distinguished name of the OU where your users are located, In this case, OU is Marketing

$ouPath = "OU=Marketing,DC=Adatum,DC=com"

# Get all disabled users within the specified OU
$disabledUsers = Get-ADUser -SearchBase $ouPath -Filter "Enabled -eq 'false'"

# Iterate through each disabled user
foreach ($user in $disabledUsers) {
    # Get the groups the user is a member of
    $groups = Get-ADPrincipalGroupMembership $user | Where-Object { $_.Name -notlike 'Domain Users' }

    # Remove the user from each group
    foreach ($group in $groups) {
        Remove-ADPrincipalGroupMembership -Identity $user -MemberOf $group -Confirm:$false
    }
}

Write-Host "Disabled users have been removed from all security groups."