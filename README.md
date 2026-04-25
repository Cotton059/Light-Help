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
# 🚀 光速分享 (Light-Help)
### 帮助观众远程完成一些复杂的 PC 操作,请认准光速分享(YT)官方频道

### 运行前在项目上方查看代码，公开公正接受监督您可以放心使用
### 本项目脚本仅供-youtube-光速分享-视频配套使用
---


### 🙋‍♂️ 参与频道共建
> **请订阅光速分享（YT）**
> **💡 社区互动：** 即可在我的社区帖中投票 / 自定义服务需求，让这里的一切由你书写。
>
> 🔗 [访问我的 YouTube 频道](https://www.youtube.com/@光速分享)


---
## 🚀 快速访问工具 (Windows + X)
在 **PowerShell** 中运行以下命令，将 Light-Help 仓库一键添加到桌面快捷方式：

### 🔗 仓库快捷方式
> **提示：** 此命令将自动识别你的桌面路径（支持 OneDrive 备份目录），生成一个直达本仓库的图标。

```powershell
$s=(New-Object -COM WScript.Shell).CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\Light-Help.url"); $s.TargetPath="https://github.com/Cotton059/Light-Help"; $s.Save()
```
---
**光速分享（YT）视频：** [📺 一行代码搞定！Windows 软件数据一键备份与恢复](https://youtu.be/5bBx3p3nWok)  
*（帮助项目，观看用户专用）*

<a href="https://youtu.be/5bBx3p3nWok" target="_blank">
  <img src="images/012-1280-zh.png" width="320" alt="视频封面图" />
</a>

## 💻 快速开始 (Windows + X) or 桌面🔎搜索（PowerShell）
在 **PowerShell 管理员模式** 中运行以下命令：

### 💿 软件数据备份/恢复
> **提示：** 将备份整个Users目录，包含🆗AppData🆗下载🆗图片🆗文档🆗
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/AppBackup_Tool.ps1 | iex
```


---
**光速分享视频：** [一行代码深度清理 Windows！无需安装软件，一键释放巨量系统空间](https://youtu.be/f5Ta_W54GL0)  
*（帮助项目，观看用户专用）*

<a href="https://youtu.be/f5Ta_W54GL0" target="_blank">
  <img src="https://github.com/user-attachments/assets/0f8dfba7-0979-4405-9e84-a432d2ec9257" width="320" alt="视频封面图" />
</a>

## 💻 快速开始 (Windows + X)
在 **PowerShell 管理员模式** 中运行以下命令：运行Light-Help,一键清理命令

### ☢️ 极致清理版
> **警告：** 清空所有用户级缓存，可能导致部分云服务软件需要重新同步到本地
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/DeepClean_Tool.ps1 | iex
```
### 🛡️ v8.0 平衡保护版
> **提示：** 在释放空间的同时，提供智能数据隔离保护，如果您不喜欢极客风格，可以使用它
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/DeepClean_v8.0_Tool.ps1 | iex
```

---
**光速分享视频：** [免费家庭影院搭建教程｜无需NAS，一台电脑实现自动海报墙 + 全设备播放](https://youtu.be/EPpgy2S_9lg)  
*（帮助项目，观看用户专用）*

<a href="https://youtu.be/EPpgy2S_9lg" target="_blank">
  <img src="https://github.com/user-attachments/assets/0e01384f-1042-4239-b52d-be3b1d7315e4" width="320" alt="视频封面图" />
</a>

## 💻 快速开始 (Windows + X)
在 **PowerShell 管理员模式** 中运行以下命令：创建共享文件夹,启用SMB服务

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/SMB_Share_Tool.ps1 | iex
```

## 💻 快速开始 (Windows + X)
在 **PowerShell ** 中运行以下命令：获取用户名和内网IP

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/GetInfo.ps1 | iex
```

## 💻 快速开始 (Windows + X)
在 **PowerShell 管理员模式** 中运行以下命令：强制修改电脑的密码或创建密码

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/ResetPass.ps1 | iex
```

## 💻 快速开始 (Windows + X)
在 **PowerShell 管理员模式** 中运行以下命令：设置开机自动登录,无需输入密码

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/Win1011AutoLogin.ps1 | iex
```



---

#### 📺 视频教程
**光速分享视频：** [iPhone照片视频无线传输到Windows无需任何软件](https://youtu.be/USNIBEAcWME)  
*（帮助项目，观看用户专用）*

<a href="https://youtu.be/USNIBEAcWME" target="_blank">
  <img src="https://github.com/user-attachments/assets/e3db959e-48e4-4b24-b1f6-6f78ed93e5a1" width="320" alt="视频封面图" />
</a>

## 💻 快速开始 (Windows + X)
在 **PowerShell 管理员模式** 中运行以下命令：

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/SMB_Share_Tool.ps1 | iex
```
📝 使用说明
选择磁盘：根据脚本提示，选择需要作为共享目标的磁盘。

创建文件夹：输入名称并创建你的共享文件夹。

自动配置：脚本会自动为你开启系统的 SMB 服务。

⚠️ 重要提示
重启电脑：如果是第一次开启 SMB 服务，请在操作完成后重启电脑，以确保服务完全生效。

---


## ⚖️ 开源协议与版权声明 (License & Copyright)

### 1. 核心协议
本项目采用 **[GNU General Public License v3.0 (GPL-3.0)](https://www.gnu.org/licenses/gpl-3.0.html)** 协议开源。

- **对用户友好**：您可以自由地运行、学习、共享和修改本软件。
- **强制开源（传染性）**：如果您修改了本项目代码并进行分发，则您的修改部分也必须以 GPL-3.0 协议开源，这确保了本项目及其衍生工具将永久保持免费与透明，防止被闭源商业化。

### 2. 外部代码合规性 (Third-Party Code)
为了项目的功能完整性，本项目可能包含部分第三方开源代码（通常存放于 `ThirdParty/` 目录下）。
- 本项目严格遵守原作者的开源许可。
- **所有外部代码均完整保留了原作者的署名、版权声明及原始协议。**

### 3. 原创声明与开发者签名
对于本项目中的所有自主编写的脚本及核心逻辑，开发者保留其版权。在 GPL-3.0 框架下，请认准官方署名：

> **Author:** Lightspeed Sharing (YT) | **Project:** Cotton059/Light-Help  
> **Developer:** Lightspeed Sharing (YT) | **Project:** Light-Help (GitHub)

---

