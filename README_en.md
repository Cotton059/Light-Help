<div align="center">
  <img src="https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square" alt="Status">
  <img src="https://github.com/Cotton059/Light-Help/actions/workflows/linter.yml/badge.svg" alt="Linter">
  <img src="https://github.com/Cotton059/Light-Help/actions/workflows/powershell-audit.yml/badge.svg" alt="Audit">
  <img src="https://img.shields.io/github/stars/Cotton059/Light-Help?style=flat-square" alt="Stars">
  <img src="https://img.shields.io/github/forks/Cotton059/Light-Help?style=flat-square" alt="Forks">
  <img src="https://img.shields.io/github/license/Cotton059/Light-Help?style=flat-square&color=blue" alt="License">
</div>

---
### 🌐 Select Language
[![en](https://img.shields.io/badge/lang-en-red.svg)](README_en.md)
[![zh-cn](https://img.shields.io/badge/lang-zh--cn-blue.svg)](README.md)
---
### 🛡️ Official Guidelines
> **Official Channel:** Dedicated to simplifying complex PC tasks. Ensure you are following the official **Lightspeed Sharing (YT)** channel.
> **Secure & Transparent:** Our core code is 100% open-source and open for community review. Feel free to inspect it before running.
> **Exclusive Resources:** All scripts in this repository are tailor-made companions for video tutorials on the **YouTube - Lightspeed Sharing** channel.
---

### 🙋‍♂️ Co-Create the Channel
> **Subscribe to Lightspeed Sharing (YT)**
> **💡 Community Engagement:** Vote in community posts or request custom services. Let your needs shape this space.
>
> 🔗 [Visit My YouTube Channel](https://www.youtube.com/@光速分享)

---

### 🚀 Environment & Usage Guide
> **Global Note:** All scripts on this page are universal. Launch the terminal using any of the methods below, then paste the code to run:
>
> * **Method 1 (Quick Access):** Press `Windows + X` and select `Windows PowerShell` from the menu.
> * **Method 2 (System Search):** Click the 🔎 Search icon on the taskbar, type `PowerShell`, and open it.
> * **Method 3 (Ultimate Solution):** Use the **🛡️ PowerShell Admin Shortcut** provided on this page.

> **Tutorial Links:** 🔗[YouTube Video Tutorial](https://youtu.be/q_gJc6e8tK0) | 🔗[Bilibili Video Tutorial](https://www.bilibili.com/video/BV1iXVA6rEdn/)

---

### 🔗 Light-Help Repo Shortcut
> **Tip:** This command auto-detects your desktop path (including OneDrive backups) and creates a direct shortcut to this repository.

```powershell
$s=(New-Object -COM WScript.Shell).CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\Light-Help.url"); $s.TargetPath="https://github.com/Cotton059/Light-Help"; $s.Save()
```

### 🛡️ Create PowerShell Admin Shortcut
> **Tip:** This script auto-detects your desktop path and injects a low-level elevation flag, creating a PowerShell desktop shortcut that runs as Administrator by default.
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/light/Create_AdminPSShortcut_Tool.ps1 | iex
```
---
## 📑 Video Tutorials Navigation
- [▶️ Block iOS Silent Updates in 30s](#️-lightspeed-sharing-yt-video-tutorial-block-ios-silent-updates-in-30s-keep-your-iphone-at-its-sweet-spot)
- [▶️ PowerShell 1-Click Guide (Win/Mac/Linux)](#️-lightspeed-sharing-yt-video-tutorial-powershell-1-click-guide-elevate-fix--setup)
- [▶️ Windows Ultimate RAM Rescue](#️-lightspeed-sharing-yt-video-tutorial-windows-1110-ultimate-ram-rescue-one-line-of-code-to-1-click-free-up-ram-make-your-pc-fly)
- [▶️ AI ID Photo Prompt Generator](#️-lightspeed-sharing-yt-video-tutorial-one-line-of-code-generate-perfect-id-photos-with-ai-stop-wasting-money-at-photo-studios-save-time-and-effort)
- [▶️ Translate GitHub in One Line](#️-lightspeed-sharing-yt-video-tutorial-one-line-of-code-completely-translate-github-fastest-configuration)
- [▶️ App Data Backup & Restore](#️-lightspeed-sharing-yt-video-tutorial-one-line-of-code-windows-app-data-1-click-backup--restore)
- [▶️ Deep Windows Cleanup](#️-lightspeed-sharing-yt-video-tutorial-one-line-deep-windows-cleanup-no-software-needed-free-up-massive-space)
- [▶️ Free Home Theater Setup](#️-lightspeed-sharing-yt-video-tutorial-free-home-theater-setup--no-nas-needed-auto-poster-wall--multi-device-playback-on-one-pc)
- [▶️ iPhone to Windows Wireless Transfer](#️-lightspeed-sharing-yt-video-tutorial-wirelessly-transfer-iphone-photos--videos-to-windows-without-any-software)
---
#### ▶️ Lightspeed Sharing (YT) Video Tutorial: [Block iOS Silent Updates in 30s: Keep Your iPhone at Its Sweet Spot](https://youtu.be/grUi6NUjOh0)

<a href="https://youtu.be/grUi6NUjOh0" target="_blank">
  <img src="images/020-1920-en.png" width="320" style="border-radius: 8px;" alt="Video Cover" title="Click to Play Video" />
</a>

### 🛡️ Permanently Block iOS Updates (No PC/Jailbreak Required)
> **Tip:** Say goodbye to forced Apple updates and midnight silent upgrades. Simply use your iPhone's built-in **Safari browser** to visit the exclusive node below. The system will automatically prompt "Profile Downloaded". Allow it and go to Settings to install in one click. The entire process takes less than 30 seconds.

**Exclusive Pure OTA Blocker Node:**
```text
ota.103386.xyz
```

---
#### ▶️ Lightspeed Sharing (YT) Video Tutorial: [PowerShell 1-Click Guide: Elevate, Fix & Setup](https://youtu.be/q_gJc6e8tK0)

<a href="https://youtu.be/q_gJc6e8tK0" target="_blank">
  <img src="images/021-1920-en.png" width="320" style="border-radius: 8px;" alt="Video Cover" title="Click to Play Video" />
</a>

### 🚑 Windows Environment Repair & Standalone Installation
> **Tip:** If your customized/older system cannot find PowerShell or crashes upon launch, press `Win + R`, type `cmd`, hit Enter, and run either of the solutions below:

**Solution A: Wake up dormant underlying system components (Run in CMD)**
```cmd
dism /online /Enable-Feature /FeatureName:MicrosoftWindowsPowerShellRoot /All
```
**Solution B: Force download and silently install standalone PowerShell 7 (Run in CMD)**
```cmd
curl -L -o PS.msi https://github.com/PowerShell/PowerShell/releases/download/v7.4.2/PowerShell-7.4.2-win-x64.msi && msiexec /i PS.msi /qb
```
### 🍏 Install PowerShell on Mac
> **Tip:** If your macOS requires the PowerShell cross-platform terminal environment, press `Command + Space` to search for and open "Terminal".

```Bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
> **Tip:** After installing Homebrew, copy the following command to install PowerShell in one click:
```Bash
brew install --cask powershell
```
### 🐧Linux System Installation (Using Ubuntu's Snap Package Manager as an example):
> **Tip:** If your Linux system is missing PowerShell runtime components, please open the system's command-line terminal directly and use the built-in package manager to pull the latest environment version.
```Bash
sudo snap install powershell --classic
```
---
#### ▶️ Lightspeed Sharing (YT) Video Tutorial: [Windows 11/10 Ultimate RAM Rescue: One Line of Code to 1-Click Free Up RAM, Make Your PC Fly!](https://youtu.be/PqKu_lRyAZM)

<a href="https://youtu.be/PqKu_lRyAZM" target="_blank">
  <img src="images/015-1920-en.png" width="320" style="border-radius: 8px;" alt="Video Cover" title="Click to Play Video" />
</a>

### 🚀 Ultimate RAM Release Tool
> **Tip:** Deeply release Windows system RAM with just one click. Efficiently clear memory usage and instantly restore a smooth, fast PC experience.

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/light/CryoRAM_Tool.ps1 | iex
```
---
#### ▶️ Lightspeed Sharing (YT) Video Tutorial: [One Line of Code! Generate Perfect ID Photos with AI, Stop Wasting Money at Photo Studios! Save Time and Effort!](https://youtu.be/q4KUOJbgJZ4)

<a href="https://youtu.be/q4KUOJbgJZ4" target="_blank">
  <img src="images/014-1920-en.png" width="320" style="border-radius: 8px;" alt="Video Cover" title="Click to Play Video" />
</a>

### 📸 AI Perfect ID Photo Prompt Generator
> **Tip:** Generates prompts for multiple types of perfect ID photos. Send them to any AI to instantly generate flawless, standard-sized ID photos. Save time and effort.

```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/light/AIPortrait_Tool.ps1 | iex
```

---
#### ▶️ Lightspeed Sharing (YT) Video Tutorial: [One Line of Code! Completely Translate GitHub! Fastest Configuration](https://youtu.be/n7P0SFjFppg)

<a href="https://youtu.be/n7P0SFjFppg" target="_blank">
  <img src="images/013-1280-en.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 🌐 GitHub Immersive Native Language Edition
> **Tip:** Quickly installs the official Chrome extension while perfectly retaining the native GitHub layout, highly recommended.
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/light/GitHub-CN-Installer_Tool.ps1 | iex
```
### 🐵 Tampermonkey Edition
> **Note:** For Tampermonkey users only. Copy and paste the link below into your browser to install the Chinese localization plugin. Script by maboloshi/github-chinese
```powershell

https://github.com/Cotton059/Light-Help/raw/refs/heads/main/ThirdParty/maboloshi_github-chinese/main.user.js
```
---
#### ▶️ Lightspeed Sharing (YT) Video Tutorial: [One Line of Code! Windows App Data 1-Click Backup & Restore](https://youtu.be/5bBx3p3nWok)

<a href="https://youtu.be/5bBx3p3nWok" target="_blank">
  <img src="images/012-1280-en.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 💿 App Data Backup/Restore
> **Tip:** Backs up the entire Users directory, including 🆗AppData🆗Downloads🆗Pictures🆗Documents🆗
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/AppBackup_Tool.ps1 | iex
```


---
#### ▶️ Lightspeed Sharing (YT) Video Tutorial: [One-Line Deep Windows Cleanup! No Software Needed, Free Up Massive Space](https://youtu.be/f5Ta_W54GL0)

<a href="https://youtu.be/f5Ta_W54GL0" target="_blank">
  <img src="images/011-1280-en.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### ☢️ Extreme Cleanup Edition
> **Warning:** Clears all user-level caches. Some cloud services may need to re-sync locally.
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/DeepClean_Tool.ps1 | iex
```
### 🛡️ v8.0 Balanced Protection Edition
> **Tip:** Frees up space while offering smart data isolation protection. Use this if you prefer a non-geek style.
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/DeepClean_v8.0_Tool.ps1 | iex
```

---
#### ▶️ Lightspeed Sharing (YT) Video Tutorial: [Free Home Theater Setup | No NAS Needed, Auto Poster Wall & Multi-Device Playback on One PC](https://youtu.be/EPpgy2S_9lg)

<a href="https://youtu.be/EPpgy2S_9lg" target="_blank">
  <img src="images/009-1280-en.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 📁 Create Shared Folder & Enable SMB Service
> **Tip:** Quickly configure your LAN sharing environment. This auto-creates a network shared folder and enables low-level SMB services for efficient cross-device access and file transfer.

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/SMB_Share_Tool.ps1 | iex
```

### 📡 Get System Username & Local IP
> **Tip:** 1-click extract your current login username and LAN IPv4 address, providing key parameters for Remote Desktop, LAN sharing, or network debugging.

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/GetInfo.ps1 | iex
```

### 🔑 Force Change or Create PC Password
> **Tip:** Bypass tedious system settings. Use commands to quickly reset or create a brand-new secure login password for your local account directly.

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/ResetPass.ps1 | iex
```

### 🔓 Set Auto-Login (Passwordless)
> **Tip:** Auto-configure low-level login credentials to skip the lock screen and boot directly to the desktop, greatly boosting startup efficiency for personal devices.

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/Win1011AutoLogin.ps1 | iex
```

---

#### ▶️ Lightspeed Sharing (YT) Video Tutorial: [Wirelessly Transfer iPhone Photos & Videos to Windows Without Any Software](https://youtu.be/USNIBEAcWME)

<a href="https://youtu.be/USNIBEAcWME" target="_blank">
  <img src="images/007-1280-en.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 📁 Create Shared Folder & Enable SMB Service
> **Tip:** Quickly configure your LAN sharing environment. This auto-creates a network shared folder and enables low-level SMB services for efficient cross-device access and file transfer.

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/SMB_Share_Tool.ps1 | iex
```

---

## ⚖️ License & Copyright

### 1. Core License
This project is open-sourced under the **[GNU General Public License v3.0 (GPL-3.0)](https://www.gnu.org/licenses/gpl-3.0.html)**.

- **User-Friendly:** You are free to run, study, share, and modify this software.
- **Copyleft (Mandatory Open Source):** If you modify and distribute this code, your modifications must also be open-sourced under GPL-3.0. This ensures the project and its derivatives remain permanently free and transparent, preventing closed-source commercialization.

### 2. Third-Party Code Compliance
For functional completeness, this project may include third-party open-source code (typically stored in the `ThirdParty/` directory).
- This project strictly complies with the original authors' open-source licenses.
- **All external code fully retains the original authors' attribution, copyright notices, and original licenses.**

### 3. Originality Statement & Developer Signature
The developer retains copyright for all self-written scripts and core logic in this project. Under the GPL-3.0 framework, please recognize the official signature:

> **Author:** Lightspeed Sharing (YT) | **Project:** Cotton059/Light-Help  
> **Developer:** Lightspeed Sharing (YT) | **Project:** Light-Help (GitHub)


