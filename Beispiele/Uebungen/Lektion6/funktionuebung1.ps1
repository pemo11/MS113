function choose
{
    param($a)
    $a | Get-Random 
}

$services = Get-Service
$services | Get-Random
#@(1,2,3,4,5,6,7,8,9,10) | Get-Random
#Sa=@("1",("2"),
#$a=@("Hund","Katze", "Maus","Hase")

choose $a



