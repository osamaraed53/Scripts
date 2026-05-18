@{
    RootModule        = 'configration.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890'
    Author            = 'Osama Raed'
    CompanyName       = 'Ascot'
    Copyright         = '(c) 2026 Osama Raed. All rights reserved.'
    Description       = 'Configuration module for reading and writing JSON-based settings.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-Configration', 'Set-Configration')
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @('gcfg', 'scfg')
    PrivateData       = @{
        PSData = @{
            Tags         = @('configuration', 'settings', 'json')
            ProjectUri   = ''
            ReleaseNotes = 'Initial release.'
        }
    }
}


# Why no $manifest = ?
# The filename tells PowerShell it's a manifest. The extension .psd1 = "PowerShell Data file". When PowerShell sees that extension, it knows:

# "This file contains one hashtable describing a module."