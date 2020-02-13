$WID=[System.Security.Principal.WindowsIdentity]::GetCurrent();
$WIP=new-object System.Security.Principal.WindowsPrincipal($WID);
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator;
If ($WIP.IsInRole($adminRole)){
}else {
  $newProcess = new-object System.Diagnostics.ProcessStartInfo 'PowerShell';
  $newProcess.Arguments = $myInvocation.MyCommand.Definition
  $newProcess.Verb = 'runas'
  [System.Diagnostics.Process]::Start($newProcess);Write-Host 'Prompting for Elevation'
  exit
}
#####################
# Add Scripts Below #
#####################
Write-Host 'ElevatedCodeRunsHere';
Write-Host 'Press any key to continue...'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

Remove-Computer -ComputerName "10.133.44.94" -UnjoinDomaincredential "azhdsMR765D1509\cfe" -PassThru -Verbose -Restart -Force