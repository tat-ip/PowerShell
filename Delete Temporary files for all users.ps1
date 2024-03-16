# Delete Temporary files for all users,

function Get-Tree ($Path,$Include='*') {
    @(Get-ChildItem $Path -Recurse -Include $Include) | Sort-Object pspath -Descending -Unique
}

function Remove-Tree ($Path,$Include='*') {
    Get-Tree $Path $Include | Remove-Item -Force -Recurse
}