<#
 .Synopsis
 Beispiel für einen negativen Lookbehind
 .Description
 Es sollen nur Servernamen ausgegeben werden, die keinen Bindestrich vor einer Zahl am Ende enthalten
#>

$ServerListe =  "Server32"   # Wird ausgegeben
$ServerListe += "Server123"  # Wird ausgegeben
$ServerListe += "Server-444" # Wird nicht ausgegeben
$ServerListe += "Server786"  # Wird ausgegeben
$ServerListe += "SystemX-55" # Wird nicht ausgegeben
$ServerListe += "PC445"      # Wird ausgegeben
$ServerListe += "PC-500"     # Wird nicht ausgegeben
$ServerListe += "Server"     # Wird nicht ausgegeben

$Muster = "(?<Name>[a-zA-Z]+)(?!-)(\d+)"

[Regex]::Matches($ServerListe, $Muster).Value