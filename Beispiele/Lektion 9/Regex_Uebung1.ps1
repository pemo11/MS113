<#
 .Synopsis
 Zerlegen von Namen in ihre Bestandteile mit Select-String und AllMatches
#>


$Text = @"
Server123
PC456
Computer99
"@

# $Text | Format-Hex
# Mit -AllMatches werden mehrere Matches gefunden - die alle Teil der Matches-Eigenschaft sind
$Text | Select-String -Pattern "([a-z]+)([1-9]+)" -AllMatches | Select -ExpandProperty Matches | Select @{n="Name";e={$_.Groups[1].Value}},
                                                                                                        @{n="Id";e={$_.Groups[2].Value}}