Import-Module "$PSScriptRoot\configration" -Force

Set-Configration -Key 'Theme' -Value 'Dark'
Set-Configration -Key 'Language' -Value 'English'

Write-Output "`nAll settings:"
Get-Configration

Write-Output "`nJust the Theme:"
Get-Configration -Key 'Theme'
