<div align="center">
  <img src="https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square" alt="Status">
  <img src="https://github.com/Cotton059/Light-Help/actions/workflows/linter.yml/badge.svg" alt="Linter">
  <img src="https://github.com/Cotton059/Light-Help/actions/workflows/powershell-audit.yml/badge.svg" alt="Audit">
  <img src="https://img.shields.io/github/stars/Cotton059/Light-Help?style=flat-square" alt="Stars">
  <img src="https://img.shields.io/github/forks/Cotton059/Light-Help?style=flat-square" alt="Forks">
  <img src="https://img.shields.io/github/license/Cotton059/Light-Help?style=flat-square&color=blue" alt="License">
</div>

---
# Select Language
[![en](https://img.shields.io/badge/lang-en-red.svg)](README_en.md)
[![zh-cn](https://img.shields.io/badge/lang-zh--cn-blue.svg)](README.md)
---
# 🚀 Lightspeed Sharing (Light-Help)
### Helping viewers remotely complete complex PC operations. Please look for the official Lightspeed Sharing channel.

### Please review the code at the top of the project before running. It is open, transparent, and subject to public scrutiny, so you can use it with confidence.
### This project's scripts are exclusively for use with YouTube Lightspeed Sharing videos.
---


### 🙋‍♂️ Help Shape This Channel
> **Please subscribe to Lightspeed Sharing (YT)**
> **💡 Community Perks:** Unlock the power to vote in my community posts or submit custom service requests. Let everything here be decided by you!
>
> 🔗 [Visit my YouTube Channel](https://www.youtube.com/@光速分享)


---

## 🚀 Quick Access Tool (Windows + X)
Run the following command in **PowerShell** to add a Light-Help shortcut to your desktop with one click:

### 🔗 Repository Shortcut
> **Note:** This command automatically detects your desktop path (supports OneDrive folders) and creates an icon for instant access to this repository.

```powershell
$s=(New-Object -COM WScript.Shell).CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\Light-Help.url"); $s.TargetPath="https://github.com/Cotton059/Light-Help"; $s.Save()
```
---
**Lightspeed Sharing Video:** [📺 1-Line Code Backup! Windows App Data Auto-Save & Restore](https://youtu.be/5bBx3p3nWok)  
*（Support the project, viewer exclusive）*

<a href="https://youtu.be/5bBx3p3nWok" target="_blank">
  <img src="images/012-1280-en.png" width="320" alt="视频封面图" />
</a>

## 💻 Quick Start (Windows + X) or Desktop 🔎 Search (PowerShell)
Run the following command in PowerShell (Admin):

### 💿 App Data Backup/Restore
> **Tip：** Backs up the entire Users directory, including 🆗AppData🆗Downloads🆗Pictures🆗Documents🆗
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/AppBackup_Tool.ps1 | iex
```

---
**Lightspeed Sharing Video:**[How to Deep Clean Windows with 1 Line of Code! (No Software Needed)](https://youtu.be/f5Ta_W54GL0)  
*(Help project, exclusively for viewers)*

<a href="https://youtu.be/f5Ta_W54GL0" target="_blank">
  <img src="https://github.com/user-attachments/assets/33502f93-49fd-4cfc-a3c4-2611f2bd0b4f" width="320" alt="视频封面图" />
</a>


## 💻 Quick Start (Windows + X)
Run the following command in **PowerShell Administrator Mode**:Run Light-Help 1-Click Cleanup Command
### ☢️ Extreme Edition
> **WARNING:** Clears all user-level caches. Cloud-based apps may require a full local re-sync.

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/DeepClean_Tool.ps1 | iex
```
### 🛡️ v8.0 Balanced Edition
> **NOTE:** Reclaims space with smart data isolation. Ideal if you prefer stability over "Geek-style" minimalism.
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/DeepClean_v8.0_Tool.ps1 | iex
```

---
**Lightspeed Sharing Video:**[Build a Pro Home Theater Without a NAS! Auto-Posters & Streaming on Any Device](https://youtu.be/EPpgy2S_9lg)  
*(Help project, exclusively for viewers)*

<a href="https://youtu.be/EPpgy2S_9lg" target="_blank">
  <img src="https://github.com/user-attachments/assets/ac237aef-5700-4b87-a8a4-ab16a8c7391e" width="320" alt="视频封面图" />
</a>


## 💻 Quick Start (Windows + X)
Run the following command in **PowerShell Administrator Mode**:Create a shared folder and toggle on SMB

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/SMB_Share_Tool.ps1 | iex
```

## 💻 Quick Start (Windows + X)
Run the following command in **PowerShell Administrator Mode**:Grab your username and local IP address

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/GetInfo.ps1 | iex
```

## 💻 Quick Start (Windows + X)
Run the following command in **PowerShell Administrator Mode**:Set a system password (if you don't have one)

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/ResetPass.ps1 | iex
```

## 💻 Quick Start (Windows + X)
Run the following command in **PowerShell Administrator Mode**:Configure auto-login for a seamless boot experience

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/Win1011AutoLogin.ps1 | iex
```
---
#### 📺 Video Tutorial
**Lightspeed Sharing Video:** [Wireless transfer of iPhone photos and videos to Windows without any software](https://youtu.be/USNIBEAcWME)  
*(Help project, exclusively for viewers)*

<a href="https://youtu.be/USNIBEAcWME" target="_blank">
  <img src="https://github.com/user-attachments/assets/e3db959e-48e4-4b24-b1f6-6f78ed93e5a1" width="320" alt="Video Cover" />
</a>

## 💻 Quick Start (Windows + X)
Run the following command in **PowerShell Administrator Mode**:

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/SMB_Share_Tool.ps1 | iex
```

📝 Instructions
Select Disk: Follow the script prompts to select the disk you want to use as the share target.

Create Folder: Enter a name and create your shared folder.

Automatic Configuration: The script will automatically enable the system's SMB service for you.

⚠️ Important Note
Restart Computer: If this is the first time enabling the SMB service, please restart your computer after the operation is complete to ensure the service takes full effect.

---

## ⚖️ License & Copyright

### 1. Core License
This project is open-source under the **[GNU General Public License v3.0 (GPL-3.0)](https://www.gnu.org/licenses/gpl-3.0.html)**.

- **User-Friendly**: You are free to run, study, share, and modify this software.
- **Copyleft (Mandatory Open Source)**: If you modify and distribute the code from this project, your modifications must also be open-sourced under the GPL-3.0 license. This ensures that this project and its derivatives will remain permanently free and transparent, preventing them from being closed-source or commercialized.

### 2. Third-Party Code Compliance
To ensure functional completeness, this project may contain third-party open-source code (typically stored in the `ThirdParty/` directory).
- This project strictly complies with the original authors' open-source licenses.
- **All external code completely retains the original authors' attribution, copyright notices, and original licenses.**

### 3. Originality Statement & Developer Signature
The developer reserves the copyright for all independently written scripts and core logic within this project. Under the GPL-3.0 framework, please recognize the official signature:

> **Author:** Lightspeed Sharing (YT) | **Project:** Cotton059/Light-Help  
> **Developer:** Lightspeed Sharing (YT) | **Project:** Light-Help (GitHub)

---

---
