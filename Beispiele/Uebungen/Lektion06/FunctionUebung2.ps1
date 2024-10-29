<#
 .SYNOPSIS
 Berechen der Speicherkosten für eine Verzeichnisstruktur
#>

function Get-Speicherkosten
{
    [CmdletBinding()]
    param([String]$Path, [Double]$KostenGB=0.2)
    $Speicherbelegung = 0
    Get-ChildItem -Path $env:userprofile -File -Recurse | ForEach-Object {
        Write-Verbose "Bearbeite Datei: $($_.FullName)"
        $Speicherbelegung += $_.Length
    }
    [Math]::Round($Speicherbelegung / 1GB, 2)
}

Get-Speicherkosten -Path $env:userprofile -KostenGB 0.1 # -Verbose

# Get-Childitem -Path $env:userprofile -Directory | Get-Speicherkosten
