$Website = Read-Host -Prompt "Please enter DNS Name"
$PingWebsite = Resolve-DnsName pure-ip.com | Select -ExpandProperty IPAddress
ipconfig /flushdns
Clear

while ($true) {
$Date = Get-Date
Write-Host "Current date is $Date" -ForegroundColor Gray
Write-Host "Website is $Website" -ForegroundColor Green
Write-Host "Website IP address is" -NoNewline
Write-Host " $PingWebsite" -ForegroundColor Red
Write-Host "Flushing DNS" -ForegroundColor Gray
Ipconfig /flushdns | Out-Null
Write-Host "===================================================" -ForegroundColor Red
Sleep 5
}