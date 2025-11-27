<#
 .SYNOPSIS
Ein einfaches Hallo-Welt-Skript mit Spectre.Console.
    .DESCRIPTION
Ausgabe einer Tabelle
#>

Get-Process | Select-Object -First 10 -Property Id, Name, Handles | Format-SpectreTable