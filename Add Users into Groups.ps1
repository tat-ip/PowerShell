# Define the group name and user accounts. 

#Create a group "Dancing" in Active Directory User and Computer
#Create a new user for "arhodes", "fparker", "mreyes"

$groupName = "Dancing"
$userAccounts = "arhodes", "fparker", "mreyes" # Replace with actual usernames

# Add each user to the specified group
foreach ($user in $userAccounts) {
    Add-ADGroupMember -Identity $groupName -Members $user
}
Write-Host "Added user $user to group $groupName"

# Verify the members in the group
Get-ADGroupMember -Identity $groupName | Format-Table