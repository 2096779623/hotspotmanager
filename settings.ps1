param([String]$name,[String]$pass,[String]$band)
. ".\init.ps1"
if ($tetheringManager.TetheringOperationalState -eq "On")
{
    $tetheringManager.StopTetheringAsync()| Out-Null
}
$configuration = New-Object -TypeName Windows.Networking.NetworkOperators.NetworkOperatorTetheringAccessPointConfiguration
$configuration.Ssid = "$name"
$configuration.Passphrase = "$pass"
$configuration.Band = "$band"
$tetheringManager.ConfigureAccessPointAsync($configuration) | Out-Null
$tetheringManager.StartTetheringAsync()| Out-Null
sleep 5
