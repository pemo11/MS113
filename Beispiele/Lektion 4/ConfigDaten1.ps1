<#
 .SYNOPSIS
 Einlesen von Daten aus einer Psd1-Datei
#>

Set-StrictMode -Version Latest

$ConfigPath = Join-Path -Path $PSScriptRoot -ChildPath "ScriptConf.psd1"
$ConfigData = Import-PowerShellDataFile -Path $ConfigPath
$ConfigData

$ConfigData.AnzahlDurchlauefe