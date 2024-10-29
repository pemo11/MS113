<#
 .SYNOPSIS
 Berechen der Speicherkosten für eine Verzeichnisstruktur
#>

$VerbosePreference = 'Continue'
$Speicherbelegung = 0
$KostenGB = 0.2
Get-ChildItem -Path $env:userprofile -File -Recurse | ForEach-Object {
    Write-Verbose "Bearbeite Datei: $($_.FullName)"
    $Speicherbelegung += $_.Length
}

$Speicherbelegung / 1GB * $KostenGB

$VerbosePreference = 'SilentlyContinue'