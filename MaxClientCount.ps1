. ".\init.ps1"
$FileName = ".\MaxClientCount.txt"
if (Test-Path $FileName) {
   Remove-Item $FileName -verbose
}
$tetheringManager.MaxClientCount | Out-File "MaxClientCount.txt"