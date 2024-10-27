<#
 .SYNOPSIS
 Beispiele für den  Ternary Operator
 Ternary Operator: ?:
#>

#require -Version 7.0 

$WSLimit = 200MB
$Treshold = 10
$BigProcess = Get-Process | Where-Object { $_.WS -gt $WSLimit }

# Oder etwas kompakter
$BigProcess = Get-Process | Where-Object WS -gt $WSLimit

# Variante 1
if ($BigProcess.Count -gt $Treshold) {
    $status = "Warnung..."
} else {
    $status = "OK"
}
$status

# Variante 2
$status = if ($BigProcess.Count -gt $Treshold) { "Warnung..." } else { "OK" }
$status

# Variante 3
$status = $BigProcess.Count -gt $Treshold ? "Warnung..." : "OK"
$status

