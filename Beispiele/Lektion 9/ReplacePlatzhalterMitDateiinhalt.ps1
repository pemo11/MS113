<#
 .Synopsis
 Platzhalter durch Dateien ersetzen
#>

$Text = @"
  Hier beginnt der Quelltext

   <*Datei1.abc*>
   <*Datei2.abc*>
   <*Datei3.abc*>
  
  Hier endet der Quelltext
"@

$Muster = "<\*(\w+.abc)\*>"

# $Text | Select-String -Pattern $Muster -AllMatches | Select -Expand Matches | Select @{n="Datei";e={$_.Groups[1].Value}}

$Matches = Select-String -InputObject $Text -Pattern $Muster -AllMatches | Select-Object -Expand Matches 

$SB = New-Object -TypeName System.Text.StringBuilder

$Matches | ForEach {
 $Pfad = Join-Path -Path $PSScriptRoot -ChildPath $_.Groups[1].Value
 [void]$SB.Append((Get-Content -Path $Pfad -Raw))
 [void]$SB.Append("`n")
}

# $SB.ToString()

# Platzhalter herausnehmen und Text einsetzen

$TextNeu = $Text.Substring(0, $Matches[0].Index)

$TextNeu += $SB.ToString()

$TextNeu += $Text.Substring($Matches[-1].Index + $Matches[-1].Length)

$TextNeu

