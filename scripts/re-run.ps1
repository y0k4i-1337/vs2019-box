# rerun the Boxstarter setup file. Open a PowerShell window and type: C:\scripts\re-run.ps1

$credential = New-Object System.Management.Automation.PSCredential("vagrant", (ConvertTo-SecureString "vagrant" -AsPlainText -Force))
Install-BoxstarterPackage C:\scripts\setup.ps1 -Credential $credential
