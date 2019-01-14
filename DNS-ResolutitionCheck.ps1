$DNSRecord = Read-Host -Prompt "Please enter DNS Name"
ipconfig /flushdns
ipconfig /all
Clear
sleep 1

while ($true) {
$Date = Get-Date -Format "dd-MM-yyyy HH:mm:ss"
$DNSServer = ipconfig /all | Select-String -List 'DNS Servers'
$PingWebsite = Resolve-DnsName google.com -type A | Select -ExpandProperty IPAddress
Write-Host "Current date is $Date" -ForegroundColor Gray
Write-Host "Primary IPV4 DNS server is $DNSServer" -ForegroundColor Gray
Write-Host "DNS requested is $DNSRecord" -ForegroundColor Green
Write-Host "IP returned is" -NoNewline
Write-Host " $PingWebsite" -ForegroundColor Red
Write-Host "Flushing DNS" -ForegroundColor Gray
Ipconfig /flushdns | Out-Null
Write-Host "===================================================" -ForegroundColor Red
Sleep 5
}

Get-NetAdapterAdvancedProperty