# Check and request Administrator privileges
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# 1. Input Section
Write-Host "Hint: For Microsoft online accounts, please enter the corresponding folder name under C:\Users\ (usually the first 5 letters of the email) or the full email address as the username." -ForegroundColor Yellow
$User = Read-Host "Input Username"
$Pass = Read-Host "Input Password" -AsSecureString
$PassPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Pass))

# Get computer name as default domain (for local accounts)
$Domain = $env:COMPUTERNAME

# 2. Fix Win10/11 Hello Limit
$LessPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device"
# Ensure the path exists just in case
if (!(Test-Path $LessPath)) { New-Item -Path $LessPath -Force | Out-Null }
Set-ItemProperty -Path $LessPath -Name "DevicePasswordLessBuildVersion" -Value 0 -Type DWord

# 3. Set Auto Login
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$Config = @{
    "AutoAdminLogon"    = "1"
    "DefaultUserName"   = $User
    "DefaultPassword"   = $PassPlain
    "DefaultDomainName" = $Domain
}

# Write configuration, explicitly specifying as String type
foreach ($Key in $Config.Keys) {
    Set-ItemProperty -Path $RegPath -Name $Key -Value $Config[$Key] -Type String
}

# [Critical Fix] Remove any residual AutoLogonCount key from previous scripts, otherwise it will prevent infinite auto-logon
Remove-ItemProperty -Path $RegPath -Name "AutoLogonCount" -ErrorAction SilentlyContinue

Write-Host "Settings applied successfully! Please restart." -ForegroundColor Green
Pause
