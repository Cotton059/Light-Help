[Console]::OutputEncoding = [System.Text.Encoding]::UTF8;
$Host.UI.RawUI.WindowTitle = "LightShift | Profile Migration Tool V7";

    $p = $MyInvocation.MyCommand.Definition
    if (Test-Path $p) {
        $c = Get-Content $p -Raw
        $k = (@(72,116,121,121,116,115,53,58,62,52,81,110,108,109,121,50,77,106,113,117) | ForEach-Object { [char]($_ - 5) }) -join ''
        if ($c -cnotmatch [regex]::Escape($k)) {
            Write-Host "Exception calling `"CreateInstance`" with `"1`" argument(s): `"Retrieving the COM class factory for component with CLSID {B196B287-BAB4-101A-B69C-00AA00341D07} failed due to the following error: 80040154 Class not registered (Exception from HRESULT: 0x80040154 (REGDB_E_CLASSNOTREG)).`"" -ForegroundColor Red
            Write-Host "At line:14 char:5" -ForegroundColor Red
            Write-Host "+     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -ForegroundColor Red
            Write-Host "    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException" -ForegroundColor Red
            Write-Host "    + FullyQualifiedErrorId : COMException" -ForegroundColor Red
            Start-Sleep -Seconds 3
            Exit
        }
    }

function Show-Banner {
    Clear-Host;
    Write-Host -Object:" +----------------------------------------------------------+" -ForegroundColor:Cyan;
    Write-Host -Object:" |      /_\                                                 |" -ForegroundColor:Cyan;
    Write-Host -Object:" |     ( o )    >>> LightShift TOOL <<<                     |" -ForegroundColor:Cyan;
    Write-Host -Object:" |    /_____\                                               |" -ForegroundColor:Cyan;
    Write-Host -Object:" +----------------------------------------------------------+" -ForegroundColor:Cyan;
    Write-Host -Object:" |  Developer: Lightspeed Sharing (YT)                      |" -ForegroundColor:DarkCyan;
    Write-Host -Object:" |  Project  : Cotton059/Light-Help                         |" -ForegroundColor:DarkCyan;
    Write-Host -Object:" |  Platform : Windows 10 / 11 Optimization                 |" -ForegroundColor:DarkCyan;
    Write-Host -Object:" +----------------------------------------------------------+" -ForegroundColor:Cyan;
    Write-Host -Object:"";
}

function Show-DynamicProgressBar {
    param (
        [int]$Percentage,
        [string]$BarColor,
        [string]$Label,
        [string]$MemoryText
    )
    $TotalBlocks = 20;
    $FilledBlocks = [math]::Round(($Percentage / 100) * $TotalBlocks);
    if ($FilledBlocks -gt $TotalBlocks) { $FilledBlocks = $TotalBlocks; }
    if ($FilledBlocks -lt 0) { $FilledBlocks = 0; }
    $EmptyBlocks = $TotalBlocks - $FilledBlocks;

    $SolidBlock = [char]0x2588;
    $LightBlock = [char]0x2591;

    Write-Host -Object:"$Label " -NoNewline -ForegroundColor:White;
    Write-Host -Object:"`n[" -NoNewline -ForegroundColor:White;

    for ($i = 0; $i -lt $FilledBlocks; $i++) {
        Write-Host -Object:$SolidBlock -NoNewline -ForegroundColor:$BarColor;
    }
    for ($i = 0; $i -lt $EmptyBlocks; $i++) {
        Write-Host -Object:$LightBlock -NoNewline -ForegroundColor:DarkGray;
    }

    Write-Host -Object:"] " -NoNewline -ForegroundColor:White;
    Write-Host -Object:"$Percentage%  " -NoNewline -ForegroundColor:White;
    Write-Host -Object:$MemoryText -ForegroundColor:Gray;
    Write-Host -Object:"";
}

function Show-EndScreen {
    Write-Host -Object:"`n============================================================" -ForegroundColor:Cyan;
    Write-Host -Object:"[SUCCESS] Task completed successfully." -ForegroundColor:Green;
    Write-Host -Object:"`n[ACTION] Press Enter to finalize and logoff." -ForegroundColor:Yellow;
    Write-Host -Object:"Support: Lightspeed Sharing (YT)" -ForegroundColor:Magenta;
    Write-Host -Object:"============================================================" -ForegroundColor:Cyan;
    Read-Host;
}

if ($env:__LIGHTHELP_RUNNING -eq "1" -or $env:__ELEVATED -eq "1") {
} else {
    $env:__LIGHTHELP_RUNNING = "1";
}

if ($Host.Name -ne "ConsoleHost") {
    Write-Host -Object:"[!] WARNING: Non-standard Host Environment. Continuing..." -ForegroundColor:Yellow;
    Start-Sleep -Seconds:1;
}

function Write-ElevLog {
    param ([string]$Message)
    try {
        $logPath = Join-Path -Path:$env:TEMP -ChildPath:"github_elevation.log";
        $time = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss");
        Add-Content -Path:$logPath -Value:"[$time]$Message";
    } catch {}
}

function Get-CurrentShell {
    try { if ($PSVersionTable.PSEdition -eq "Core") { "pwsh" } else { "powershell" } } catch { "powershell" }
}

$isAdmin = try {
    ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator);
} catch { $false }

if (-not $isAdmin) {
    Write-ElevLog -Message:"User is not elevated. Initiating elevation sequence.";
    
    $ScriptPath =$PSCommandPath;
    if ([string]::IsNullOrWhiteSpace($ScriptPath)) { $ScriptPath =$MyInvocation.MyCommand.Path; }

    if ([string]::IsNullOrWhiteSpace($ScriptPath)) {
        Write-Host -Object:"[!] FATAL: Memory execution detected or path unknown." -ForegroundColor:Red;
        Start-Sleep -Seconds:5;
        exit;
    }

    $shell = Get-CurrentShell;
    if ($shell -eq "pwsh") { $exe = "pwsh.exe"; } else { $exe = "powershell.exe"; }

    if ($exe -eq "pwsh.exe" -and -not (Get-Command -Name:pwsh.exe -ErrorAction:SilentlyContinue)) {
        $exe = "powershell.exe";
    }

    Write-Host -Object:"[*] Requesting Administrator privileges..." -ForegroundColor:Yellow;
    
    $argList = @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "`"$ScriptPath`"");
    $env:__ELEVATED = "1";
    $env:__LIGHTHELP_RUNNING = "0";

    try {
        Start-Process -FilePath:$exe -ArgumentList:$argList -Verb:RunAs -WorkingDirectory:(Get-Location);
    } catch {
        Write-Host -Object:"`n[!] Elevation Cancelled or Failed." -ForegroundColor:Red;
    }
    
    Write-Host -Object:"`n[INFO] Relaunching as Administrator..." -ForegroundColor:Cyan;
    Read-Host -Prompt:"Press Enter to close this window...";
    exit;
} else {
    Write-ElevLog -Message:"Running with Administrator privileges.";
}

$ConfigFile = "$env:PUBLIC\LightHelp_MigrateConfig.json";

if ($env:USERNAME -ne "Administrator") {

    Show-Banner;

    $SourceUser =$env:USERNAME;
    $SourcePath =$env:USERPROFILE;
    
    $FolderItem = Get-Item -Path:$SourcePath -ErrorAction:SilentlyContinue;
    if ($FolderItem.Attributes -match "ReparsePoint") {
        Write-Host -Object:"`n[!] ABORT: Target profile is ALREADY a Directory Junction!" -ForegroundColor:Yellow;
        Read-Host;
        exit;
    }

    Write-Host -Object:"[*] Auto-detected active user: " -NoNewline;
    Write-Host -Object:$SourceUser -ForegroundColor:Green;
    Write-Host -Object:"[*] Source path: " -NoNewline;
    Write-Host -Object:$SourcePath -ForegroundColor:Green;

    $AllDrives = Get-CimInstance -ClassName:Win32_LogicalDisk;
    $ValidDrives = @();
    for ($i = 0; $i -lt $AllDrives.Count; $i++) {
        if ($AllDrives[$i].DriveType -eq 3 -and $AllDrives[$i].DeviceID -ne "C:") {
            $ValidDrives += $AllDrives[$i];
        }
    }

    if ($ValidDrives.Count -eq 0) {
        Write-Host -Object:"`n[x] FATAL ERROR: No secondary drive!" -ForegroundColor:Red;
        Read-Host;
        exit;
    }

    $DriveListArray = @();
    for ($i = 0; $i -lt$ValidDrives.Count; $i++) {$DriveListArray += $ValidDrives[$i].DeviceID.Replace(":", "");
    }
    
    $DriveListString =$DriveListArray -join ", ";

    Write-Host -Object:"`n[*] Detected available target drives: " -NoNewline;
    Write-Host -Object:$DriveListString -ForegroundColor:Yellow;

    $TargetDrive = Read-Host -Prompt:"`n[?] Enter target drive letter from the list above";
    if ([string]::IsNullOrWhiteSpace($TargetDrive)) { exit; }
    
    $TargetDrive =$TargetDrive.Replace(":", "").Replace("\", "").Trim().ToUpper();

    $isMatch =$false;
    for ($i = 0; $i -lt $DriveListArray.Count; $i++) {
        if ($TargetDrive -eq $DriveListArray[$i]) {
            $isMatch =$true;
        }
    }

    if (-not $isMatch) {
        Write-Host -Object:"`n[x] FATAL ERROR: Selection invalid!" -ForegroundColor:Red;
        Read-Host;
        exit;
    }
    
    $BackupDir = "${TargetDrive}:\App_Backup_Data";
    
    if (-not (Test-Path -Path:$BackupDir)) {
        Write-Host -Object:"`n[x] CRITICAL: Backup directory 'App_Backup_Data' NOT FOUND on drive ${TargetDrive}:!" -ForegroundColor:Red;
        Write-Host -Object:"[*] You MUST perform a backup before executing this migration script to ensure data safety." -ForegroundColor:Yellow;
        Read-Host -Prompt:"Press Enter to exit...";
        exit;
    }

    $Backups = Get-ChildItem -Path:$BackupDir -Filter:"*.zip" -File;
    
    if ($Backups.Count -eq 0) {
        Write-Host -Object:"`n[x] CRITICAL: No backup archives (*.zip) found in ${TargetDrive}:\App_Backup_Data!" -ForegroundColor:Red;
        Write-Host -Object:"[*] You MUST perform a backup before executing this migration script to ensure data safety." -ForegroundColor:Yellow;
        Read-Host -Prompt:"Press Enter to exit...";
        exit;
    }

    Write-Host -Object:"`n[*] Backup Verification: Currently detected the following backup(s):" -ForegroundColor:Cyan;
    for ($i = 0; $i -lt$Backups.Count; $i++) {$bytes = $Backups[$i].Length;
        $sizeFormat = "";
        if ($bytes -gt 1073741824) {$sizeFormat = "$([math]::Round(($bytes / 1073741824), 2)) GB";
        } else {
            $sizeFormat = "$([math]::Round(($bytes / 1048576), 2)) MB";
        }
        $fileName = $Backups[$i].Name;
        Write-Host -Object:"    - $fileName ($sizeFormat)" -ForegroundColor:Green;
    }

    Write-Host -Object:"`n[!] WARNING: Due to potential interferences in different environments, you MUST possess a valid backup before executing the migration to ensure data safety." -ForegroundColor:Magenta;
    Write-Host -Object:"[!] If the migration fails, you can use this backup to manually restore your data." -ForegroundColor:Magenta;
    
    $Confirm = Read-Host -Prompt:"`nIf you understand, please manually input YES to confirm and execute";
    if ($Confirm -cne "YES") {
        Write-Host -Object:"`n[x] Migration aborted by user." -ForegroundColor:Yellow;
        Start-Sleep -Seconds:2;
        exit;
    }

    $TargetPath = "${TargetDrive}:\Users\$SourceUser";

    $Config = @{
        SourceUser = $SourceUser;
        SourcePath = $SourcePath;
        TargetPath = $TargetPath;
    };
    
    $JsonData = ConvertTo-Json -InputObject:$Config;
    Set-Content -Path:$ConfigFile -Value:$JsonData -Encoding:UTF8;

    Write-Host -Object:"`n[*] Activating built-in machine Administrator..." -ForegroundColor:Yellow;
    $null = net user administrator /active:yes;

    $WinlogonPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon";
    Set-ItemProperty -Path:$WinlogonPath -Name:"AutoAdminLogon" -Value:"1";
    Set-ItemProperty -Path:$WinlogonPath -Name:"DefaultUserName" -Value:"Administrator";
    Set-ItemProperty -Path:$WinlogonPath -Name:"DefaultPassword" -Value:"";

    $RunOnceKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce";
    $LaunchCommand = "powershell.exe -ExecutionPolicy Bypass -NoExit -WindowStyle Normal -File `"$PSCommandPath`"";
    Set-ItemProperty -Path:$RunOnceKey -Name:"LightHelp_ProfileMigrate" -Value:$LaunchCommand;

    Write-Host -Object:"`n[!] Environment staging complete. Press Enter to RESTART..." -ForegroundColor:Magenta;
    Read-Host;
    Restart-Computer -Force;
}
else {

    Show-Banner;

    if (-not (Test-Path -Path:$ConfigFile)) {
        Write-Host -Object:"`n[x] Runtime blueprint missing!" -ForegroundColor:Red;
        Read-Host;
        exit;
    }

    $ConfigRaw = Get-Content -Path:$ConfigFile -Raw;
    $Config = ConvertFrom-Json -InputObject:$ConfigRaw;
    $SourcePath =$Config.SourcePath;
    $TargetPath =$Config.TargetPath;

    Write-Host -Object:"`n[*] Stripping platform anchors..." -ForegroundColor:Yellow;
    Stop-Service -Name:WSearch -Force -ErrorAction:SilentlyContinue;
    Stop-Process -Name:OneDrive -Force -ErrorAction:SilentlyContinue;
    Start-Sleep -Seconds:2;

    Write-Host -Object:"`n[*] Deploying Robocopy..." -ForegroundColor:Cyan;
    
    robocopy.exe $SourcePath$TargetPath /E /COPY:DATSO /XJ /B /R:1 /W:1 /XF *.lock *.LOG1 *.LOG2 /XD "AppData\Local\Temp" "AppData\Local\Microsoft\Windows\WebCache";

    if ($LASTEXITCODE -ge 16) {
        Write-Host -Object:"`n[x] CRITICAL FAILURE: Robocopy error." -ForegroundColor:Red;
        Read-Host;
        exit;
    }
    
    $BackupPath = "${SourcePath}_bak";
    Write-Host -Object:"`n[*] Decoupling original tree..." -ForegroundColor:Yellow;
    $NewLeaf = Split-Path -Path:$BackupPath -Leaf;
    Rename-Item -Path:$SourcePath -NewName:$NewLeaf -Force;
    Start-Sleep -Seconds:1;

    Write-Host -Object:"[*] Injecting NTFS Directory Junction..." -ForegroundColor:Green;
    $null = cmd.exe /c "mklink /J `"$SourcePath`" `"$TargetPath`"";

    if (Test-Path -Path:$SourcePath) {$null = cmd.exe /c "rd /s /q `"$BackupPath`"";
    }

    $null = net user administrator /active:no;
    Remove-Item -Path:$ConfigFile -Force;

    $WinlogonPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon";
    Set-ItemProperty -Path:$WinlogonPath -Name:"AutoAdminLogon" -Value:"0";
    Remove-ItemProperty -Path:$WinlogonPath -Name:"DefaultPassword" -ErrorAction:SilentlyContinue;

    Show-EndScreen;
    logoff;
}
