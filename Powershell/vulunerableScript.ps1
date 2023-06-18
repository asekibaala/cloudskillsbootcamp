# This is an example PowerShell script with some common vulnerabilities
 # Vulnerability 1: Missing help comments
 function Get-User {
    # This function gets user information
    Get-ADUser -Filter * | Select-Object Name, SamAccountName
}
 # Vulnerability 2: Using aliases instead of full cmdlet names
$svc = Get-Service
$svc | Where-Object {$_.Status -eq "Stopped"} | Restart-Service
 # Vulnerability 3: Using Write-Host instead of returning output
function Get-ProcessCount {
    $count = (Get-Process).Count
    Write-Host "There are $count processes running."
}
 # Vulnerability 4: Using global variables instead of local variables
$globalVar = "This is a global variable."
 function Test-VarScope {
    $localVar = "This is a local variable."
    Write-Host $localVar
    Write-Host $globalVar
}
 Test-VarScope
 # Vulnerability 5: Not using approved verbs in function names
function Kill-Process {
    # This function kills a process
    Get-Process | Where-Object {$_.Name -eq "notepad"} | Stop-Process
}