
# $filePath = "10-errorhandlin"
# $files = Get-ChildItem -Path $filePath

# $files.foreach({
#         Write-Output $_.Name
#     })

# Write-Output "this after error messages"


try {
    $filePath = "10-errorhandlin"
    $files = Get-ChildItem -Path $filePath -ErrorAction Stop
     #Continue is defult 

    $files.foreach({
            Write-Output $_.Name
        })

    Write-Output "this after error messages"
}
catch {
    Write-Output "Caught Error $_.Exception.Message"
}

$ErrorActionPreference = "Stop" # is a global variable that controls how PowerShell handles non-terminating errors for the entire session or script by default is continue . 

try {
    $filePath = "10-errorhandling"
    $files = Get-ChildItem -Path $filePath 
     #Continue is defult 

    $files.foreach({
            Write-Output $_.Name
        })

    Write-Output "this after error messages"
}
catch {
    Write-Output "Caught Error $_.Exception.Message"
}
finally{
    Write-Output "This always run not matter what!"
}

