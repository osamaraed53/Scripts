# how to create 
$employeeOne = New-Object -TypeName PSCustomObject

$employeeOne.GetType()

Add-Member -InputObject $employeeOne -MemberType NoteProperty -Name 'EmployeeId' -Value 1001
Add-Member -InputObject $employeeOne -MemberType NoteProperty -Name 'FirstName' -Value 'Osame'
Add-Member -InputObject $employeeOne -MemberType NoteProperty -Name 'Title' -Value 'CEO'

#or

$employeeTwo = [PSCustomObject]@{
    EmployeeId = 1001;
    FirstName = "Osame";
    Title ="CEO";
}

# access
# $employeeOne.EmployeeId
# Get-member -InputObject $employeeOne

$employeeTwo
