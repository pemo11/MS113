<#
 .Synopsis
 IP-Adressen aus Text herausfischen
#>

# $Output = Netstat -ao

$Muster = "(?<Pro>[A-Z]+)\s+[0-9]\.[0-9]\.[0-9]\.[0-9]:(?<RemotePort>\d+).*\s(?<PID>\d+)$"

# Aktuell wird nur die letzte Ziffer der Prozess-ID gematcht, da nicht für alle Elemente Gruppen definiert werden
# Lösung 1: Alle Gruppen einbeziehn
# Lösung 2: ??? Die Lösung war vor der letzten Gruppe ein \s einzubauen!

$Output | Select-String -Pattern $Muster | Select @{n="Protokoll";e={$_.Matches[0].Groups["Pro"].Value}},
                                                  @{n="Remote-Port";e={$_.Matches[0].Groups["RemotePort"].Value}},
                                                  @{n="Prozess-ID";e={$_.Matches[0].Groups["PID"].Value}}