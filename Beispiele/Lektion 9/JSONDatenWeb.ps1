<#
 .SYNOPSIS
    Lädt JSON-Daten von einer Webseite und gibt sie aus
#>

$url = "https://jsonplaceholder.typicode.com/todos"

$response = Invoke-RestMethod -Uri $url
$response