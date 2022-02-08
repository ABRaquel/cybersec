Param([string]$directory = $PWD)
foreach ($file in $directory) {
   Get-ChildItem $directory -Recurse
   Get-Acl $file | ForEach-Object { $_.Access } | Format-Table -Wrap
}
