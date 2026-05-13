# for loop 
$arr = @(1,2,5,6,7,7)

# Most PowerShell scripts prefer:.Count because it works with more collection types safely.
for ($i = 0; $i -lt $arr.Count; $i++) {
     $arr[$i] +=5
}


for ($i = 0; $i -lt 5; $i++) {
    $arr += $i
}

foreach($item in $arr){
    Write-Output $item
}

# While (condtion)
Get-Date
while((Get-Date).Minute -eq 44){
     Get-Date 
}

while($true){
    Write-Output "Welcome to the parrot application"
    Write-Output "Enter 'q' to quit"

    $input = Read-host -prompt "Please enter a phrrase"

    if($input -eq 'q'){
        break
    }
    Write-Output "You entered: $input"
}

# do while 
do{
    Write-Output "Welcome to the parrot application"
    Write-Output "Enter 'q' to quit"

    $input = Read-host -prompt "Please enter a phrrase"


    Write-Output "You entered: $input"
}while($input -ne 'q')

# do until 

do{
    Write-Output "Welcome to the parrot application"
    Write-Output "Enter 'q' to quit"

    $input = Read-host -prompt "Please enter a phrrase"


    Write-Output "You entered: $input"
}until($input -eq 'q')