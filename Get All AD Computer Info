#Get all AD computers' name, OS, OS version and ip4Address output to CSV file and display in the screen

Get-ADComputer -Filter * -Property * | Select-Object Name, OperatingSystem, OperatingSystemVersion, ipv4Address
Get-ADComputer -Filter * -Property * | Select-Object Name, OperatingSystem, OperatingSystemVersion, ipv4Address | Export-Csv -Path "$path\computers.csv" -NoTypeInformation