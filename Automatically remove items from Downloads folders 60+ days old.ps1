# Specify the path to your Downloads folder
$username="$env:UserName.$env:UserDomain"
$Folder = "C:\Users\$username\Downloads"

# Delete files older than 60 days
Get-ChildItem $Folder -Recurse -Force -ea 0 | ? {!$_.PsIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-60)} | ForEach-Object {
    $_ | Remove-Item -Force
}

# Delete empty folders and subfolders
Get-ChildItem $Folder -Recurse -Force -ea 0 | ? {$_.PsIsContainer -eq $True} | ? {$_.GetFiles().Count -eq 0} | ForEach-Object {
    $_ | Remove-Item -Force
}