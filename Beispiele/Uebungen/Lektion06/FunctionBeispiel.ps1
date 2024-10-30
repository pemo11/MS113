function Get-Speicherkosten
{
    param([ValidateScript({Test-Path $_})][Parameter(Mandatory=$True,
           ValueFromPipeline=$true,
           ValueFromPipelineByPropertyName=$True)]
           [String]$Path)
    process
    {
        $Path
    }
}

# [PsCustomObject]@{Path="C:\Temp"} | Get-Speicherkosten

# Get-ChildItem $env:userprofile -Directory | Select-Object *Path*,FullName

# Get-ChildItem $env:userprofile -Directory | Get-Speicherkosten

del C:\temp  -Recurse -Force -Confirm