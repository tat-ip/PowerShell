# Create an OU named "UserAccounts" under the specified path, it may take few minutes for DC to be updated at AD Users and Computers
New-ADOrganizationalUnit -Name "UserAccounts" -Path "DC=Adatum,DC=COM"

# Optional: To create an OU that is not protected from accidental deletion
# New-ADOrganizationalUnit -Name "UserAccounts" -Path "DC=FABRIKAM,DC=COM" -ProtectedFromAccidentalDeletion $False

# To check the OU informaton
Get-ADOrganizationalUnit -Filter 'Name -eq "UserAccounts"'