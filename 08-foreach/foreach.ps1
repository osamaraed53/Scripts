$filePath = "08-foreach\Data.txt"

$folderPath = ".\08-foreach\Share"


$folderNames = Get-Content -Path $filePath


foreach($name in $folderNames){
    if ((Test-Path -Path "$folderPath\$name") -eq $false){
        New-item -Path $folderPath -Name $name -ItemType Directory
    }else {
        Write-Output "Folder exist"
    }

}

$folderNames | ForEach-Object -Process {
    if ((Test-Path -Path "$folderPath\$_") -eq $false){
        New-item -Path $folderPath -Name $_ -ItemType Directory
    }else {
        Write-Output "Folder exist"
    }    
}


$folderNames | ForEach-Object -Process {
    if($_ -ne ""){
        Write-Output $_
    }
}

Remove-Item -Path "$folderPath\*" -Recurse

$folderNames.foreach(
    {
       Write-Output  $_ 
    }
)


Get-Item -Path "$folderPath\*"  | ForEach-Object -Process{
        Write-Output $_
}