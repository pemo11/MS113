
function Stop-Computer
{
    param(
        [Parameter(Mandatory=$true)]
        [string]$ServerName
    )  

    Write-Host "*** Terminating $ServerName ***"
}

function Terminate-Server
{
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [string]$ServerName
    )  
    Write-Host "Terminating $ServerName"
    If($PSCmdlet.ShouldProcess($ServerName, "Terminate Server"))
    {
        Stop-Computer -ServerName $ServerName 
        Write-Host "*** Terminated $ServerName ***"
    }

}

Terminate-Server -ServerName "Server1"