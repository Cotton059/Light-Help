@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: 1. Auto-Elevate to Administrator
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

:: 2. Meta Data 
set "APP_NAME=SECURE SMB ONE-CLICK DEPLOY TOOL"
set "AUTHOR=Light Speed Share (GSFX)"
set "PROJECT=github.com/Cotton059/Light-Help"

:: 3. UI Configuration
title %APP_NAME%
mode con cols=90 lines=30
color 0F

:MainMenu
cls
echo.
echo   =====================================================================================
echo   #                   %APP_NAME%
echo   =====================================================================================
echo   [  Func  ] : Setup Secure SMB Share ^& Firewall, Create Folder ^& Set Permissions
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

:: 1. Enable Secure File Sharing Firewall Rules (Replaces SMB 1.0)
echo   - Step 1: Enabling Secure File Sharing Firewall Rules...
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes >nul 2>&1
netsh advfirewall firewall set rule group="文件和打印机共享" new enable=Yes >nul 2>&1

:: 2. Restart SMB Service
echo   - Step 2: Restarting Server Services...
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
net share "!shareName!"="!fullPath!" /GRANT:everyone,FULL /REMARK:"Auto-shared safely" >nul

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
    echo      * NOTE: Your devices can now safely connect.
) else (
    color 0C
    echo   [ FAILED ] An error occurred during deployment.
)
echo   =====================================================================================
echo.
echo   Press any key to exit...
pause >nul
