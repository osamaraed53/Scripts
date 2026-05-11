
# create new hash table 
$hashTable = @{
    key1 = 100
    key2 = 2.34
    name = "osama"
    key3 = 2
    key4 = $true
}

$hashTable.GetType()

#important function 
$hashTable.Values
$hashTable.Keys

$hashTable.key1
$hashTable.name

$hashTable.ContainsKey("key3")
$hashTable.ContainsKey("key5") # return bool

$hashTable.ContainsValue("osama")
$hashTable.ContainsValue("raed") # return bool

#add new pair
$hashTable.Add("key5","raed")
$hashTable["key6"] = "raed"
$hashTable.key7 = "raed"


#remove
$hashTable.Remove('apple')
$hashTable