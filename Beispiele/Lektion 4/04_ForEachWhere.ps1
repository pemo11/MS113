<#
 .SYNOPSIS
 Beispiele für die Erweiterungsmethoden ForEach und Where
#>

$d1 = Get-Date -Date "4.5.2024"
$d2 = Get-Date -Date "1.9.2024"
$d3 = Get-Date -Date "13.11.2024"
$d4 = Get-Date -Date "1.1.2024"
$d5 = Get-Date -Date "9.1.2024"

$dListe = ($d1, $d2, $d3, $d4, $d5)

$dListe.ForEach{
    $_.DayOfWeek
}

$dListe.Where{$_.DayOfWeek -eq 'Saturday' -or $_.DayOfWeek -eq 'Sunday'}.ForEach{
    "Der $($_.ToString("d")) ist am Wochenende"
}