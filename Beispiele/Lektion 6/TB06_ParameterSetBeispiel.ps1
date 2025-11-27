<#
 .SYNOPSIS
    Beispiel für die Verwendung von Parameter-Sets in einer Function
.NOTES
    DefaultParameterSetName = "", damit HTMLOutput und HTMLFilePath in allen Parameter-Sets verwendet werden können
#>

function Get-UserInfo {
    [CmdletBinding(DefaultParameterSetName = "")]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = "ByName")]
        [string]$UserName,
        [Parameter(Mandatory = $true, ParameterSetName = "ById")]
        [int]$UserId,
        [Parameter(Mandatory = $true, ParameterSetName = "ByEmail")]
        [string]$Email,
        [Parameter(Mandatory = $false, ParameterSetName = "")][Switch]$HTMLOutput,
        [Parameter(Mandatory = $false, ParameterSetName = "")][String]$HTMLFilePath
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ByName' {
            return "Benutzerinformationen für Benutzername: $UserName"
        }
        'ById' {
            return "Benutzerinformationen für Benutzer-ID: $UserId"
        }
    }
}

Get-Command -Name Get-UserInfo -Syntax