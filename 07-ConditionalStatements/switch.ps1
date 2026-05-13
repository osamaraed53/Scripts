$filePath = "07-ConditionalStatements\text.txt"


$Data = Get-Content -Path $filePath

$Data.Count

$firstName = $Data[0]


switch ($firstName) {
    "Osama" {
        Write-Output "My name is osama"
        break 
        # Use break when you want to exit the entire switch immediately,
        # especially when multiple matches are possible. it not reqired
    }
    "Raed" {
        Write-Output "My name is Raed" 
        break
    }
    "Alnobani" {
        Write-Output "My name is Alnobani"
        break
    }
    "ayaa" {
        Write-Output "My name is ayaa"
        break
    }
    "salma" {
        Write-Output "My name is osama"
        break
    }
    Default {
        Write-Output "My name is not exist"

    }
}

switch($Data.Count){
    ($_ -lt 2){
        Write-Output " this file has less then 2 lines"
    }
    ($_ -lt 10){
        Write-Output " this file has less then 10 lines"
    }
    ($_ -in (5..10)){
        Write-Output " this file is 8 or 9 lines"
    }
    Default{
        Write-Output "from  default $_"
    }
}