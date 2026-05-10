
# How initiate 
$list01 = [System.Collections.ArrayList]@() #this casting array to array list
$list02 = New-Object -TypeName System.Collections.ArrayList

$list01.GetType()
$list02.GetType()


$list = New-Object -Type System.Collections.ArrayList
$list.IsFixedSize


#Add to array list 
[void]$list.Add("Test1") # will return the index of new item 
[void]$list.Add("Test2")
$list.AddRange(@("Test3","Test4")) # it take array is arg 
$list

#Remove from list 
$list.Remove("Test2") # will only remove the first 
$list.RemoveAt(0)
$list.RemoveRange(0,2);

$array = @()
$arrayList = New-Object -TypeName System.Collections.ArrayList

Measure-Command -Expression {@(0..50000).ForEach({$array+=$_})}
Measure-Command -Expression {@(0..50000).ForEach({$arrayList.Add($_)})}
Measure-Command -Expression {$arrayList.AddRange(@(0..5000000))}