$script:ConfigPath = "$PSScriptRoot\settings.json"

function Get-Configration {
    [CmdletBinding()]
    param (
        [string]$Key
    )

    if (-not (Test-Path $script:ConfigPath)) {
        Write-Warning "No configuration file found at $script:ConfigPath"
        return
    }

    $config = Get-Content $script:ConfigPath -Raw | ConvertFrom-Json

    if ($Key) {
        return $config.$Key
    }

    return $config
}


function Set-Configration {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Key,

        [Parameter(Mandatory)]
        [string]$Value
    )

    if (Test-Path $script:ConfigPath) {
        $config = Get-Content $script:ConfigPath -Raw | ConvertFrom-Json
    } else {
        $config = [PSCustomObject]@{}
    }

    $config | Add-Member -NotePropertyName $Key -NotePropertyValue $Value -Force

    $config | ConvertTo-Json | Set-Content $script:ConfigPath

    Write-Output "Saved: $Key = $Value"
}
