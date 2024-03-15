# Restart a remote computer using Invoke-Command
$ComputerName = "LON-SVR1"
Invoke-Command -ComputerName $ComputerName -ScriptBlock {
    & rundll32.exe user.exe,ExitWindowsExec
}


Invoke-Command -ComputerName LON-SVR1 -ScriptBlock {
    & Restart-Computer -Force
    }