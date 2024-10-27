﻿<#
 .Synopsis
 Beispiel für eine Function, die die Pipeline abarbeitet
#>

function Get-Speicherkosten
{

    param([Parameter(ValueFromPipelineByPropertyName=$true)][Alias("PSPath")][String]$Path,
          [Double]$SpeicherkostenMB=0.8)

    process
    {
      Get-ChildItem -Path $Path -Directory -Recurse | ForEach-Object {
          $GroesseMB = (Get-ChildItem -Path $_.FullName -File | Measure-Object -Property Length -Sum).Sum / 1MB
          $Speicherkosten = $GroesseMB * $SpeicherkostenMB
          [PSCustomObject]@{Pfad=$_.FullName;Speicherkosten=$Speicherkosten}
      }
    }

}