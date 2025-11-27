<#
 .SYNOPSIS
Ein einfaches Hallo-Welt-Skript mit Spectre.Console.
    .DESCRIPTION
Install-Module "PwshSpectreConsole" -Scope CurrentUser
Mehr muss nicht getan werden, um die PowerShell Spectre.Console-Bindungen zu verwenden.
https://pwshspectreconsole.com/guides/get-started/
    .EXAMPLE
HalloSpectre2.ps1
Ein einfaches Hallo-Welt-Skript mit Spectre.Console.
#>

#Requires -Module PwshSpectreConsole

# Wird empfohlen
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = [System.Text.UTF8Encoding]::new() 

$colorItems = @("Red", "Green", "Blue")

$chosenItem = Read-SpectreSelection -Title "Select your favorite color" -Choices $colorItems -Color "Green"
Write-SpectreHost "Your chosen color is '$chosenItem'"