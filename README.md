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
> 
> **教程链接：** 🔗[YouTube 视频教程](https://youtu.be/q_gJc6e8tK0) | 🔗[Bilibili 视频教程](https://www.bilibili.com/video/BV1iXVA6rEdn/)
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

## 📑 视频教程导航
- [▶️ 30秒彻底阻断 iOS 静默升级](#️-光速分享-yt-视频教程30秒彻底阻断-ios-静默升级让你的-iphone-永远停在养老甜点位)
- [▶️ PowerShell 终极运行指南 (Win/Mac/Linux)](#️-光速分享-yt-视频教程powershell-脚本终极运行指南提权修复与全平台配置)
- [▶️ Windows 内存终极拯救](#️-光速分享-yt-视频教程windows-1110-内存终极拯救一行代码一键释放-ram让电脑瞬间起飞)
- [▶️ 一行代码利用AI一键生成完美证件照](#️-光速分享-yt-视频教程一行代码利用ai一键生成完美证件照别再去照相馆花冤枉钱了省时又省力)
- [▶️ 一行代码彻底汉化 GitHub！](#️-光速分享-yt-视频教程一行代码彻底汉化-github最快配置方案)
- [▶️ 一行代码搞定！Windows 软件数据一键备份与恢复](#️-光速分享-yt-视频教程一行代码搞定windows-软件数据一键备份与恢复)
- [▶️ 一行代码深度清理 Windows！](#️-光速分享-yt-视频教程一行代码深度清理-windows无需安装软件一键释放巨量系统空间)
- [▶️ 免费家庭影院搭建教程｜无需NAS](#️-光速分享-yt-视频教程免费家庭影院搭建教程无需nas一台电脑实现自动海报墙--全设备播放)
- [▶️ iPhone照片视频无线传输到Windows](#️-光速分享-yt-视频教程iphone照片视频无线传输到windows无需任何软件)

---
#### ▶️ 光速分享 (YT) 视频教程：[30秒彻底阻断 iOS 静默升级，让你的 iPhone 永远停在“养老甜点位”](https://youtu.be/grUi6NUjOh0)

<a href="https://youtu.be/grUi6NUjOh0" target="_blank">
  <img src="images/020-1920-zh.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 🛡️ 一键屏蔽 iOS 系统更新 (免电脑/免越狱)
> **提示：** 彻底告别苹果跨代强制更新与静默升级。请直接使用 iPhone 自带的 **Safari 浏览器** 访问以下专属节点，系统将自动弹出“已下载描述文件”的提示。点击允许并进入系统“设置”中一键安装，全程不到 30 秒。

**专属无广告 OTA 屏蔽节点：**
```text
ota.103386.xyz	
```
---
#### ▶️ 光速分享 (YT) 视频教程：[PowerShell 脚本终极运行指南：提权、修复与全平台配置](https://youtu.be/q_gJc6e8tK0)

<a href="https://youtu.be/q_gJc6e8tK0" target="_blank">
  <img src="images/021-1920-zh.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 🚑 Windows 环境修复与独立版安装
> **提示：** 如果您的精简版/老旧版系统找不到 PowerShell 或运行闪退报错，请按下 `Win + R` 输入 `cmd` 回车后，选择以下任一方案执行：

**方案 A：唤醒系统底层休眠组件 (CMD运行)**
```cmd
dism /online /Enable-Feature /FeatureName:MicrosoftWindowsPowerShellRoot /All
```
**方案 B：安装PowerShell 7 官方组件 (CMD运行)**
```cmd
curl -L -o PS.msi https://github.com/PowerShell/PowerShell/releases/download/v7.4.2/PowerShell-7.4.2-win-x64.msi && msiexec /i PS.msi /qb
```
### 🍏 Mac 系统安装 PowerShell

> **提示：** 如果您的 macOS 需要安装 PowerShell 跨平台终端环境，请按下 `Command + 空格` 搜索并打开“终端”(Terminal)。

```Bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
> **提示：** 安装好 Homebrew 后，复制以下命令一键安装 PowerShell：

```Bash
brew install --cask powershell
```
### 🐧Linux 系统安装 (以 Ubuntu 的 Snap 包管理器为例)：
> **提示**： 如果您的 Linux 系统缺少 PowerShell 运行组件，请直接打开系统的命令行终端，并使用自带的包管理器拉取最新版环境
```Bash
sudo snap install powershell --classic
```


---
#### ▶️ 光速分享 (YT) 视频教程：[Windows 11/10 内存终极拯救：一行代码一键释放 RAM，让电脑瞬间起飞！](https://youtu.be/PqKu_lRyAZM)

<a href="https://youtu.be/PqKu_lRyAZM" target="_blank">
  <img src="images/015-1920-zh.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 🚀 内存终极释放工具
> **提示：** 一键深度释放 Windows 系统 RAM，高效清理内存占用，让您的电脑瞬间恢复流畅的运行体验。

```powershell
iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/light/CryoRAM_Tool.ps1 | iex
```
---
#### ▶️ 光速分享 (YT) 视频教程：[一行代码利用AI一键生成完美证件照，别再去照相馆花冤枉钱了！省时又省力！](https://youtu.be/q4KUOJbgJZ4)

<a href="https://youtu.be/q4KUOJbgJZ4" target="_blank">
  <img src="images/014-1920-zh.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 📸 AI 证件照完美提示词生成工具
> **提示：** 生成多类型完美证件照提示词，发至任意AI一键生成完美标准尺寸的证件照，省时省力

```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/light/AIPortrait_Tool.ps1 | iex
```
---
#### ▶️ 光速分享 (YT) 视频教程：[一行代码彻底汉化 GitHub！最快配置方案](https://youtu.be/n7P0SFjFppg)

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
#### ▶️ 光速分享 (YT) 视频教程：[一行代码搞定！Windows 软件数据一键备份与恢复](https://youtu.be/5bBx3p3nWok)

<a href="https://youtu.be/5bBx3p3nWok" target="_blank">
  <img src="images/012-1280-zh.png" width="320" style="border-radius: 8px;" alt="视频封面图" title="点击播放视频" />
</a>

### 💿 软件数据备份/恢复
> **提示：** 将备份整个Users目录，包含🆗AppData🆗下载🆗图片🆗文档🆗
```powershell

iwr -useb https://raw.githubusercontent.com/Cotton059/Light-Help/main/AppBackup_Tool.ps1 | iex
```


---
#### ▶️ 光速分享 (YT) 视频教程：[一行代码深度清理 Windows！无需安装软件，一键释放巨量系统空间](https://youtu.be/f5Ta_W54GL0)

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
#### ▶️ 光速分享 (YT) 视频教程：[免费家庭影院搭建教程｜无需NAS，一台电脑实现自动海报墙 + 全设备播放](https://youtu.be/EPpgy2S_9lg)

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

#### ▶️ 光速分享 (YT) 视频教程：[iPhone照片视频无线传输到Windows无需任何软件](https://youtu.be/USNIBEAcWME)

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

