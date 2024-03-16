# Retrieve a list of printers installed on the local computer
$printers = Get-Printer

# Display printer information
$printers | Format-Table -Property Name, ComputerName, Type, DriverName, Shared, Published
