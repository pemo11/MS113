<#
 .SYNOPSIS
 Berechen der Speicherkosten für eine Verzeichnisstruktur
#>

function Get-Speicherkosten
{
    [CmdletBinding()]
    param([Parameter(Mandatory=$True,
                     ValueFromPipelineByPropertyName=$True)]
                     [Alias("FullName")]
                     [String]$Path, 
                     [Double]$KostenGB=0.2)
    Process
    {
        $Speicherbelegung = 0
        Get-ChildItem -Path $Path -File -Recurse | ForEach-Object {
            Write-Verbose "Bearbeite Datei: $($_.FullName)"
            $Speicherbelegung += $_.Length
        }
        [PSCustomObject]@{
            Pfad = $Path
            Kosten = [Math]::Round($Speicherbelegung / 1GB * $KostenGB, 2)
        }
    }
}

# Get-Speicherkosten -Path $env:userprofile -KostenGB 0.1 # -Verbose

Get-Childitem -Path $env:userprofile -Directory | Get-Speicherkosten | Where-Object Kosten -gt 0 | 
 Sort-Object Kosten -Descending | Format-Table -AutoSize
