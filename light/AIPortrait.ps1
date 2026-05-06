# ==============================================================================
# Author: Lightspeed Sharing (YT) | Project: Cotton059/Light-Help 
# Developer: Lightspeed Sharing (YT) | Project : Light-Help (GitHub)
# ==============================================================================

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# ==========================================
# [Phase 0: Window Geometry & Centering]
# ==========================================
if ($Host.Name -eq 'ConsoleHost') {
    try {
        $Host.UI.RawUI.WindowTitle = "AIPortrait TOOL - Lightspeed Sharing"
        $Size = New-Object System.Management.Automation.Host.Size(80, 30)
        $Host.UI.RawUI.WindowSize = $Size
        $Host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(80, 300)

        Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;
        public class Win32 {
            [DllImport("user32.dll")]
            public static extern IntPtr GetForegroundWindow();
            [DllImport("user32.dll")]
            public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);
            [DllImport("user32.dll")]
            public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
            public struct RECT { public int Left; public int Top; public int Right; public int Bottom; }
        }
"@
        $hwnd = [Win32]::GetForegroundWindow()
        if ($hwnd -ne [IntPtr]::Zero) {
            $rect = New-Object Win32+RECT
            [Win32]::GetWindowRect($hwnd, [ref]$rect) > $null
            Add-Type -AssemblyName System.Windows.Forms
            $screen = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea
            $width = $rect.Right - $rect.Left
            $height = $rect.Bottom - $rect.Top
            $x = [int](($screen.Width - $width) / 2)
            $y = [int](($screen.Height - $height) / 2)
            [Win32]::MoveWindow($hwnd, $x, $y, $width, $height, $true) > $null
        }
    } catch {}
}

# ==========================================
# [Phase 1: Process Mutex & Execution Guard]
# ==========================================
if ($env:__LIGHTHELP_RUNNING -eq "1" -or $env:__ELEVATED -eq "1") {
    # Skip if already running or currently elevating
} else {
    $env:__LIGHTHELP_RUNNING = "1"
}

if ($Host.Name -ne "ConsoleHost") {
    Write-Host "[!] WARNING: Non-standard Host Environment ($($Host.Name)). Continuing..." -ForegroundColor Yellow
    Start-Sleep -Seconds 1
}

# ==========================================
# [Phase 2: Advanced Auto-Elevation Engine]
# ==========================================
function Write-ElevLog {
    param ([string]$Message)
    try {
        $logPath = Join-Path $env:TEMP "github_zh_elevation.log"
        $time = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        Add-Content -Path $logPath -Value "[$time] $Message"
    } catch {}
}

function Get-CurrentShell {
    try { if ($PSVersionTable.PSEdition -eq "Core") { "pwsh" } else { "powershell" } } catch { "powershell" }
}

$isAdmin = try {
    ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
} catch { $false }

if (-not $isAdmin) {
    Write-ElevLog "User is not elevated. Initiating elevation sequence."
    
    $ScriptPath = $PSCommandPath
    if ([string]::IsNullOrWhiteSpace($ScriptPath)) { $ScriptPath = $MyInvocation.MyCommand.Path }

    if ([string]::IsNullOrWhiteSpace($ScriptPath)) {
        Write-Host "[!] FATAL: Memory execution detected or path unknown." -ForegroundColor Red
        Write-Host "[!] ACTION REQUIRED: Please save as .ps1 and run." -ForegroundColor Red
        Start-Sleep -Seconds 5
        exit
    }

    $shell = Get-CurrentShell
    $exe = if ($shell -eq "pwsh") { "pwsh.exe" } else { "powershell.exe" }

    if ($exe -eq "pwsh.exe" -and -not (Get-Command pwsh.exe -ErrorAction SilentlyContinue)) {
        $exe = "powershell.exe"
        Write-ElevLog "Fallback to powershell.exe triggered."
    }

    Write-Host "[*] Requesting Administrator privileges for system-wide installation..." -ForegroundColor Yellow
    
    $argList = @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "`"$ScriptPath`"")
    $env:__ELEVATED = "1"
    $env:__LIGHTHELP_RUNNING = "0" # Clear mutex for the new process

    try {
        Start-Process -FilePath $exe -ArgumentList $argList -Verb RunAs -WorkingDirectory (Get-Location)
        Write-ElevLog "Elevation process launched successfully."
    } catch {
        Write-ElevLog "Elevation failed or cancelled by user: $_"
        Write-Host "`n[!] Elevation Cancelled or Failed. Administrator rights are required for HKLM registry modifications." -ForegroundColor Red
    }
    
    Write-Host "`n[INFO] Relaunching as Administrator..." -ForegroundColor Cyan
    Read-Host "Press Enter to close this window..."
    exit # Exit the non-elevated script immediately
} else {
    Write-ElevLog "Running with Administrator privileges."
}

# --- Static Base Prompt Sections ---
$BaseTop = @"

Prohibit feature reshaping. Allow ultra-light skin smoothing, but must lock the subject's fundamental authentic facial appearance.

1. Facial Lock & Edge Processing
- Lock the shape, size, and position of all facial features.
- Only ultra-light skin smoothing is allowed to even out skin tone. Prohibit heavy blemish/acne removal or whitening filters.
- Must retain clear native skin textures, pores, and personal identifying marks (e.g., moles, birthmarks, natural dark circles).
- Retain the subject's existing lip and facial muscle state; prohibit artificial modification of expressions.
- Clean up stray hairs strictly on the outer contour.
- Prohibit altering the hairline, overall hair structure, or facial contour.

2. Lighting & Color Adjustment
- Apply global adjustments to achieve even facial illumination.
- Lift dark areas to eliminate severe shadows.
- Prohibit destroying the three-dimensional facial structure and natural skin texture.
- Adjust white balance to restore true skin tones and eliminate color casts.
- Remove obvious noise. Prohibit excessive noise reduction that causes a smudged effect.

3. Specification & Background Application (Execute the following)
"@

$BaseBottom = @"

4. Final Output
- Compare with the original image to confirm zero distortion of features, ensuring skin smoothing is minimal and native texture remains clearly visible.
- Confirm even lighting, natural background edge transitions, and zero bleeding from the original background.
- Confirm crop size and facial proportions match the selected preset.
- Export Format: JPEG/JPG.
- Resolution: >= 300 DPI.
"@

# --- Preset Data Array with Precise RGB for ANSI Console Colors ---
$Presets = @(
    @{ ID="1"; RGB="255;255;255"; Name="Pure White - CN Standard"; Prompt="- [Type 1: Pure White - CN Standard] Replace background with solid white (Hex: #FFFFFF | RGB: 255,255,255). Use: Universal 1-inch photo. Crop size: 25mm x 35mm. Adjust proportions: Center head absolutely, leave appropriate headroom." },
    @{ ID="2"; RGB="67;142;219";  Name="Standard Blue - Archives"; Prompt="- [Type 2: Standard Blue - Archives] Replace background with standard blue (Hex: #438EDB | RGB: 67,142,219). Use: Universal 1-inch / Japanese Resume. Crop size: 25mm x 35mm or 30mm x 40mm. Adjust proportions: Head height occupies roughly 70-80% of total height, framing from the chest up, centered." },
    @{ ID="3"; RGB="0;60;143";    Name="Dark Blue - ID/Professional"; Prompt="- [Type 3: Dark Blue - ID/Professional] Replace background with solid dark blue (Hex: #00307B or #003C8F). Use: Chinese ID / Formal portraits. Crop size: 32mm x 26mm. Adjust proportions: Head height 25.5-27.5mm, Head width 18.5-22mm." },
    @{ ID="4"; RGB="255;0;0";     Name="Standard Red - Marriage/Awards"; Prompt="- [Type 4: Standard Red - Marriage/Awards] Replace background with solid red (Hex: #FF0000 | RGB: 255,0,0). Use: Chinese Marriage Cert / Standard 2-inch. Crop size: 35mm x 53mm. Adjust proportions: Center head absolutely, face height occupies 60%-70% of total height." },
    @{ ID="5"; RGB="255;255;255"; Name="Pure White - ICAO Global"; Prompt="- [Type 5: Pure White - ICAO Global] Replace background with solid white (Hex: #FFFFFF | RGB: 255,255,255). Use: US Visa / Canadian Passport. Crop size: 51x51mm (US) or 50x70mm (CA). Adjust proportions: [US] Head height 50%-69%, eye level from bottom 56%-69%. [CA] Face height strictly between 31-36mm." },
    @{ ID="6"; RGB="211;211;211"; Name="Light Grey - EU Anti-Glare"; Prompt="- [Type 6: Light Grey - EU Anti-Glare] Replace background with uniform light gray (Hex: #E5E5E5 to #D3D3D3). Use: EU/Schengen Passport. Crop size: 35mm x 45mm. Adjust proportions: Face height (crown to chin) 29-34mm. Center head absolutely." },
    @{ ID="7"; RGB="253;245;230"; Name="Cream - Traditional Docs"; Prompt="- [Type 7: Cream - Traditional Docs] Replace background with textureless off-white/cream (Hex: #FDF5E6). Use: US Visa alternative / European traditional files. Crop size: 51x51mm or 35x45mm. Adjust proportions: Center head absolutely, ensuring distinct edge contrast." },
    @{ ID="8"; RGB="30;144;255";  Name="Specific Blue - Int'l Visa"; Prompt="- [Type 8: Specific Blue - Int'l Visa] Replace background with specific blue (Hex: #1E90FF or #0055A4). Use: Specific national passports. Crop size: 35mm x 45mm. Adjust proportions: Face height (crown to chin) 29-34mm. Center head absolutely." }
)

# --- Cyber Banner ---
function Show-Banner {
    Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
    Write-Host " |      /_\                                                 |" -ForegroundColor Cyan
    Write-Host " |     ( o )    >>> AIPortrait TOOL <<<                     |" -ForegroundColor Cyan
    Write-Host " |    /_____\                                               |" -ForegroundColor Cyan
    Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
    Write-Host " |  Developer: Lightspeed Sharing (YT)                      |" -ForegroundColor DarkCyan
    Write-Host " |  Project  : Cotton059/Light-Help                         |" -ForegroundColor DarkCyan
    Write-Host " |  Platform : Windows 10 / 11 Optimization                 |" -ForegroundColor DarkCyan
    Write-Host " +----------------------------------------------------------+" -ForegroundColor Cyan
}

# --- Main Application Loop ---
$ESC = [char]27

while ($true) {
    Clear-Host
    Show-Banner
    
    Write-Host "`n [ MODULE: PRESET SELECTION ] " -ForegroundColor Cyan -BackgroundColor Black
    Write-Host " Please select a document photo specification:`n" -ForegroundColor Magenta
    
    # Display Options with precise ANSI RGB color mapping
    foreach ($P in $Presets) {
        Write-Host "$ESC[38;2;$($P.RGB)m   [$($P.ID)] $($P.Name)$ESC[0m"
    }
    
    Write-Host "`n   >> INPUT_INDEX (1-8. Enter 'q' to quit): " -NoNewline -ForegroundColor Cyan
    $InputSelection = Read-Host
    
    if ($InputSelection -eq 'q' -or $InputSelection -eq 'Q') {
        break
    }
    
    # Find selected preset
    $SelectedPreset = $Presets | Where-Object { $_.ID -eq $InputSelection }
    
    if ($SelectedPreset) {
        # Assemble Final Prompt
        $FinalPrompt = "$BaseTop`n$($SelectedPreset.Prompt)`n$BaseBottom"
        
        # Copy to Clipboard
        Set-Clipboard -Value $FinalPrompt
        
        # Print Success Message
        Write-Host "`n" + ("=" * 60) -ForegroundColor Cyan
        Write-Host "[SUCCESS] Task completed." -ForegroundColor Green
        Write-Host "[ACTION] Press Ctrl+V to paste." -ForegroundColor Yellow
        Write-Host "[INFO] Released: $($SelectedPreset.Name)" -ForegroundColor White
        Write-Host "Support: Lightspeed Sharing (YT)" -ForegroundColor Magenta
        Write-Host ("=" * 60) -ForegroundColor Cyan
    } else {
        # Invalid Input Handling
        Write-Host "`n [ERROR] Invalid selection. Please enter a number between 1 and 8." -ForegroundColor Red
    }
    
    # Wait for user operation to loop back
    Write-Host "`n Press [Enter] to return to the main menu..." -ForegroundColor DarkCyan -NoNewline
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}
