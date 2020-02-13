$source = "path"
$destination = "https:///artifactory/artifactid/subfolder/"
$AF_USER ="username"  
$AF_PWD = ConvertTo-SecureString "pwd" -AsPlainText -Force  
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
