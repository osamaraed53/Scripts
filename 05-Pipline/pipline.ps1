
$serviceName = "Spooler"

Get-Service -Name $serviceName

Start-Service -Name $serviceName 

# Get-Help Stop-Service -Full

# (Get-Service -Name $serviceName).GetType()

Get-service -Name $serviceName  | Stop-Service

$serviceName | Get-service | Start-Service


##################################

$services = New-Object -TypeName System.Collections.ArrayList
$services.AddRange(@("spooler","w32time"))

$services | Get-Service | Stop-Service
$services | Get-Service | Start-Service

$services | Get-service | ForEach-Object{Write-Output "Service is : $($_.DisplayName) currently $($_.Status)"}

