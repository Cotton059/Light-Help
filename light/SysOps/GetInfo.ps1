# 1. Get the current user's object to check the source
$CurrentLoggedUser = Get-LocalUser -Name $env:USERNAME

# 2. Build the information object
$UserInfo = [PSCustomObject]@{
    "Username"         = $env:USERNAME
    "Account_Type"     = $CurrentLoggedUser.PrincipalSource
    "IP_Address"       = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -notlike "*Loopback*" }).IPAddress -join " / "
}

# 3. Output the results
Write-Host "--- Enhanced System User Information ---" -ForegroundColor Cyan
$UserInfo | Format-List

# 4. Add a helpful tip based on account type
if ($CurrentLoggedUser.PrincipalSource -ne "Local") {
    Write-Host "NOTE: This is a linked account (Microsoft Account)." -ForegroundColor Yellow
} else {
    Write-Host "NOTE: This is a standard local account." -ForegroundColor Green
}

Write-Host "`nPress any key to exit..." -ForegroundColor Yellow
$null = [Console]::ReadKey()
