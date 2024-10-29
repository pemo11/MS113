$txtPath =Join-Path -Path $PSScriptRoot -ChildPath 'Processe.txt'
Get-Content -Path $txtPath | ConvertFrom-Csv -header "Name" | Stop-Process
