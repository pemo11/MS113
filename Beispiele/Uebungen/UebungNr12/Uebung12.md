# Übung Nr. 12

Ein Command Get-VMTextData aus dem PoshKurs-Modul liefert die Eigenschaften von (fiktiven) VMs. Allerdings als Text.

Dieser Text soll im Rahmen der Übung in Objekte konvertiert werden.

Tipp 1: Die Zeile mit den Überschriften muss separat verarbeitet werden.

Tipp 2: Objekte werden am einfachsten per [PSCustomObject]@{} erzeugt

In einer Erweiterung soll für jede Zeile ein Objekt generiert werden, das auf einer Klasse basiert, die zuvor definiert wurde.

