#Retrieve network Adapter properties for remote computers
# Define the list of remote computer names (you can read these from a file)
$ComputerNames = "LON-SVR1"

# Initialize an empty collection to store results
$Results = @()

# Iterate through each computer name
foreach ($ComputerName in $ComputerNames) {
    try {
        # Get network adapter information for the specified computer
        $Adapters = Get-NetAdapter -CimSession $ComputerName

        # Process each network adapter
        foreach ($Adapter in $Adapters) {
            # Extract relevant properties (you can add more as needed)
            $AdapterInfo = @{
                ComputerName = $ComputerName
                InterfaceDescription = $Adapter.InterfaceDescription
                MacAddress = $Adapter.MacAddress
                Status = $Adapter.Status
                SpeedMbps = $Adapter.LinkSpeed
            }

            # Add the adapter info to the results collection
            $Results += New-Object PSObject -Property $AdapterInfo
        }
    } catch {
        Write-Host "Error retrieving network adapter info for $ComputerName"
    }
}

# Output the results to a CSV file
$Results | Export-Csv -Path "E:\OutputFile.csv" -NoTypeInformation

# Display a summary
Write-Host "Network adapter information retrieved and saved to OutputFile.csv."
