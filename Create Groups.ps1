# Create an Active Directory group
New-ADGroup -Name "MyNewGroup" `
            -SamAccountName "MyNewGroup" `
            -GroupScope Global `
            -GroupCategory Security `
            -Description "This group is for XYZ purposes" `
            -Path "OU=Marketing,DC=ADATUM,DC=com"


#To check the group

Get-ADGroup -Filter {Name -eq "MyNewGroup"}

Get-ADGroup -Identity "MyNewGroup" -Properties Description, ManagedBy
