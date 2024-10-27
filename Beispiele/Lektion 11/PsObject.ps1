<#
 .SYNOPSIS
 Beispiel für PsObject
#>

# Anlegen eines Objekts
$o =[PSCustomObject]@{
    P1 = 100
    P2 = 200
    ID = "ID-123"
}

$o | Get-Member -Force 

$o.psobject