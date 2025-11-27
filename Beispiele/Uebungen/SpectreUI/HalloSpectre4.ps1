<#
 .SYNOPSIS
Ein einfaches Hallo-Welt-Skript mit Spectre.Console.
    .DESCRIPTION
Ausgabe einer Hierarchie
#>

@{
     Value = "Root"
     Children = @(
         @{
             Value = "First Child"
             Children = @(
                 @{ Value = "With" },
                 @{ Value = "Loads" },
                 @{ Value = "More" },
                 @{ Value = "Nested"; Children = @( @{ Value = "Children" } ) }
             )
         },
         @{ Value = "Second Child" }
     )
} | Format-SpectreTree