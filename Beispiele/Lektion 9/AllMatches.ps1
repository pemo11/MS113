<#
 .SYNOPSIS
 Finden aller Treffer in einem Text
#>

$Text = @"
Deutscher Meister wird nur 1860 München, nur 1860 München. Deutscher Meister wird nur 1893 Bayern München, 1893 Bayern München. Deutscher Meister wird nur 1899 Hoffenheim
"@

$Text -match "\d{4}"

# Nur ein Treffer
$Matches

# Alle Treffer als Strings
$Text -split "[.,]„
# Nur ein Treffer
$Matches

# Alle Treffer
[Regex]::Matches($Text, "\d{4}")

