﻿<#
  .SYNOPSIS
  Beispiel für ForEach mit -Parallel
  .DESCRIPTION
  Aufruf einer Function - funktioniert aber nicht
#>

#requires -Version 7

<#
 .SYNOPSIS
 Beliebige Function, die im Rahmen von ForEach-Object -Parallel ausgeführt werden soll
#>
function TuWas
{
    param(
        [Parameter(Mandatory=$true)]
        [int]$i
    )
    Write-Host "Starte $i"
    Start-Sleep -Seconds 1
    Write-Host "Beende $i"
}


# Reguläre Ausführung

# Geht nicht, da die Function nicht bekannt ist

1..3 | ForEach-Object -Parallel {
    TuWas -i $_
}

# Functionname wird einer Variable zugewiesen
$TuWasPtr = "TuWas"

# Regulärer Aufruf ohne -Parallel etwas umständlich, aber die Übertragung auf Parallel soll nachvollziehbar sein
1..3 | ForEach-Object {
     &$TuWasPtr -i $_
}

1..3 | ForEach-Object -Parallel {
    # Der direkte Aufruf der Function geht nicht, da der Name Tuwas in dem Runspace nicht bekannt ist
    &$using:TuWasPtr -i $_
    # Der Inhalt der Variablen kann natürlich abgerufen werden
    # $using:TuWasPtr
}
