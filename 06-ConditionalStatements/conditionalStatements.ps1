

1 -eq 1 #Equals 
1 -ne 3 #not equals 
1 -lt 2 #less than 
2 -le 2 #Less than or equal 
4 -gt 4 #Grater than
4 -ge 3 #Grater than or equal

@(1, 2, 3) -contains 4
@("Test", "test", 5) -contains "TEST" #not case sensitive
@("Test", "test", 5) -ccontains "TEST" # case sensitive  


"TEST" -eq "test" # not case sensitive True
"TEST" -ceq "test" # case sensitive False

$filePath = "06-ConditionalStatements\conditionalStatements.ps1"
Test-Path -Path $filePath

if (Test-Path -Path $filePath) {
    Get-Content -Path $filePath
    $Data = Get-Content -Path $filePath
    if ($Data.Count -lt 2) {
        Write-Output "This file has less than 2 lines"
    }elseif($Data -lt 3){
        Write-Output "This file has less than 3 lines"
    }else {
        Write-Output "This file has less than 4 or equal lines"
    }
        Write-Output "after if statement"
}
else {
    #check this 
    Write-Output "File $filepath dose not exist!" 
    Write-Output 'File $filepath dose not exist!'
    Write-Output "File "$filepath" dose not exist!"
    Write-Output "File `"$filepath`" dose not exist!"


}