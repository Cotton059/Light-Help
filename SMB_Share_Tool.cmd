@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: 1. Auto-Elevate to Administrator
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

:: 2. Meta Data (These strings are tied to the MD5 Hash)
set "APP_NAME=SMB 1.0 ONE-CLICK DEPLOY TOOL"
set "AUTHOR=Light Speed Share (GSFX)"
set "PROJECT=github.com/Cotton059/Light-Help"

:: 3. Cloud MD5 Integrity Verification
:: -------------------------------------------------------------------------------------
set "RAW_URL=https://raw.githubusercontent.com/Cotton059/Light-Help/main/verify.txt"
set "TEMP_AUTH=%TEMP%\cloud_hash.txt"
set "LOCAL_DATA=AUTHOR=!AUTHOR!|PROJECT=!PROJECT!"
set "HASH_TEMP=%TEMP%\local_hash_data.txt"

:: A. Fetch the Official MD5 from GitHub
curl -s -L "%RAW_URL%" > "%TEMP_AUTH%" 2>nul
set /p CLOUD_MD5=<"%TEMP_AUTH%"

:: B. Generate MD5 for Local Strings
:: We echo the metadata into a temp file and hash it
echo|set /p="!LOCAL_DATA!" > "%HASH_TEMP%"
for /f "skip=1 tokens=* delims=" %%a in ('certutil -hashfile "%HASH_TEMP%" MD5') do (
    set "RAW_MD5=%%a"
    goto :CompareHashes
)

:CompareHashes
:: Remove spaces from certutil's output (Certutil returns hex with spaces)
set "LOCAL_MD5=!RAW_MD5: =!"

:: C. Cleanup Temp Files
del "%TEMP_AUTH%" >nul 2>&1
del "%HASH_TEMP%" >nul 2>&1

:: D. Final Integrity Check
:: If the MD5 from GitHub doesn't match the local hash, the script exits.
if /i not "!LOCAL_MD5!"=="!CLOUD_MD5!" (
    cls
    color 0C
    echo.
    echo   [!] SECURITY ALERT: Unauthorized modification or connection failed.
    echo   -------------------------------------------------------------------------------------
    echo   [!] Local Signature  : !LOCAL_MD5!
    echo   [!] Required Signature: !CLOUD_MD5!
    echo   -------------------------------------------------------------------------------------
    echo   [!] ERROR: Integrity check failed. Access denied.
    echo.
    echo   Closing in 5 seconds...
    timeout /t 5 >nul
    exit
)
:: -------------------------------------------------------------------------------------

:: 4. UI Configuration
title %APP_NAME%
mode con cols=90 lines=30
color 0F

:MainMenu
cls
echo.
echo   =====================================================================================
echo   #                   %APP_NAME%
echo   =====================================================================================
echo   [  Func  ] : Enable SMB 1.0, Create Folder ^& Set Everyone Permissions
echo   [ Author ] : %AUTHOR%
echo   [ Project] : %PROJECT%
echo   -------------------------------------------------------------------------------------
echo.

:: --- Check Privileges ---
net session >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo   [!] ERROR: Please run this script as ADMINISTRATOR.
    pause
    exit /b
)

:: --- Scan Drives ---
echo   [+] Scanning available drives...
echo   -------------------------------------------------------------------------------------
set counter=1
for /f "skip=1 tokens=1" %%a in ('wmic logicaldisk get name') do (
    set "item=%%a"
    if not "!item!"=="" (
        set "drive[!counter!]=!item!"
        echo       [!counter!]  Drive !item!
        set /a counter+=1
    )
)
echo   -------------------------------------------------------------------------------------
echo.

:: --- User Interaction ---
set /p driveChoice="   [?] Select Drive Number (1, 2, 3...): "
set "driveLetter=!drive[%driveChoice%]!"

if "!driveLetter!"=="" (
    color 0C
    echo   [!] ERROR: Invalid choice. Exiting...
    timeout /t 3 >nul
    exit /b
)

echo.
set /p shareName="   [?] Enter Share Name (e.g., MyFiles): "
set "fullPath=!driveLetter!\!shareName!"

:: --- Execution Logic ---
cls
echo.
echo   [ RUNNING ] Deploying configurations, please wait...
echo   -------------------------------------------------------------------------------------

:: 1. Enable Feature
echo   - Step 1: Enabling SMB 1.0 Protocol (This may take 1-3 mins)...
dism /online /enable-feature /featurename:SMB1Protocol /all /norestart >nul

:: 2. Restart SMB Service
echo   - Step 3: Restarting Server Services...
net stop "lanmanserver" /y >nul 2>&1
net start "lanmanserver" >nul 2>&1

:: 3. Create Folder & Set Permissions
if not exist "!fullPath!" (
    echo   - Step 3: Creating directory: !fullPath!
    mkdir "!fullPath!"
)
echo   - Step 4: Setting NTFS Permissions (Everyone: Full Control)...
icacls "!fullPath!" /grant Everyone:(OI)(CI)F /t /q >nul

:: 4. Apply Network Share
echo   - Step 5: Activating Network Share...
net share "!shareName!"="!fullPath!" /GRANT:everyone,FULL /REMARK:"Auto-shared" >nul

:: --- Result Presentation ---
echo.
echo   =====================================================================================
if %errorlevel% equ 0 (
    color 0A
    echo   [ SUCCESS ] Configuration completed successfully!
    echo   -------------------------------------------------------------------------------------
    echo      * Network Path : \\%COMPUTERNAME%\!shareName!
    echo      * Local Path   : !fullPath!
    echo   -------------------------------------------------------------------------------------
    echo      * NOTE: Please REBOOT your computer to apply changes.
) else (
    color 0C
    echo   [ FAILED ] An error occurred during deployment.
)
echo   =====================================================================================
echo.
echo   Press any key to exit...
pause >nul