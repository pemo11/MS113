<#
 .Synopsis
 Regex mit Backreferences
#>

$Text = @"
  <h1>Alles klar mit PowerShell</h1>
  <h3>Was sind eigentlich Befehle?</h3>
  <h3>Mit Html kenne ich mich noch nicht so gut aus</h1>
  <h1>Ich mache noch leider einiges falsch</h2>
"@

#$Muster = "<(\w+)>.+</\1>"
$Muster = "<(\w+)>.+</(?!\1)\w+>"

[Regex]::Matches($Text, $Muster) | Select-Object -Property Value