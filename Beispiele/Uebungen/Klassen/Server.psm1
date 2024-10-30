<#
 .SYNOPSIS
 Definition der Klasse Server
#>

class Server
{
    [String]$Id
    [String]$Status

    Server([String]$Id)
    {
        $this.Id = $Id
        $this.Status = "Stopped"
    }
    
}