$script:ConfigPath = "$PSScriptRoot\settings.json"

function Get-Configration {
    <#
    .SYNOPSIS
        Reads a value (or the whole object) from the module's JSON settings file.

    .DESCRIPTION
        Loads settings.json from the module folder and returns either the entire
        configuration object or the value of a single key when -Key is supplied.
        Warns and returns nothing when the settings file does not exist yet.

    .PARAMETER Key
        The name of a single configuration property to return. When omitted, the
        entire configuration object is returned.

    .EXAMPLE
        Get-Configration

        Returns the full configuration object from settings.json.

    .EXAMPLE
        Get-Configration -Key 'ApiUrl'

        Returns just the value stored under the 'ApiUrl' key.

    .EXAMPLE
        gcfg ApiUrl

        Same as above using the short alias.

    .OUTPUTS
        System.Management.Automation.PSCustomObject or the value type of the
        requested key.

    .NOTES
        Author : Osama Raed
        Module : configration
    #>
    [CmdletBinding()]
    [Alias('gcfg')]
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
    <#
    .SYNOPSIS
        Writes (or updates) a key/value pair in the module's JSON settings file.

    .DESCRIPTION
        Adds the supplied key with its value to settings.json, creating the file
        if it does not exist and overwriting the value when the key is already
        present. The resulting object is serialized back to JSON on disk.

    .PARAMETER Key
        The name of the configuration property to set. Mandatory.

    .PARAMETER Value
        The value to store under the given key. Mandatory.

    .EXAMPLE
        Set-Configration -Key 'ApiUrl' -Value 'https://api.example.com'

        Saves the ApiUrl property to settings.json.

    .EXAMPLE
        scfg ApiUrl 'https://api.example.com'

        Same as above using the short alias and positional parameters.

    .OUTPUTS
        System.String — a confirmation line of the form "Saved: <Key> = <Value>".

    .NOTES
        Author : Osama Raed
        Module : configration
    #>
    [CmdletBinding()]
    [Alias('scfg')]
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
