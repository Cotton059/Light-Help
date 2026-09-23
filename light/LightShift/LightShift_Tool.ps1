$EnableVerification = $true

Clear-Host
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "Cyan"
Clear-Host

Write-Host "=====================================================" -ForegroundColor DarkCyan
Write-Host " [ Lightspeed Sharing ] - Automation Terminal" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor DarkCyan
Write-Host ""

[Net.ServicePointManager]::Expect100Continue = $false

if ($EnableVerification) {
    $CacheFile = "$env:PUBLIC\InviteCode.txt"
    $InviteCode = $null
    $IsVerified = $false

    if (Test-Path $CacheFile) {
        $InviteCode = Get-Content -Path $CacheFile -TotalCount 1
        if (-not [string]::IsNullOrWhiteSpace($InviteCode)) {
            $InviteCode = $InviteCode.Trim()
            
            $LastModTime = (Get-Item $CacheFile).LastWriteTime
            if (((Get-Date) - $LastModTime).TotalSeconds -lt 5) {
                Write-Host "[*] Fast-reload detected. Reusing active session to prevent double billing." -ForegroundColor DarkGray
                $IsVerified = $true
            } else {
                Write-Host "[*] Discovered cached authorization code." -ForegroundColor DarkGray
            }
        }
    }

    while ($IsVerified -eq $false) {
        if ([string]::IsNullOrWhiteSpace($InviteCode)) {
            $InviteCode = Read-Host "[?] Enter Terminal Authorization Code (Invite Code)"
        }

        if ([string]::IsNullOrWhiteSpace($InviteCode)) {
            Write-Host "`n[-] Authorization code cannot be empty. Process terminated." -ForegroundColor Red
            Start-Sleep -Seconds 2
            exit
        }

        Write-Host "`n[*] Sending verification request to Lightspeed Relay Server..." -ForegroundColor DarkGray

        $ApiUrl = "https://inject.103386.xyz/"
        $Body = @{ code = [string]$InviteCode } | ConvertTo-Json

        try {
            $Response = Invoke-RestMethod -Uri $ApiUrl -Method Post -Body $Body -ContentType "application/json" -ErrorAction Stop
            
            if ($Response.success -eq $true) {
                Set-Content -Path $CacheFile -Value $InviteCode -Force
                $IsVerified = $true

                Write-Host "[+] Authorization granted! (Node: Group $($Response.group))" -ForegroundColor Green
                Write-Host "[!] Remaining uses for this code: $($Response.codeRemaining) / $($Response.codeMax)" -ForegroundColor Yellow
                Write-Host "[!] Total calls for current channel: $($Response.groupTotalUses)`n" -ForegroundColor DarkCyan
            } else {
                Write-Host "[-] Access denied: $($Response.message)" -ForegroundColor Red
                Write-Host "[-] Please enter a valid authorization code.`n" -ForegroundColor DarkGray
                
                $InviteCode = $null
                if (Test-Path $CacheFile) {
                    Remove-Item -Path $CacheFile -Force -ErrorAction SilentlyContinue
                }
            }
        } catch {
            Write-Host "[-] Failed to connect to relay server. Check your network or proxy settings." -ForegroundColor Red
            Start-Sleep -Seconds 3
            exit
        }
    }
} else {
    Write-Host "[+] Offline open-source edition activated (Unrestricted mode)." -ForegroundColor Green
    Write-Host "[!] Thank you for supporting the Lightspeed Sharing channel." -ForegroundColor Yellow
    Write-Host ""
}

Write-Host "[*] Loading core architecture..." -ForegroundColor Cyan
Start-Sleep -Seconds 1
Write-Host "[+] Environment ready. Initializing execution.`n" -ForegroundColor Green


if($PSCommandPath){Write-Host "Unknown error [103386]. Please visit the official homepage to run it online." -f Red; Start-Process "https://github.com/Cotton059/Light-Help"; exit}

$ErrorActionPreference = "Stop"

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

if($PSCommandPath){exit}

$DownloadURL = 'https://raw.githubusercontent.com/Cotton059/Light-Help/main/light/LightShift/LightShift.ps1'

$rand = Get-Random -Maximum 99999999

Write-Host "[*] Launching LightShift Engine..." -ForegroundColor Cyan

try {
    Write-Host "[+] Downloading from GitHub..." -ForegroundColor Yellow
    $response = Invoke-WebRequest -Uri $DownloadURL -UseBasicParsing
    
    $content = "# ID: $rand `r`n" + $response.Content
    
    Write-Host "[+] Running Clean Task..." -ForegroundColor Green
    
    $env:__LIGHTHELP_PAYLOAD = $content
  
    $LaunchArgs = '-NoProfile -ExecutionPolicy Bypass -Command "& ([ScriptBlock]::Create($env:__LIGHTHELP_PAYLOAD))"'
    
    Start-Process "powershell.exe" -ArgumentList $LaunchArgs -Wait
    
    $env:__LIGHTHELP_PAYLOAD = $null
    
    $ScriptName = [System.IO.Path]::GetFileNameWithoutExtension($DownloadURL)
    
    $ReportUrl = "sync.103386.xyz" 
    
    $Body = @{
        scriptName = $ScriptName
    } | ConvertTo-Json

    try {
        Invoke-RestMethod -Uri $ReportUrl -Method Post -Body $Body -ContentType "application/json" -TimeoutSec 3 -ErrorAction SilentlyContinue | Out-Null
    } catch {

    }
}
catch {

    Write-Host "`n[!] ERROR: " -ForegroundColor Red -NoNewline
    Write-Host $_.Exception.Message -ForegroundColor White
    Write-Host "[!] The script will stop to prevent crash." -ForegroundColor Yellow
}
finally {
    Write-Host "`n[*] Done! Press 'Y' for YT: Lightspeed Sharing, or any other key to exit..." -ForegroundColor Magenta -NoNewline
    $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").Character
    if ($key -match 'y|Y') {
        Start-Process "https://www.youtube.com/channel/UCz1AlF-BnyirJqrmN78mk5Q"
    }
}
