$Text = @'
Server123
PC3454
Computer99
ServerYY4
'@


# Zerlege den Text in Namen und Zahlen mit einem regulären Ausdruck
# Konrekt: [Regex]::Matches($Text, ???)
# Oder Select-String mit dem -AllMatches-Parameter
# \w+ steht für Buchstaben
# \d+ steht für Ziffern

$Text | Select-String -AllMatches -Pattern "([A-Z]+)(\d+)" | Select-Object -ExpandProperty Matches

$Text | Select-String -AllMatches -Pattern "([a-z]+)(\d+)" | Select-Object -ExpandProperty Matches |
                                                             Select-Object { $_.Groups[1].Value},
                                                                           { $_.Groups[2].Value }
