#PowerShell script with some common vulnerabilities
# Vulnerability 1: Storing credentials in plain text
$username = "abeladmin"
$password = "password123"
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($username, $securePassword)
 # Vulnerability 2: Insecure file handling
$filePath = "C:\Users\admin\Documents\passwords.txt"
$passwords = Get-Content $filePath
foreach ($password in $passwords) {
    Write-Host "Password: $password"
}
 # Vulnerability 3: Potential injection vulnerability
$computerName = Read-Host "Enter the computer name"
Invoke-Command -ComputerName $computerName -ScriptBlock {Get-Process}
 # Vulnerability 4: Weak security
$cert = New-SelfSignedCertificate -DnsName "localhost" -CertStoreLocation "Cert:\LocalMachine\My"
$thumbprint = $cert.Thumbprint
$secureString = ConvertTo-SecureString "password123" -AsPlainText -Force
Export-PfxCertificate -Cert $cert -FilePath "C:\cert.pfx" -Password $secureString