# Force UTF8 Encoding for current session
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "SilentlyContinue"

# ==========================================
# 1. VISUAL UI HEADER (V7)
# ==========================================
Clear-Host
Write-Host ""
Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
Write-Host " |                                                          |" -ForegroundColor Cyan
Write-Host " |          >>> WINDOWS DEEP CLEANING ENGINE V7 <<<         |" -ForegroundColor Green
Write-Host " |                                                          |" -ForegroundColor Cyan
Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
Write-Host " |  Author: Lightspeed Sharing                              |" -ForegroundColor Yellow
Write-Host " |  GitHub: https://github.com/Cotton059/Light-Help         |" -ForegroundColor Yellow
Write-Host " |  Status: Real-Time Matrix Scan (Exact Count Mode)        |" -ForegroundColor DarkGray
Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
Write-Host ""

# ==========================================
# 2. PRE-SCAN CONSENT
# ==========================================
Write-Host "[?] Engine will traverse ALL directories to locate junk files." -ForegroundColor Cyan
$scanConsent = Read-Host ">>> Ready to start massive scan protocol? [Y/n] (Default: Y)"

if ($scanConsent -ne "" -and $scanConsent -notmatch "^[Yy]$") {
    Write-Host "`n[-] Operation aborted by user." -ForegroundColor Red
    exit
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
# 4. REAL-TIME WATERFALL SCAN (Exact Count Engine)
# ==========================================
Write-Host "`n[*] Initializing FULL UNLIMITED scan protocol..." -ForegroundColor Cyan
Write-Host "------------------------------------------------------------" -ForegroundColor DarkGray

$global:foundTargets = @()
$global:totalScanned = 0  # <--- Global counter added here
$targetKeywords = "Temp|Cache|CrashDumps|LogFiles"
$baseScanPath = $env:USERPROFILE

# Custom Recursive Function for real-time printing and exact counting
function Invoke-RealTimeScan {
    param([string]$CurrentPath)
    try {
        $dirs = Get-ChildItem -Path $CurrentPath -Directory -Force -ErrorAction SilentlyContinue
        foreach ($dir in $dirs) {
            $global:totalScanned++  # Increment counter for EVERY directory seen
            $dirPath = $dir.FullName
            
            # Print EVERY single directory instantly
            Write-Host " [Scan] $dirPath" -ForegroundColor DarkGray
            
            # Highlight target when locked
            if ($dir.Name -match $targetKeywords) {
                Write-Host " [>>>] TARGET LOCKED: $dirPath" -ForegroundColor Yellow
                $global:foundTargets += $dir
            }
            
            # Recursively dive deeper
            Invoke-RealTimeScan -CurrentPath $dirPath
        }
    } catch {}
}

# Start the massive scan
Invoke-RealTimeScan -CurrentPath $baseScanPath

# Scan System-level Paths
$systemJunkPaths = @(
    "$env:TEMP",
    "$env:WINDIR\Temp",
    "$env:WINDIR\Prefetch",
    "$env:WINDIR\SoftwareDistribution\Download"
)

foreach ($sysPath in $systemJunkPaths) {
    $global:totalScanned++  # Count system paths too
    if (Test-Path $sysPath) {
        $dirItem = Get-Item $sysPath
        Write-Host " [>>>] SYSTEM TARGET: $($dirItem.FullName)" -ForegroundColor Red
        $global:foundTargets += $dirItem
    }
}

Write-Host "------------------------------------------------------------" -ForegroundColor DarkGray

# ==========================================
# 5. EXECUTION CONSENT
# ==========================================
if ($global:foundTargets.Count -eq 0) {
    Write-Host "`n[V] Congratulations! No junk directories found." -ForegroundColor Green
    Read-Host "`nPress Enter to exit..."
    exit
}

# Format the massive number with commas (e.g., 45,123)
$formattedTotal = "{0:N0}" -f $global:totalScanned

Write-Host "`n[*] Analysis Complete! Scanned $formattedTotal paths, locked $($global:foundTargets.Count) junk zones." -ForegroundColor Green
$confirm = Read-Host ">>> Authorize deep cleaning now? [Y/n] (Default: Y)"

if ($confirm -ne "" -and $confirm -notmatch "^[Yy]$") {
    Write-Host "`n[-] Cleaning cancelled. No files were deleted." -ForegroundColor DarkGray
    exit
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

Read-Host "Press Enter to close..."
