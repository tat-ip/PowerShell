# Fetch all user accounts with an employeeID
$employeeAccounts = Get-ADUser -Filter 'employeeID -like "*"' -Properties employeeID

# Group them by the value of the employeeID attribute, keeping any group with more than 1 account
$accountsByEmployeeID = $employeeAccounts | Group-Object employeeID | Where-Object { $_.Count -gt 1 }

# Display the duplicate accounts
foreach ($ID in $accountsByEmployeeID) {
    Write-Host "Duplicate accounts with employeeID $($ID.Name):"
    $ID.Group | Select-Object Enabled, ObjectClass, Name, UserPrincipalName, SamAccountName, employeeID
}

# Export the results to a CSV file
$accountsByEmployeeID | Select-Object -ExpandProperty Group | Export-Csv $path\employeeId_is_duplicate.csv