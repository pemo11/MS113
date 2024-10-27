<#
 .SYNOPSIS
    Beispiele für den Null Operator
#>

#require -Version 7.0 

class Test
{
    $P1 = 0
    $P2
    
    [void]DoIt()
    {
        Write-Host "Doing something"
    }
}

$t = [Test]::new()
$t1 = $null

${t}?.DoIt()
${t1}?.DoIt()
