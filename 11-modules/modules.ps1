

$($env:PSModulePath).Split(';')

Get-Module -ListAvailable
Import-Module -Name ScheduledTasks #will add modeule in current session
Get-Module -ListAvailable

Get-Command -Module ScheduledTasks

Get-ScheduledTask
Get-Module
Remove-Module ScheduledTasks ##will remove modeule in current session

Find-Module Microsoft.Graph

install-module Microsoft.Graph 

Install-Module -Name AzureAD

UnInstall-Module


Get-PSRepository

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Find-Module -Name AzureAD 


Test-NetConnection www.powershellgallery.com -Port 443


Find-Module -Name AzureAD -Repository PSGallery -Verbose


