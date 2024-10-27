<#
 .SYNOPSIS
 Ein Beispiel für eine generische Liste
#>

using namespace System.Collections.Generic
Set-StrictMode -Version Latest

# Eine generische Liste erstellen

$d1 = Get-Date -Date "4.5.2024"
$d2 = Get-Date -Date "1.9.2024"
$d3 = Get-Date -Date "13.11.2024"

$datumsListe = [List[DateTime]]::new()
$datumsListe.Add($d1)
$datumsListe.Add($d2)
$datumsListe.Add($d3)

# geht auch mit Strings
$datumsListe.Add("1.1.2024")

# geht auch mit Zahlen, da [DateTime]::new(1234) zum 1.1.0001 führt
$datumsListe.Add(1234)

# geht aber nicht
try {
    $datumsListe.Add("31.09.2024")
    
}
catch {
    Write-Host "*** Fehler: $($_.Exception.Message)"
}

$datumsListe