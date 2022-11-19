. ".\init.ps1"
$FileName = ".\status.txt"
if (Test-Path $FileName) {
   Remove-Item $FileName -verbose
}
if ($tetheringManager.TetheringOperationalState -eq "Off")
{
    echo "Off" | Out-File "status.txt"
} else
{
    echo "On" | Out-File "status.txt"
}
