$computers=New-PSSession –ComputerName LON-SVR1
$Username = 'ADATUM\Administrator'
$Password = 'Pa55w.rd'
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Credentials = New-Object System.Management.Automation.PSCredential $Username, $SecurePassword

# Define the process name you want to stop and start; replace "notepad" with "process"
$ProcessName = 'notepad'


# List the process on LON_SVR1
Invoke-Command -ComputerName LON-SVR1 -Credential $Credentials -ScriptBlock {
    param($ProcessName)
    Get-Process $ProcessName
} -ArgumentList $ProcessName

# Stop the process on LON_SVR1
$ProcessName = 'notepad'
Invoke-Command -ComputerName LON-SVR1 -Credential $Credentials -ScriptBlock {
    param($ProcessName)
  Stop-Process -Name $ProcessName -Force
} -ArgumentList $ProcessName

# Start the process on LON_SVR1
 Invoke-Command -ComputerName LON-SVR1 -ScriptBlock { 
$command = "notepad.exe"
$process = [WMICLASS]"\\LON-SVR1\ROOT\CIMV2:win32_process"
$result = $process.Create($command)
} -ArgumentList $ProcessName
