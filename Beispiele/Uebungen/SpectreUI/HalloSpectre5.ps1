<#
 .SYNOPSIS
Ausgabe eines Kalenders mit Ereignissen in Spectre.Console.
    .DESCRIPTION
Geht leider nicht, da einige Typen nicht gefunden werden?
Update:Nach Neustart von VS Code gint es doch
#>

# Fehler: Cannot process argument transformation on parameter 'Color'. Object reference not set to an instance of an object.
# Seltsam, da Color kein Pflichtparameter ist
# Die Parameter sind: -Date, -Alignment, -Color, -Border, -Culture,  -Events, -HideHeader, -PassThru
# Fehler hängt eventuell damit zusammen, dass der Typ SpectreConsoleJustify nicht gefunden wird bzw. generell eine Assembl fehlt

Write-SpectreCalendar -Date 2024-07-01 -Events @{'2024-07-10' = 'Beach time!'; '2024-07-20' = 'Barbecue' } -Color Green 