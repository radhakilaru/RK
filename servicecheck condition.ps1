$dc = "azhdsMR765D1509"
$pw = "Landmark1" | ConvertTo-SecureString -asPlainText -Force
$usr = "$dc\cfe"
$pc = "10.133.44.94" # Specify the computer that should be joined to the domain.
$creds = New-Object System.Management.Automation.PSCredential($usr,$pw)
Add-Computer -ComputerName $pc -LocalCredential $pc\admin -DomainName $dc -Credential $creds -Verbose -Restart -Force