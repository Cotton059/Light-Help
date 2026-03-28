# Check the instructions here on how to use it https://github.com/Cotton059/Light-Help/wiki


$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

$DownloadURL = 
'https://raw.githubusercontent.com/Cotton059/Light-Help/main/enable_smb_and_share.cmd'

$rand = Get-Random -Maximum 99999999
$isAdmin = [bool]([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')
$FilePath = if ($isAdmin) { "$env:SystemRoot\Temp\enable_smb_and_share_$rand.cmd" } else { "$env:TEMP\enable_smb_and_share_$rand.cmd" }

try {
    $response = Invoke-WebRequest -Uri $DownloadURL -UseBasicParsing
}
catch {
    $response = Invoke-WebRequest -Uri $DownloadURL2 -UseBasicParsing
}

$ScriptArgs = "$args "
$prefix = "@REM $rand `r`n"
$content = $prefix + $response
Set-Content -Path $FilePath -Value $content

Start-Process $FilePath $ScriptArgs -Wait

$FilePaths = @("$env:TEMP\enable_smb_and_share*.cmd", "$env:SystemRoot\Temp\enable_smb_and_share*.cmd")
foreach ($FilePath in $FilePaths) { Get-Item $FilePath | Remove-Item }
