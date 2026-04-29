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
### 🛡️ 官方使用须知
> **认准官方：** 致力于协助您轻松完成复杂的 PC 操作，请认准 **光速分享 (YT)** 官方频道。
> **安全透明：** 核心代码完全公开透明，接受全网监督。运行前欢迎查阅，请放心使用。
> **专属配套：** 本项目所有脚本均为 **YouTube - 光速分享** 频道视频教程的专属配套资源。
---


### 🙋‍♂️ 参与频道共建
> **请订阅光速分享（YT）**
> **💡 社区互动：** 即可在我的社区帖中投票 / 自定义服务需求，让这里的一切由你书写。
>
> 🔗 [访问我的 YouTube 频道](https://www.youtube.com/@光速分享)

---

### 🚀 运行环境与使用指南
> **全局说明：** 本页面提供的所有脚本代码均通用。请使用以下任意一种方式唤出终端，随后粘贴代码运行：
>
> * **方式一（快捷访问）：** 按下键盘组合键 `Windows + X`，在弹出的菜单中选择 `Windows PowerShell`。
> * **方式二（系统搜索）：** 点击桌面任务栏的 🔎 搜索图标，输入 `PowerShell` 并点击打开。
> * **方式三（终极方案）：** 使用本页提供的 **🛡️ PowerShell 管理员快捷方式**。

---

### 🔗 仓库Light-help快捷方式
> **提示：** 此命令将自动识别你的桌面路径（支持 OneDrive 备份目录），生成一个直达本仓库的图标。

```powershell
$s=(New-Object -COM WScript.Shell).CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\Light-Help.url"); $s.TargetPath="https://github.com/Cotton059/Light-Help"; $s.Save()
```

### 🛡️ PowerShell 创建管理员快捷方式
> **提示：** 此脚本将自动识别你的桌面路径并注入底层提权标志，为你生成一个默认以管理员权限运行的 PowerShell 桌面图标。
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/light/Create_AdminPSShortcut_Tool.ps1 | iex
```
---
**▶️ 光速分享 (YT) 视频教程：** [一行代码彻底汉化 GitHub！最快配置方案](https://youtu.be/n7P0SFjFppg)  
*（专属帮助项目，观看用户专用）*

<a href="https://youtu.be/n7P0SFjFppg" target="_blank">
  <img src="images/013-1280-zh.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 🌐 GitHub 沉浸母语版
> **提示：** 完美GitHub原生布局快速安装chrome官方插件，推荐使用它
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/light/GitHub-CN-Installer_Tool.ps1 | iex
```
### 🐵 篡改猴 (Tampermonkey) 用户专用版
> **提示：** 安装过篡改猴（Tampermonkey）的用户专用。直接复制下面这条链接到浏览器中打开，即可跳转安装中文插件。脚本作者是 maboloshi/github-chinese
```powershell

https://github.com/Cotton059/Light-Help/raw/refs/heads/main/ThirdParty/maboloshi_github-chinese/main.user.js
```

---
**▶️ 光速分享 (YT) 视频教程：** [一行代码搞定！Windows 软件数据一键备份与恢复](https://youtu.be/5bBx3p3nWok)  
*（专属帮助项目，观看用户专用）*

<a href="https://youtu.be/5bBx3p3nWok" target="_blank">
  <img src="images/012-1280-zh.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 💿 软件数据备份/恢复
> **提示：** 将备份整个Users目录，包含🆗AppData🆗下载🆗图片🆗文档🆗
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/AppBackup_Tool.ps1 | iex
```


---
**▶️ 光速分享 (YT) 视频教程：** [一行代码深度清理 Windows！无需安装软件，一键释放巨量系统空间](https://youtu.be/f5Ta_W54GL0)  
*（专属帮助项目，观看用户专用）*

<a href="https://youtu.be/f5Ta_W54GL0" target="_blank">
  <img src="images/011-1280-zh.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

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
**▶️ 光速分享 (YT) 视频教程：** [免费家庭影院搭建教程｜无需NAS，一台电脑实现自动海报墙 + 全设备播放](https://youtu.be/EPpgy2S_9lg)  
*（专属帮助项目，观看用户专用）*

<a href="https://youtu.be/EPpgy2S_9lg" target="_blank">
  <img src="images/009-1280-zh.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 📁 创建共享文件夹与启用 SMB 服务
> **提示：** 此操作将帮助您快速配置局域网共享环境，自动创建网络共享文件夹并开启系统底层 SMB 服务，实现多设备间的高效访问与互传。

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/SMB_Share_Tool.ps1 | iex
```

### 📡 获取系统用户名与内网 IP
> **提示：** 一键提取当前系统的登录用户名与局域网 IPv4 地址，为您进行远程桌面连接、局域网共享或网络调试提供关键参数。

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/GetInfo.ps1 | iex
```

### 🔑 强制修改或创建电脑密码
> **提示：** 绕过繁琐的系统设置层级，通过命令直接为您的本地账户快速重置，或创建全新的安全登录密码。

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/ResetPass.ps1 | iex
```

### 🔓 设置开机自动登录（免密）
> **提示：** 自动配置底层登录凭据，实现电脑开机跳过锁屏密码界面直接进入桌面，大幅提升个人专属设备的启动效率。

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/Win1011AutoLogin.ps1 | iex
```

---

**▶️ 光速分享 (YT) 视频教程：** [iPhone照片视频无线传输到Windows无需任何软件](https://youtu.be/USNIBEAcWME)  
*（专属帮助项目，观看用户专用）*

<a href="https://youtu.be/USNIBEAcWME" target="_blank">
  <img src="images/007-1280-zh.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 📁 创建共享文件夹与启用 SMB 服务
> **提示：** 此操作将帮助您快速配置局域网共享环境，自动创建网络共享文件夹并开启系统底层 SMB 服务，实现多设备间的高效访问与互传。

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/SMB_Share_Tool.ps1 | iex
```

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

