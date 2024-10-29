function Get-ComputerInfo
{
    Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property Manufacturer, Model, TotalPhysicalMemory
}

function Get-OSInfo
{
    Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property Caption, Version, OSArchitecture
}

function Get-AppInfo
{
    param([String]$AppName)
    Get-CimInstance -ClassName Win32_Product -Filter "Name LIKE '%$AppName%'" | Select-Object -Property Name, Version
}
