<#
 .SYNOPSIS
 Beispiel für das Abspeichern eines Secret (Text) als SecureString in einem Vault
#>

# Schritt 1: Der Vault muss registriert werden

Register-SecretVault -Name TestVault -ModuleName Microsoft.PowerShell.SecretStore -ErrorAction SilentlyContinue

# Schritt 2: Das Secret wird als SecureString abgespeichert

Set-Secret -Name PoshPw -Secret demo+123 -Vault TestVault

# Schritt 3: Das Secret wird wieder ausgelesen

$Pw = Get-Secret -Name PoshPw -Vault TestVault
$Pw

# Schritt 4: Das Secret wird wieder als Klartext ausgegeben

$Cred = [PSCredential]::new("psadmin", $Pw)
$Cred.GetNetworkCredential().Password
