# +----------------------------------------------------------+
# |                                                          |
# |         >>> Application Data Tool <<<                    |
# |                                                          |
# +----------------------------------------------------------+
# |  Author: Lightspeed Sharing (YT)                         |
# |  Project: Cotton059/Light-Help                           |
# |  Version: V7 (Optimized for Remote & Local Execution)    |
# |  Status: Backup & Restore for Win 10/11                  |
# +----------------------------------------------------------+

# ==========================================
# Auto-Elevation to Administrator Privileges
# ==========================================
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    
    # Check if script is running from memory (Remote Raw)
    if ([string]::IsNullOrEmpty($PSCommandPath)) {
        Write-Host "`n [ERROR] Remote memory execution detected." -ForegroundColor Red
        Write-Host " Auto-elevation cannot restart an in-memory script." -ForegroundColor Yellow
        Write-Host " Please launch PowerShell as Administrator first, then execute the raw link." -ForegroundColor White
        Start-Sleep -Seconds 5
        exit
    }

    # Local execution auto-elevation
    $startProcessArgs = @{
        FilePath     = "powershell.exe"
        ArgumentList = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
        Verb         = "RunAs"
        WindowStyle  = "Normal"
    }
    Start-Process @startProcessArgs
    exit
}

# ==========================================
# Core Assemblies
# ==========================================
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

# ==========================================
# Achievement Engine (V3 Integrated)
# ==========================================
function Show-Achievement {
    param([double]$SizeGB)

    $asciiDict = @{
        '0' = @(" ### ", "#   #", "#   #", "#   #", " ### ")
        '1' = @("  #  ", " ##  ", "  #  ", "  #  ", " ### ")
        '2' = @(" ### ", "#   #", "   # ", "  #  ", "#####")
        '3' = @(" ### ", "#   #", "  ## ", "#   #", " ### ")
        '4' = @("   # ", "  ## ", " # # ", "#####", "   # ")
        '5' = @("#####", "#    ", "#### ", "    #", "#### ")
        '6' = @(" ### ", "#    ", "#### ", "#   #", " ### ")
        '7' = @("#####", "    #", "   # ", "  #  ", "  #  ")
        '8' = @(" ### ", "#   #", " ### ", "#   #", " ### ")
        '9' = @(" ### ", "#   #", " ####", "    #", " ### ")
        '+' = @("     ", "  #  ", "#####", "  #  ", "     ")
    }

    $colorList = @("Cyan", "Magenta", "Yellow", "Green", "Red", "White", "Gray", "Blue", "DarkCyan", "DarkGreen")

    $levelData = @(
        @{ Limit=5; Min=200; Max=1000; Lvl="LV1"; TagColor="Green"; Texts=@("Your basic backup has been established, and the system is running normally.", "Great, your data security has started to take effect.", "This is the starting point of stable backup.") },
        @{ Limit=10; Min=800; Max=2000; Lvl="LV2"; TagColor="Green"; Texts=@("Your backup coverage is expanding.", "Your file protection structure is starting to take shape.", "Very good, you are entering a stable accumulation phase.") },
        @{ Limit=15; Min=1500; Max=4000; Lvl="LV3"; TagColor="Yellow"; Texts=@("Your data is starting to form a systematic backup.", "The security structure is becoming more complete.", "Your backup behavior is becoming consistent.") },
        @{ Limit=20; Min=3000; Max=8000; Lvl="LV4"; TagColor="Yellow"; Texts=@("Your data assets are growing steadily.", "The backup system already has practical value.", "Your data management capability is improving.") },
        @{ Limit=25; Min=6000; Max=15000; Lvl="LV5"; TagColor="DarkYellow"; Texts=@("You are managing a noticeable scale of data assets.", "The backup structure is becoming more mature.", "Your data protection system is gradually improving.") },
        @{ Limit=30; Min=12000; Max=25000; Lvl="LV6"; TagColor="DarkYellow"; Texts=@("Your data has entered a high-density backup stage.", "The system structure is stable and continuously expanding.", "This reflects reliable data asset management.") },
        @{ Limit=35; Min=20000; Max=40000; Lvl="LV7"; TagColor="Red"; Texts=@("You have entered a high-intensity data protection phase.", "The backup system has a certain level of complexity.", "Your data assets are continuously growing.") },
        @{ Limit=40; Min=30000; Max=60000; Lvl="LV8"; TagColor="Red"; Texts=@("Your data scale is already very significant.", "A system-level backup structure is forming.", "This is a level few users can reach.") },
        @{ Limit=45; Min=50000; Max=90000; Lvl="LV9"; TagColor="Magenta"; Texts=@("You have entered an advanced data management stage.", "The backup system shows clear professional characteristics.", "Your data structure is highly stable.") },
        @{ Limit=50; Min=80000; Max=150000; Lvl="LV10"; TagColor="Magenta"; Texts=@("Your data has reached an enterprise-level backup scale.", "The system structure is highly mature.", "This reflects strong data asset management capability.") },
        @{ Limit=55; Min=120000; Max=250000; Lvl="LV11"; TagColor="DarkGray"; Texts=@("Your data scale is approaching a core system level.", "The backup structure is highly complex and stable.", "This demonstrates advanced data management capability.") },
        @{ Limit=60; Min=200000; Max=400000; Lvl="LV12"; TagColor="DarkGray"; Texts=@("You are now in an extremely high-density data management stage.", "The system structure is close to infrastructure level.", "Your data assets are very large.") },
        @{ Limit=65; Min=300000; Max=600000; Lvl="LV13"; TagColor="Cyan"; Texts=@("This is a data scale achieved by very few users.", "Your backup system is highly complete.", "You already have advanced system-level capability.") },
        @{ Limit=100000; Min=500000; Max=999999; Lvl="LV14"; TagColor="Cyan"; Texts=@("You have reached the maximum backup capacity of the system.", "This is a top-tier data asset management scale.", "Your system-level backup capability is fully developed.") }
    )

    $currentLevel = $null
    foreach ($lvl in $levelData) {
        if ($SizeGB -le $lvl.Limit) {
            $currentLevel = $lvl
            break
        }
    }
    
    if ($null -eq $currentLevel) {
        $currentLevel = $levelData[-1]
    }

    $score = Get-Random -Minimum $currentLevel.Min -Maximum ($currentLevel.Max + 1)
    $scoreStr = "+" + $score.ToString()
    
    $praiseIndex = Get-Random -Minimum 0 -Maximum $currentLevel.Texts.Count
    $praiseText = $currentLevel.Texts[$praiseIndex]
    
    [Console]::WriteLine("")
    
    $digitColors = @()
    for ($k = 0; $k -lt $scoreStr.Length; $k++) {
        $digitColors += $colorList | Get-Random
    }
    
    for ($i = 0; $i -lt 5; $i++) {
        [Console]::Write("    ")
        for ($j = 0; $j -lt $scoreStr.Length; $j++) {
            $char = $scoreStr[$j].ToString()
            $chunk = $asciiDict[$char][$i] + "  "
            [Console]::ForegroundColor = $digitColors[$j]
            [Console]::Write($chunk)
        }
        [Console]::WriteLine("")
    }
    [Console]::WriteLine("")
    
    [Console]::ForegroundColor = $currentLevel.TagColor
    [Console]::WriteLine("    [ " + $currentLevel.Lvl + " ] ACHIEVEMENT UNLOCKED")
    [Console]::ResetColor()
    [Console]::WriteLine("    > " + $praiseText)
    [Console]::WriteLine("")
}

# ==========================================
# UI Configuration
# ==========================================
function Setup-ConsoleWindow {
    $Host.UI.RawUI.WindowTitle = "Application Data Tool V19 - Professional Edition"
    
    $bufferSize = $Host.UI.RawUI.BufferSize
    $bufferSize.Width = 110
    $bufferSize.Height = 3000
    $Host.UI.RawUI.BufferSize = $bufferSize

    $windowSize = $Host.UI.RawUI.WindowSize
    $windowSize.Width = 110
    $windowSize.Height = 35
    $Host.UI.RawUI.WindowSize = $windowSize
}

function Show-Header {
    Clear-Host
    Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
    Write-Host " |     /_\                                                  |" -ForegroundColor Cyan
    Write-Host " |    ( o )    >>> APPLICATION DATA TOOL <<<                |" -ForegroundColor White
    Write-Host " |   /_____\                                                |" -ForegroundColor Cyan
    Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
    Write-Host " |  Developer: Lightspeed Sharing (YT)                      |" -ForegroundColor Magenta
    Write-Host " |  Project  : Cotton059/Light-Help                         |" -ForegroundColor Magenta
    Write-Host " |  Platform : Windows 10 / 11 Optimization                 |" -ForegroundColor Yellow
    Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
    Write-Host ""
}

function Get-DriveSelection {
    param([string]$ActionType)
    
    Write-Host " [$ActionType Mode] Scanning for available storage..." -ForegroundColor Yellow
    $drives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Free -gt 0 } | Sort-Object Name
    
    $i = 1
    foreach ($drive in $drives) {
        $freeGB = [math]::Round($drive.Free / 1GB, 2)
        $totalGB = [math]::Round(($drive.Used + $drive.Free) / 1GB, 2)
        Write-Host "   [$i] $($drive.Name):\ (Available: $freeGB GB / Total: $totalGB GB)" -ForegroundColor Green
        $i++
    }
    Write-Host "   [0] Return to Main Menu" -ForegroundColor DarkGray
    
    $choice = Read-Host "`n Select drive index"
    if ($choice -eq '0' -or [string]::IsNullOrWhiteSpace($choice)) { return $null }
    
    if ($choice -as [int] -and ($index = [int]$choice - 1) -ge 0 -and $index -lt $drives.Count) {
        return $drives[$index].Root
    } else {
        Write-Host " Invalid Selection!" -ForegroundColor Red
        Start-Sleep -Seconds 1
        return $null
    }
}

function Format-LogPath {
    param([string]$Path)
    if ($Path.Length -gt 85) {
        return "..." + $Path.Substring($Path.Length - 82)
    }
    return $Path
}

function Show-Dashboard {
    param([string]$Action, [string]$FilePath, [int]$TotalFiles, [int]$SkippedFiles, [TimeSpan]$ElapsedTime)
    
    $fileInfo = Get-Item $FilePath
    $sizeMB = $fileInfo.Length / 1MB
    $sizeGB = $fileInfo.Length / 1GB
    $displaySize = if ($sizeMB -ge 1024) { "{0:N2} GB" -f ($sizeMB/1024) } else { "{0:N2} MB" -f $sizeMB }

    # Base description based on file size
    if ($sizeMB -lt 500) {
        $rank = "[ A ] LITE ARCHIVE"
        $rankColor = "Green"
        $desc = "Efficient! Core data has been processed. Minimal footprint maintained."
    } elseif ($sizeMB -lt 2048) {
        $rank = "[ S ] STANDARD ARCHIVE"
        $rankColor = "Cyan"
        $desc = "Optimal! Perfect data volume for standard system configurations."
    } elseif ($sizeMB -lt 10240) {
        $rank = "[ SS ] EPIC ARCHIVE"
        $rankColor = "Yellow"
        $desc = "Massive! High-volume data stream handled successfully."
    } else {
        $rank = "[ SSS ] GODLIKE ARCHIVE"
        $rankColor = "Magenta"
        $desc = "Legendary! Large-scale data architecture securely managed."
    }

    # Override description for RESTORE action with fixed Light-Help English branding
    if ($Action -eq "RESTORE") {
        $desc = "Light-Help has successfully restored your data."
    }

    Write-Host "`n=======================================================" -ForegroundColor White
    Write-Host " [!] TASK COMPLETED : $Action" -ForegroundColor Yellow
    Write-Host -NoNewline " [!] RANK : " -ForegroundColor White; Write-Host $rank -ForegroundColor $rankColor
    Write-Host " [!] SIZE : $displaySize" -ForegroundColor White
    Write-Host " [!] NOTE : $desc" -ForegroundColor White
    Write-Host "-------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "  > Objects Processed : $($TotalFiles.ToString('N0'))" -ForegroundColor Gray
    Write-Host "  > Objects Bypassed  : $($SkippedFiles.ToString('N0')) (Locked Files)" -ForegroundColor Gray
    $timeStr = "{0:00} Min {1:00} Sec" -f $ElapsedTime.Minutes, $ElapsedTime.Seconds
    Write-Host "  > Time Elapsed      : $timeStr" -ForegroundColor Gray
    Write-Host "  > Output Destination: $($fileInfo.Name)" -ForegroundColor DarkCyan
    Write-Host "=======================================================" -ForegroundColor White

    # >>> THIS IS YOUR ACHIEVEMENT SYSTEM TRIGGER <<<
    # It only activates when the task action is "BACKUP"
    if ($Action -eq "BACKUP") {
        Show-Achievement -SizeGB $sizeGB
    }
}

# ==========================================
# Core Operations
# ==========================================
function Invoke-Backup {
    Show-Header
    $srcDir = $env:USERPROFILE
    Write-Host " --> Source Directory: $srcDir" -ForegroundColor Cyan
    
    $targetDrive = Get-DriveSelection -ActionType "Backup"
    if (-not $targetDrive) { return }
    
    $backupDir = Join-Path -Path $targetDrive -ChildPath "App_Backup_Data"
    if (-not (Test-Path -Path $backupDir)) {
        New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
    }
    
    $currentTime = Get-Date -Format "yyyy-MM-dd_HHmm"
    $backupFile = Join-Path -Path $backupDir -ChildPath "Backup_$currentTime.zip"
    
    Write-Host "`n [!] Initializing data stream..." -ForegroundColor Yellow
    $startTime = Get-Date
    
    try {
        $zip = [System.IO.Compression.ZipFile]::Open($backupFile, [System.IO.Compression.ZipArchiveMode]::Create)
        $srcParentLength = (Get-Item $srcDir).Parent.FullName.Length
        
        $files = Get-ChildItem -Path $srcDir -Recurse -File -Force -ErrorAction SilentlyContinue
        $totalCount = $files.Count
        $current = 0
        $skipped = 0
        
        Write-Host "-----------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host " Running Backup Engine..." -ForegroundColor Yellow
        Write-Host ""
        Write-Host ""
        $cursorTop = [math]::Max(0, [Console]::CursorTop - 2)

        # Performance Boost: Stopwatch for UI throttling
        $uiThrottle = [System.Diagnostics.Stopwatch]::StartNew()

        foreach ($file in $files) {
            $current++
            $relativePath = $file.FullName.Substring($srcParentLength).TrimStart("\").TrimStart("/")
            
            # Fast fail logic: No sleep delays, instantly bypass locked system files
            try {
                $entry = $zip.CreateEntry($relativePath, [System.IO.Compression.CompressionLevel]::Optimal)
                $eStream = $entry.Open()
                $fStream = [System.IO.File]::Open($file.FullName, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
                $fStream.CopyTo($eStream)
                $fStream.Dispose()
                $eStream.Dispose()
            } catch {
                $skipped++
                if ($null -ne $fStream) { $fStream.Dispose() }
                if ($null -ne $eStream) { $eStream.Dispose() }
                try { if ($null -ne $entry) { $entry.Delete() } } catch {}
            }

            # Performance Boost: Update UI only every 150ms or at the last file
            if ($uiThrottle.ElapsedMilliseconds -ge 150 -or $current -eq $totalCount) {
                $displayPath = Format-LogPath -Path $relativePath
                $percent = if ($totalCount -gt 0) { [int](($current / $totalCount) * 100) } else { 0 }
                
                $barLength = 40
                $filledCount = [int]($percent / (100 / $barLength))
                if ($filledCount -gt $barLength) { $filledCount = $barLength }
                $bar = ("#" * $filledCount) + ("-" * ($barLength - $filledCount))
                
                $pathLine = "   $displayPath".PadRight(100).Substring(0, 100)
                $statusLine = "   PROGRESS [$bar] $percent% ($current/$totalCount)".PadRight(100).Substring(0, 100)

                [Console]::SetCursorPosition(0, $cursorTop)
                [Console]::ForegroundColor = [ConsoleColor]::DarkGreen
                [Console]::WriteLine($pathLine)
                [Console]::ForegroundColor = [ConsoleColor]::Cyan
                [Console]::Write($statusLine)

                $uiThrottle.Restart()
            }
        }
        
        [Console]::WriteLine()
        [Console]::ResetColor()
        
        $elapsed = (Get-Date) - $startTime
        # This sends "BACKUP" action, which triggers the achievement
        Show-Dashboard -Action "BACKUP" -FilePath $backupFile -TotalFiles $current -SkippedFiles $skipped -ElapsedTime $elapsed

    } catch {
        Write-Host "`n [FATAL ERROR] Operation Failed: $($_.Exception.Message)" -ForegroundColor Red
    } finally {
        if ($zip) { $zip.Dispose() }
    }
}

function Invoke-Restore {
    Show-Header
    $targetDrive = Get-DriveSelection -ActionType "Restore"
    if (-not $targetDrive) { return }
    
    $backupDir = Join-Path -Path $targetDrive -ChildPath "App_Backup_Data"
    if (-not (Test-Path -Path $backupDir)) {
        Write-Host "`n [ERROR] Backup directory not found on $($targetDrive)" -ForegroundColor Red
        Start-Sleep -Seconds 2
        return
    }

    $backupFiles = Get-ChildItem -Path $backupDir -Filter "*.zip" | Sort-Object LastWriteTime -Descending
    if ($backupFiles.Count -eq 0) {
        Write-Host "`n [ERROR] No backup archives detected." -ForegroundColor Red
        Start-Sleep -Seconds 2
        return
    }

    Write-Host "`n Select Archive to Deploy:" -ForegroundColor Yellow
    $bIndex = 1
    foreach ($bFile in $backupFiles) {
        Write-Host "   [$bIndex] $($bFile.Name) ($([math]::Round($bFile.Length/1MB, 2)) MB)" -ForegroundColor Green
        $bIndex++
    }

    $bChoice = Read-Host "`n Select index (0 to Cancel)"
    if ($bChoice -eq '0' -or [string]::IsNullOrWhiteSpace($bChoice)) { return }

    if ($bChoice -as [int] -and ($idx = [int]$bChoice - 1) -ge 0 -and $idx -lt $backupFiles.Count) {
        $backupFile = $backupFiles[$idx].FullName
    } else { return }
    
    $destParent = (Get-Item $env:USERPROFILE).Parent.FullName
    
    Write-Host "`n [CONFIRMATION] This will overwrite system data. Proceed? (Y/N)" -ForegroundColor Red
    if ((Read-Host) -match "^[Yy]$") {
        $startTime = Get-Date
        try {
            $zip = [System.IO.Compression.ZipFile]::OpenRead($backupFile)
            $totalCount = $zip.Entries.Count
            $current = 0
            $skipped = 0

            Write-Host "-----------------------------------------------------------------------------------------" -ForegroundColor DarkGray
            Write-Host " Running Restore Engine..." -ForegroundColor Yellow
            Write-Host ""
            Write-Host ""
            $cursorTop = [math]::Max(0, [Console]::CursorTop - 2)
            
            $uiThrottle = [System.Diagnostics.Stopwatch]::StartNew()

            foreach ($entry in $zip.Entries) {
                $current++
                
                try {
                    $targetPath = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($destParent, $entry.FullName))
                    $dir = [System.IO.Path]::GetDirectoryName($targetPath)
                    if (-not (Test-Path -Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
                    if ($entry.Name -ne "") { [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $targetPath, $true) }
                } catch { $skipped++ }

                if ($uiThrottle.ElapsedMilliseconds -ge 150 -or $current -eq $totalCount) {
                    $percent = [int](($current / $totalCount) * 100)
                    $bar = ("#" * [int]($percent/2.5)) + ("-" * (40 - [int]($percent/2.5)))
                    $displayPath = Format-LogPath -Path $entry.FullName
                    
                    [Console]::SetCursorPosition(0, $cursorTop)
                    [Console]::ForegroundColor = [ConsoleColor]::DarkCyan
                    [Console]::WriteLine("   $displayPath".PadRight(100).Substring(0, 100))
                    [Console]::ForegroundColor = [ConsoleColor]::Cyan
                    [Console]::Write("   PROGRESS [$bar] $percent% ($current/$totalCount)".PadRight(100).Substring(0, 100))
                    
                    $uiThrottle.Restart()
                }
            }
            [Console]::WriteLine()
            
            # This sends "RESTORE" action, which silently bypasses the achievement trigger
            Show-Dashboard -Action "RESTORE" -FilePath $backupFile -TotalFiles $current -SkippedFiles $skipped -ElapsedTime ((Get-Date) - $startTime)
        } finally { if ($zip) { $zip.Dispose() } }
    }
}

# ==========================================
# Main Loop
# ==========================================
function Main {
    Setup-ConsoleWindow
    while ($true) {
        Show-Header
        Write-Host "   [1] SYSTEM DATA BACKUP (Full Profile)" -ForegroundColor Cyan
        Write-Host "   [2] SYSTEM DATA RESTORE (Deploy Archive)" -ForegroundColor Cyan
        Write-Host "   [0] EXIT" -ForegroundColor DarkGray
        
        $choice = (Read-Host "`n Selection").Trim()
        if ($choice -eq "1") { Invoke-Backup; Read-Host "`n Press Enter to continue..." }
        elseif ($choice -eq "2") { Invoke-Restore; Read-Host "`n Press Enter to continue..." }
        elseif ($choice -eq "0") { break }
    }
}

Main
