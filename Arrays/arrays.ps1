$arr=@("Test1",'Test2','Test3')

$arr.GetType()

$arr.Count
$arr.Length
$arr.IsFixedSize


#print all items 
$arr 

#print by index
$arr[1]

# print out of index without strict mood 
Set-StrictMode -off
$arr[3]

# print out of index with strict mood
Set-StrictMode -Version Latest
$arr[3]


# add new value to array

$arr.Add('Test4'); # will make exception  
$arr=$arr+"Test4"
$arr +="Test5"
$arr


#remove value from array 
# $arr.RemoveAt(1) # will make exception 

$arr = $arr -ne "Test2"
$arr