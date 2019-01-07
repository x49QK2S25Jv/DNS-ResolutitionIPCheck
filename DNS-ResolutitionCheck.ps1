﻿$DNSRecord = Read-Host -Prompt "Please enter DNS Name"
ipconfig /flushdns
Clear

while ($true) {
$Date = Get-Date -Format "dd-MM-yyyy HH:mm:ss"
$PingWebsite = Resolve-DnsName google.com -type A | Select -ExpandProperty IPAddress
Write-Host "Current date is $Date" -ForegroundColor Gray
Write-Host "DNS entered is $DNSRecord" -ForegroundColor Green
Write-Host "Returned IP/s is " -NoNewline
Write-Host " $PingWebsite" -ForegroundColor Red
Write-Host "Flushing DNS" -ForegroundColor Gray
Ipconfig /flushdns | Out-Null
Write-Host "===================================================" -ForegroundColor Red
Sleep 5
}