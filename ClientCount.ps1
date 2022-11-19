. ".\init.ps1"
$FileName = ".\ClientCount.txt"
if (Test-Path $FileName) {
   Remove-Item $FileName -verbose
}
$tetheringManager.ClientCount | Out-File "ClientCount.txt"