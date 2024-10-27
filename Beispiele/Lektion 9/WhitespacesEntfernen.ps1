<#
 .Synopsis
 Whitespaces entfernen
#>

$Text = "Dies ist kein normaler Text.`n Er enthält Line Breaks und `tTabs usw."

#[Regex]::Matches($Text, "\s")

[Regex]::Replace($Text, "(\w+)\s", "`$1")

$Text -replace "([\w+.])\s*", '$1' | format-hex

$Text -replace "\s", "" | format-hex