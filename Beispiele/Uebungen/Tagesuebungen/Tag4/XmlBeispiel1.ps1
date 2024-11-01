﻿[Xml]$XmlText = @"
<?xml version="1.0"?>
<serverdaten>
    <server id="S_1000">
        <size>Small</size>
        <manufacturer>Dell</manufacturer>
        <productType>PowerEdge K9</productType>
        <cost>1.2</cost>
        <purchaseDate>01/02/2004</purchaseDate>
    </server>
    <server id="S_1001">
        <size>Medium</size>
        <manufacturer>HP</manufacturer>
        <productType>Pro Liant XL</productType>
        <cost>2.2</cost>
        <purchaseDate>04/05/2006</purchaseDate>
    </server>
    <server id="S_1002">
        <size>big</size>
        <manufacturer>HP</manufacturer>
        <productType>ProLiant BL500</productType>
        <cost>3.6</cost>
        <purchaseDate>12/09/2006</purchaseDate>
    </server>
    <server id="S_1003">
        <size>medium</size>
        <manufacturer>Dell</manufacturer>
        <productType>PowerEdge R620</productType>
        <cost>2.1</cost>
        <purchaseDate>30/06/2004</purchaseDate>
    </server>
    <server id="S_1004">
        <size>big</size>
        <manufacturer>HP</manufacturer>
        <productType>ProLiant BL680</productType>
        <cost>3.6</cost>
        <purchaseDate>12/09/2006</purchaseDate>
    </server>
    <server id="S_1005">
        <size>small</size>
        <manufacturer>Lenovo</manufacturer>
        <productType>x3650</productType>
        <cost>1.1</cost>
        <purchaseDate>17/08/2005</purchaseDate>
    </server>
    <server id="S_1006">
        <size>medium</size>
        <manufacturer>Dell</manufacturer>
        <productType>PowerEdge R640</productType>
        <cost>2.4</cost>
        <purchaseDate>04/05/2004</purchaseDate>
    </server>
    <server id="S_1007">
        <size>small</size>
        <manufacturer>Lenovo</manufacturer>
        <productType>ThinkServer X1</productType>
        <cost>1.1</cost>
        <purchaseDate>17/08/2005</purchaseDate>
    </server>
    <server id="S_1008">
        <size>small</size>
        <manufacturer>Dell</manufacturer>
        <productType>PowerEdge T110</productType>
        <cost>10.4</cost>
        <purchaseDate>06/02/2004</purchaseDate>
    </server>
    <server id="S_1009">
        <size>medium</size>
        <manufacturer>Dell</manufacturer>
        <productType>PowerEdge 800</productType>
        <cost>2.1</cost>
        <purchaseDate>07/09/2004</purchaseDate>
    </server>
</serverdaten>
"@

# ([Xml]$XmlText).serverdaten.server | Where-Object manufacturer -eq "Dell"

# $XmlText.serverdaten.server | Where-Object manufacturer -eq "Dell"
$XmlText.serverdaten.server | Where-Object Cost -gt 2 | Select-Object productType,Cost

$XmlText.serverdaten.server | Where-Object {[Double]$_.Cost -gt 2 }| Select-Object productType,Cost |
 Sort-Object { [Double]$_.Cost } 

