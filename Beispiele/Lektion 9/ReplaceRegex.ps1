<#
 .Synopis
 Beispiel für Replace mit einem Regex
#>

$Text = @"

File: <*PoshHost.cs*>

File: <*PoshHostRawUserInterface.cs*>

File: <*PoshHostUserInterface.cs*>

File: <*Posh2ExeException.cs*>


"@

# Ausgabe der Dateinamen

# Hat etwas gedauert  - * muss jeweils escaped werden - eigentlich klaro
$Muster = "(<\*(\w+.cs)\*>)"

[Regex]::Matches($Text, $Muster).ForEach{$_.Groups[2].Value}

# Ersetzt den Eintrag <*Dateiname.cs*> durch Dateiname.cs
$Text -replace $Muster, '[$2]'

