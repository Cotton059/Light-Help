# ============================================================
# DeepClean_v8.0 Engine Loader V8 - Final Stable Version
# ============================================================

$ErrorActionPreference = "Stop"

# 1. Enable TLS 1.2 compatibility for older systems
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

# 2. Define the target URL
$DownloadURL = 'https://raw.githubusercontent.com/Cotton059/Light-Help/main/DeepClean_v8.0.ps1'

# 3. Generate a temporary file path
$rand = Get-Random -Maximum 99999999
$isAdmin = [bool]([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')
$FilePath = if ($isAdmin) { "$env:SystemRoot\Temp\DeepClean_v8.0_$rand.ps1" } else { "$env:TEMP\DeepClean_v8.0_$rand.ps1" }

Write-Host "[*] Launching DeepClean_v8.0 Engine..." -ForegroundColor Cyan

try {
    # 4. Perform the download
    Write-Host "[+] Downloading from GitHub..." -ForegroundColor Yellow
    $response = Invoke-WebRequest -Uri $DownloadURL -UseBasicParsing
    
    # 5. Write content to the temporary file (Force UTF8 encoding)
    $content = "# ID: $rand `r`n" + $response.Content
    Set-Content -Path $FilePath -Value $content -Encoding UTF8
    
    # 6. Core execution: Call powershell.exe and bypass execution policy
    Write-Host "[+] Running Clean Task..." -ForegroundColor Green
    Start-Process "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$FilePath`"" -Wait
}
catch {
    # Error handling to prevent crash and show reason
    Write-Host "`n[!] ERROR: " -ForegroundColor Red -NoNewline
    Write-Host $_.Exception.Message -ForegroundColor White
    Write-Host "[!] The script will stop to prevent crash." -ForegroundColor Yellow
}
finally {
    # 7. Clean up traces regardless of success or failure
    if (Test-Path $FilePath) { Remove-Item $FilePath -Force }
    Write-Host "`n[*] Task Finished. Press any key to exit..." -ForegroundColor Cyan
    $null = [Console]::ReadKey($true)
}
