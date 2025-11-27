<#
 .SYNOPSIS
    Einfache Ausgabe mit CowSay in PowerShell
#>

function Invoke-CowSay {
    param([string]$Text = "Moo!")

    $bubble = "/ $Text \"

    $cow = @"
  $bubble
        \
         \   ^__^
              (oo)\_______
              (__)\       )\/\
                  ||----w |
                  ||     ||
}

"@

    $cow
}   

Set-Alias -Name CowSay -Value Invoke-CowSay

Invoke-CowSay -Text "Hallo, ich bin eine Kuh!"

function LennyDogSay {
    param([string]$Text = "Ich bin Lenny!")

    $bubble = "/ $Text \"

    $lenny = @"
  $bubble
        \
         \    /^-----^\
              V  o o  V   <- Lenny
               |  Y  |
                \ Q /
               / - - \
               |  | | |
              (__| | |__)
"@

    $lenny
}

LennyDogSay
