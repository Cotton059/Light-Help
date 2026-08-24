param (
    [switch]$Silent  # Switch for remote or automated execution without user prompts
)

# Force UTF8 Encoding for current session
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "SilentlyContinue"

# ==========================================
# 1. VISUAL UI HEADER (V8)
# ==========================================
Clear-Host
Write-Host ""
Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
Write-Host " |                                                          |" -ForegroundColor Cyan
Write-Host " |          >>> WINDOWS DEEP CLEANING ENGINE V8 <<<         |" -ForegroundColor Green
Write-Host " |                                                          |" -ForegroundColor Cyan
Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
Write-Host " | Author: Lightspeed Sharing (YT)                          |" -ForegroundColor Yellow
Write-Host " | Project: Cotton059/Light-Help                            |" -ForegroundColor Yellow
Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
Write-Host " | Status: Safe Mode Matrix Scan (White-List Active)        |" -ForegroundColor DarkGray
Write-Host " | Shield: Web Browsers, Cloud Notes, Office/Creative Tools |" -ForegroundColor DarkGray
Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
Write-Host ""

# ==========================================
# 2. PRE-SCAN CONSENT
# ==========================================
Write-Host "[?] Engine will traverse directories to locate junk files." -ForegroundColor Cyan

if (-not $Silent) {
    $scanConsent = Read-Host ">>> Ready to start safe scan protocol? [Y/n] (Default: Y)"
    if ($scanConsent -ne "" -and $scanConsent -notmatch "^[Yy]$") {
        Write-Host "`n[-] Operation aborted by user." -ForegroundColor Red
        exit
    }
} else {
    Write-Host ">>> Running in SILENT mode. Prompts bypassed." -ForegroundColor DarkGray
}

# ==========================================
# 3. PRIVILEGE CHECK
# ==========================================
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "`n[!] NOTICE: Not running as Administrator." -ForegroundColor Red
    Write-Host "    System-level logs and Temp folders will be skipped.`n" -ForegroundColor DarkGray
    Start-Sleep -Seconds 1
}

# ==========================================
# 4. REAL-TIME WATERFALL SCAN (Safe Engine)
# ==========================================
Write-Host "`n[*] Initializing SAFE UNLIMITED scan protocol..." -ForegroundColor Cyan
Write-Host "------------------------------------------------------------" -ForegroundColor DarkGray

# Optimized: Using Generic List for maximum performance handling large arrays
$global:foundTargets = New-Object System.Collections.Generic.List[object]
$global:totalScanned = 0

# Protection White-List: Explicitly excluding paths matching these keywords
$protectedSuites = "Chrome|Edge|Firefox|Brave|Notion|Obsidian|Evernote|OneNote|Microsoft|Adobe|Office|Code|Discord"
$targetKeywords = "Temp|Cache|CrashDumps|LogFiles"
$baseScanPath = $env:USERPROFILE

# Optimized: Safe Recursive Function
function Invoke-SafeRealTimeScan {
    param([string]$CurrentPath)
    try {
        $dirs = Get-ChildItem -Path $CurrentPath -Directory -Force -ErrorAction SilentlyContinue
        foreach ($dir in $dirs) {
            $dirPath = $dir.FullName
            
            # [!] SAFETY SHIELD: Skip completely if path matches protected software
            if ($dirPath -match $protectedSuites) {
                continue 
            }

            $global:totalScanned++
            Write-Host " [Scan] $dirPath" -ForegroundColor DarkGray
            
            # Target acquired
            if ($dir.Name -match $targetKeywords) {
                Write-Host " [>>>] TARGET LOCKED: $dirPath" -ForegroundColor Yellow
                $global:foundTargets.Add($dir)
            } else {
                # Recursively dive deeper only for unprotected paths
                Invoke-SafeRealTimeScan -CurrentPath $dirPath
            }
        }
    } catch {}
}

# Start the massive safe scan
Invoke-SafeRealTimeScan -CurrentPath $baseScanPath

# Scan System-level Paths
$systemJunkPaths = @(
    "$env:TEMP",
    "$env:WINDIR\Temp",
    "$env:WINDIR\Prefetch",
    "$env:WINDIR\SoftwareDistribution\Download"
)

foreach ($sysPath in $systemJunkPaths) {
    $global:totalScanned++
    if (Test-Path $sysPath) {
        $dirItem = Get-Item $sysPath
        Write-Host " [>>>] SYSTEM TARGET: $($dirItem.FullName)" -ForegroundColor Red
        $global:foundTargets.Add($dirItem)
    }
}

Write-Host "------------------------------------------------------------" -ForegroundColor DarkGray

# ==========================================
# 5. EXECUTION CONSENT & SUMMARY
# ==========================================
if ($global:foundTargets.Count -eq 0) {
    Write-Host "`n[V] Congratulations! No junk directories found or all within protected zones." -ForegroundColor Green
    if (-not $Silent) { Read-Host "`nPress Enter to exit..." }
    exit
}

$formattedTotal = "{0:N0}" -f $global:totalScanned
Write-Host "`n[*] Analysis Complete! Scanned $formattedTotal paths, locked $($global:foundTargets.Count) junk zones." -ForegroundColor Green
Write-Host " -> Protected: Web Browsers, Cloud Notes, Office & Creative Suites skipped." -ForegroundColor Cyan

if (-not $Silent) {
    $confirm = Read-Host ">>> Authorize safe deep cleaning now? [Y/n] (Default: Y)"
    if ($confirm -ne "" -and $confirm -notmatch "^[Yy]$") {
        Write-Host "`n[-] Cleaning cancelled. No files were deleted." -ForegroundColor DarkGray
        exit
    }
}

# ==========================================
# 6. SHREDDING PROCESS
# ==========================================
Write-Host "`n[*] Shredding files..." -ForegroundColor Cyan
$totalFreedBytes = 0

foreach ($folder in $global:foundTargets) {
    $folderPath = $folder.FullName
    Write-Host "  -> Clearing: $folderPath" -ForegroundColor DarkGray

    $size = (Get-ChildItem -Path $folderPath -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
    if ($null -ne $size) { $totalFreedBytes += $size }

    Remove-Item -Path "$folderPath\*" -Recurse -Force -ErrorAction SilentlyContinue
}

# ==========================================
# 7. FINAL REPORT
# ==========================================
$freedMB = [math]::Round($totalFreedBytes / 1MB, 2)
$freedGB = [math]::Round($totalFreedBytes / 1GB, 2)

Write-Host "`n=======================================================" -ForegroundColor Cyan
Write-Host " [OK] TASK COMPLETED!" -ForegroundColor Green

if ($totalFreedBytes -gt 1GB) {
    Write-Host " [!] Released: $freedGB GB of disk space." -ForegroundColor Yellow
} elseif ($freedMB -gt 0) {
    Write-Host " [!] Released: $freedMB MB of disk space." -ForegroundColor Yellow
} else {
    Write-Host " [V] System is already optimized." -ForegroundColor Yellow
}

Write-Host ""
Write-Host " Support: Lightspeed Sharing (YT)" -ForegroundColor Magenta
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""

if (-not $Silent) { Read-Host "Press Enter to close..." }
