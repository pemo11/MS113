<#
 .Synopsis
 Beispiel für ein negatives Lookahead
#>

$Text = "Server_A123 "
$Text +=  "Server_B23 "
$Text +=  "Server_A982"
$Text +=  "Server_C4562"
$Text +=  "Server_B12"
$Text +=  "PC_D459"

# Alle Namen und Ids bei den Namen ausgeben, bei denen auf den Bindestrich kein B folgt

# Ein negatives Lookahead bedeutet, dass ein Zeichen an einer Stelle nicht vorkommen darf es aber auch nicht 
# gemacht wird und sich der interne Zeiger daher nicht weiterbewegt

$Muster = "(?<Name>[a-zA-Z]+)_(?!B)\w(?<Id>\d+)"

# Positives Lookahead - auf den Bindestrich muss ein B folgen
# $Muster = "(?<Name>[a-zA-Z]+)_(?=B)\w(?<Id>\d+)"

[Regex]::Matches($Text, $Muster) | Select @{n="Name";e={$_.Groups["Name"]}}, @{n="Id";e={$_.Groups["Id"]}}
