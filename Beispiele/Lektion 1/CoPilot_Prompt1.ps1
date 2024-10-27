<#
 .SYNOPSIS
 Erstelle ein PowerShell-Skript, das alle Dateien im Documents-Verzeichnis in ein
neues Verzeichnis verschiebt, die älter als 365 Tage und 5 Minuten sind
#>

# Get the current date
$CurrentDate = Get-Date

# Get the date 365 days and 5 minutes ago
$OldDate = $CurrentDate.AddYears(-1).AddMinutes(-5)

# Get all files in the Documents directory
$Files = Get-ChildItem -Path $env:USERPROFILE\Documents

# Create a new directory for the old files
$OldFilesDirectory = New-Item -Path $env:USERPROFILE -Name "OldFiles" -ItemType Directory

# Move all files older than 365 days and 5 minutes to the new directory
foreach ($File in $Files) {
    if ($File.LastWriteTime -lt $OldDate) {
        Move-Item -Path $File.FullName -Destination $OldFilesDirectory.FullName
        
    }
}

