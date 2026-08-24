# 1. Capture the current username and request a new password
$User = $env:USERNAME
$Password = Read-Host "Enter new password for $User" -AsSecureString

# 2. Apply the new password to the local account
try {
    Set-LocalUser -Name $User -Password $Password
    Write-Host "Success: Password for [$User] has been updated." -ForegroundColor Green
}
catch {
    Write-Host "Error: Failed to update password. Make sure to Run as Administrator." -ForegroundColor Red
}

# 3. Keep the window open
Write-Host "`nPress any key to exit..." -ForegroundColor Yellow
$null = [Console]::ReadKey()
