<#
.SYNOPSIS
Eine LDAP-Abfrage gegen OpenDC
.NOTES
Geht nicht, nur als Anregung für eine künftige Implementierung
#>

# https://www.openidentityplatform.org/blog/2025-11-05-opendj-getting-started

# Konfiguration
$ldapServer = "ldap://opendj.deinserver.local:389"
$baseDn     = "dc=example,dc=com"

# Bind-Credentials abfragen
$cred = Get-Credential -Message "Bitte Bind-DN und Kennwort für OpenDJ eingeben"

# DirectoryEntry erzeugen
$root = New-Object System.DirectoryServices.DirectoryEntry(
    $ldapServer + "/" + $baseDn,
    $cred.UserName,                          # z.B. cn=Directory Manager
    $cred.GetNetworkCredential().Password
)

# DirectorySearcher vorbereiten
$searcher = New-Object System.DirectoryServices.DirectorySearcher($root)

# LDAP-Filter, z.B. alle Benutzer
$searcher.Filter = "(objectClass=inetOrgPerson)"   # oder "(uid=*)"
$searcher.SearchScope = "Subtree"

# Nur bestimmte Attribute laden (optional, sonst kommt viel mit)
$searcher.PropertiesToLoad.Add("uid")       | Out-Null
$searcher.PropertiesToLoad.Add("cn")        | Out-Null
$searcher.PropertiesToLoad.Add("mail")      | Out-Null

foreach ($result in $results) {
    $props = $result.Properties
    [PSCustomObject]@{
        DN   = $result.Path
        UID  = ($props["uid"]  | Select-Object -First 1)
        CN   = ($props["cn"]   | Select-Object -First 1)
        Mail = ($props["mail"] | Select-Object -First 1)
    }
}
$results = $searcher.FindAll()

$searcher.Filter = "(uid=jdoe)"
$result = $searcher.FindOne()

if ($result) {
    $props = $result.Properties
    "Gefunden: {0} ({1})" -f $props["cn"][0], $props["mail"][0]
} else {
    "Kein Eintrag gefunden."
}
