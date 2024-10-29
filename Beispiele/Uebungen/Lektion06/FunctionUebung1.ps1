<#
 .SYNOPSIS
 Function, die aus einem Array ein Zufallselement auswählt
#>

function choose
{
 param($a, $count=1)
 $a | Get-Random -Count $count
}

$a = @("Hund", "Katze", "Maus", "Elefant", "Giraffe")

choose $a, 2