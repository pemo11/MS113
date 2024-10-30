<#
 .SYNOPSIS
 Beenden aller Prozesse, deren Namen in der Datei Prozesse.txt enthalten sind
#>

$txtPath = Join-Path -Path $PSScriptRoot -ChildPath 'Prozesse.txt'
Get-Content -Path $txtPath | ConvertFrom-Csv -header "Name"  | Stop-Process 

