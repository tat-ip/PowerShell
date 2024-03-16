Create a network Share 
# Define variables
$ShareName = "ADATUM_Share"  # Change this to your desired share name
$FolderPath = "E:\"  # Change this to the actual folder path
$Description = "Shared folder for ADATUM Domain users"

# Create the share
New-SmbShare -Name $ShareName -Path $FolderPath -Description $Description -FullAccess "ADATUM\Domain Users"

# Set share permissions (optional)
$Acl = Get-Acl -Path $FolderPath
$Rule = New-Object System.Security.AccessControl.FileSystemAccessRule("ADATUM\Domain Users", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$Acl.SetAccessRule($Rule)
Set-Acl -Path $FolderPath -AclObject $Acl

# Display success message
Write-Host "Network share '$ShareName' created successfully."
