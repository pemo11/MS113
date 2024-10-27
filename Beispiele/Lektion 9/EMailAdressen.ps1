<#
 .Synopsis
 Webseiten nach E-Mail-Adressen durchsuchen
#>

$URLListe = "https://www.heise.de", "https://www.qskills.de", "https://www.computerwoche.de/p/impressum,3716", "https://www.activetraining.de", "https://www.activedevelop.de"

$Muster = "\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b"

$StartZeit = Get-Date
$Anzahl = 0

$URLListe | ForEach-Object {
    
    $Url = $_
    $Anzahl++
    try
    {
        $Complete = ($Anzahl / $URLListe.Length) * 100
        Write-Progress -Activity "E-Mail-Check läuft..." -Status "Analysiere $Url" -PercentComplete $Complete
        $Inhalt = (Invoke-WebRequest -Uri $Url -ErrorAction Ignore).Content
        [Regex]::Matches($Inhalt, $Muster, "IgnoreCase") | Select-Object @{n="URL";e={ $Url}}, @{n="E-Mail";e={$_.Value}}
    }
    catch
    {
        Write-Warning "Fehler beim Download von $Url"
    }
}

Write-Host -Fore Yellow ( "{0} Webseiten analysiert in {1:n2}s" -f $URLListe.Length, ((Get-Date)-$Startzeit).TotalSeconds )