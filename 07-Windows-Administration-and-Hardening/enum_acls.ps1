Param([string]$directory = $PWD)
foreach ($item in $directory) {
   Get-ChildItem $directory -Recurse
   Get-Acl $item.Fullname
}