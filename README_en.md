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
**▶️ Lightspeed Sharing (YT) Video Tutorial:** [One Line of Code! Completely Translate GitHub! Fastest Configuration](https://youtu.be/n7P0SFjFppg)  
*(Exclusive companion project for viewers)*

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
**▶️ Lightspeed Sharing (YT) Video Tutorial:** [One Line of Code! Windows App Data 1-Click Backup & Restore](https://youtu.be/5bBx3p3nWok)  
*(Exclusive companion project for viewers)*

<a href="https://youtu.be/5bBx3p3nWok" target="_blank">
  <img src="images/012-1280-en.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 💿 App Data Backup/Restore
> **Tip:** Backs up the entire Users directory, including 🆗AppData🆗Downloads🆗Pictures🆗Documents🆗
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/AppBackup_Tool.ps1 | iex
```


---
**▶️ Lightspeed Sharing (YT) Video Tutorial:** [One-Line Deep Windows Cleanup! No Software Needed, Free Up Massive Space](https://youtu.be/f5Ta_W54GL0)  
*(Exclusive companion project for viewers)*

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
**▶️ Lightspeed Sharing (YT) Video Tutorial:** [Free Home Theater Setup | No NAS Needed, Auto Poster Wall & Multi-Device Playback on One PC](https://youtu.be/EPpgy2S_9lg)  
*(Exclusive companion project for viewers)*

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

**▶️ Lightspeed Sharing (YT) Video Tutorial:** [Wirelessly Transfer iPhone Photos & Videos to Windows Without Any Software](https://youtu.be/USNIBEAcWME)  
*(Exclusive companion project for viewers)*

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


