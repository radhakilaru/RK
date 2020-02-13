$source = "C:\Users\H245575\Desktop\Testresults"
$destination = "https://artifactory.corp.halliburton.com/artifactory/DSC-HDS-CD-ArtifactDrop/OptimusCore/PerfDexTestResults/98"
$AF_USER ="svc_hds_build"  
$AF_PWD = ConvertTo-SecureString "Red@Dark10" -AsPlainText -Force  
$WebClient = New-Object System.Net.WebClient  
$WebClient.Credentials = New-Object System.Net.NetworkCredential($AF_USER, $AF_PWD)
$METHOD = "PUT" 

$files = Get-ChildItem $source

foreach ($file in $files)
{
    Write-Host "Uploading $file"
    $webclient.UploadFile("$destination/$file",$METHOD, $file.FullName)
} 
$webclient.Dispose()