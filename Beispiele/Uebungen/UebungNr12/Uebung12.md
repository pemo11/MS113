# Übung Nr. 12

Ein Command `Get-VMTextData` aus dem PoshKurs-Modul liefert die Eigenschaften von (fiktiven) VMs. Allerdings als Text.

Dieser Text soll im Rahmen der Übung in Objekte konvertiert werden.

Tipp 1: Die Zeile mit den Überschriften muss separat verarbeitet werden.

Tipp 2: Objekte werden am einfachsten per [PSCustomObject]@{} erzeugt

In einer Erweiterung soll für jede Zeile ein Objekt generiert werden, das auf einer Klasse basiert, die zuvor definiert wurde.

Diese Function muss noch in das PoshKurs-Modul:

```Powershell
function Get-VMTextData {
    [CmdletBinding()]
    param(
        [Parameter()][int]$Count = 20
    )

    # Kopfzeile
    $header = "ID    StartTime            Type        Size     Status"
    Write-Output $header

    # Beispielwerte
    $types  = "Linux","Windows","BSD"
    $sizes  = "Small","Medium","Large"
    $states = "Running","Stopped","Paused","Error"

    # Zeilen generieren
    1..$Count | ForEach-Object {
        $id        = "{0:D4}" -f $_
        $startTime = (Get-Date).AddMinutes(- (Get-Random -Min 10 -Max 1500)).ToString("yyyy-MM-dd HH:mm")
        $type      = $types | Get-Random
        $size      = $sizes | Get-Random
        $status    = $states | Get-Random

        # Mehrere Leerzeichen für spätere Parsing-Übungen
        "{0}    {1}    {2}    {3}    {4}" -f $id, $startTime, $type, $size, $status
    }
}


```