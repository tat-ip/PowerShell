#Retrieve all locked accounts and save in a CSV file
$path="E:\GitHubRepositories\PowerShell"

Search-ADAccount -LockedOut -UsersOnly -ResultPageSize 2000 -resultSetSize $null | Select-Object Name, SamAccountName, DistinguishedName | Export-CSV "$path\LockedOutUsers.CSV" -NoTypeInformation


#Retrieve all locked accounts and output to screen

Search-ADAccount -LockedOut -UsersOnly -ResultPageSize 2000 -resultSetSize $null | Select-Object Name, SamAccountName, DistinguishedName | Export-CSV "$path\LockedOutUsers.CSV" -NoTypeInformation
