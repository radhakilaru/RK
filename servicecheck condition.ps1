$dc = ""
$pw = "" | ConvertTo-SecureString -asPlainText -Force
$usr = ""
$pc = "" # Specify the computer that should be joined to the domain.
$creds = New-Object System.Management.Automation.PSCredential($usr,$pw)
Add-Computer -ComputerName $pc -LocalCredential $pc\admin -DomainName $dc -Credential $creds -Verbose -Restart -Force
