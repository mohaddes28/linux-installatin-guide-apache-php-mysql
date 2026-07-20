# Antigravity IDE Installation & Setup Guide for Linux

A step-by-step guide for installing, configuring, and managing **Antigravity IDE**—the AI-native coding assistant and agentic development environment—on Linux (Ubuntu, Debian, Fedora, Arch Linux).

---

## 📋 Table of Contents
1. [Overview & Prerequisites](#1-overview--prerequisites)
2. [System Requirements](#2-system-requirements)
3. [Installation Methods](#3-installation-methods)
   - [Method 1: Installing via .deb Package (Ubuntu/Debian)](#method-1-installing-via-deb-package-ubuntudebian)
   - [Method 2: Installing via Tarball (.tar.gz)](#method-2-installing-via-tarball-targz)
   - [Method 3: Running via AppImage](#method-3-running-via-appimage)
4. [Desktop Integration & Launcher Setup](#4-desktop-integration--launcher-setup)
5. [CLI Command Setup](#5-cli-command-setup)
6. [First-Time Launch & Configuration](#6-first-time-launch--configuration)
7. [Customization & Agent Settings](#7-customization--agent-settings)
8. [Troubleshooting & Common Issues](#8-troubleshooting--common-issues)
9. [Updating and Uninstalling](#9-updating-and-uninstalling)

---

## 1. Overview & Prerequisites

**Antigravity IDE** is an agentic AI coding environment designed by Google DeepMind for pair-programming, codebase automation, and advanced agentic software engineering.

Before installing, ensure your Linux system has basic utilities installed:

```bash
sudo apt update
sudo apt install -y curl wget git tar ca-certificates libnss3 libgbm1 libasound2
```

---

## 2. System Requirements

| Resource | Minimum Requirement | Recommended |
| :--- | :--- | :--- |
| **OS** | Ubuntu 20.04 LTS+, Debian 11+, Fedora 36+, Arch Linux | Ubuntu 22.04 / 24.04 LTS |
| **Architecture** | x86_64 (64-bit) or ARM64 | x86_64 |
| **RAM** | 4 GB | 8 GB or higher |
| **Disk Space** | 1.5 GB available | 5 GB available |
| **GLIBC Version** | GLIBC 2.28 or higher | GLIBC 2.31+ |

---

## 3. Installation Methods

Choose one of the following installation methods based on your Linux distribution and preference.

> [!IMPORTANT]  
> **Official Distribution Format**: Google releases Antigravity for Linux as an **official `.tar.gz` archive** directly via **[https://antigravity.google](https://antigravity.google)**. Google does **not** provide an official `.deb` package or APT repository for Linux.

---

### Method 1: Official Tarball (`.tar.gz`) Installation (Recommended for All Distros)

This is the official and standard method supported by Google across all Linux distributions (Ubuntu, Debian, Fedora, Arch Linux).

#### Step 1: Download the Official Tarball Archive
1. Visit **[https://antigravity.google/download](https://antigravity.google/download)** in your web browser.
2. Download the official Linux archive (`antigravity-linux-x64.tar.gz` or similar).

Alternatively, if downloading from terminal with your session link:

```bash
cd ~/Downloads
wget "<COPIED_DOWNLOAD_URL_FROM_PORTAL>" -O antigravity-linux-x64.tar.gz
```

#### Step 2: Extract to `/opt` Directory
```bash
# Create target installation directory
sudo mkdir -p /opt/antigravity-ide

# Extract archive contents into /opt/antigravity-ide
sudo tar -xzf antigravity-linux-x64.tar.gz -C /opt/antigravity-ide --strip-components=1

# Set appropriate directory permissions
sudo chown -R root:root /opt/antigravity-ide
sudo chmod -R 755 /opt/antigravity-ide
```

#### Step 3: Create System Command Symlink
Create a symlink for `antigravity-ide` in `/usr/local/bin` so it can be launched from any terminal:

```bash
# Create primary symlink for antigravity-ide
sudo ln -sf /opt/antigravity-ide/antigravity-ide /usr/local/bin/antigravity-ide

# (Optional) Create shortcut alias for 'antigravity'
sudo ln -sf /usr/local/bin/antigravity-ide /usr/local/bin/antigravity
```

#### Step 4: Verify Installation
```bash
antigravity-ide --version
```

---

### Method 2: Community Package Wrappers (`.deb` / AppImage)

> [!NOTE]
> Community scripts or third-party wrappers on GitHub sometimes package the official `.tar.gz` into `.deb` or `AppImage` formats. If you have a custom `.deb` wrapper built from the official tarball, install it via:

```bash
# Install custom/community .deb package:
sudo apt update
sudo apt install -y ./antigravity-custom.deb
```

For AppImage community builds, ensure you have the required dependencies:

```bash
# Ubuntu / Debian
sudo apt install -y libfuse2

# Fedora
sudo dnf install -y fuse-libs

# Arch Linux
sudo pacman -S fuse2
```

```bash
# Download AppImage (replace <DOWNLOAD_URL>):
wget <DOWNLOAD_URL> -O Antigravity-IDE-x86_64.AppImage

# Grant execution permission
chmod +x Antigravity-IDE-x86_64.AppImage
```

#### Step 3: Run Antigravity IDE
```bash
./Antigravity-IDE-x86_64.AppImage
```

---

## 4. Desktop Integration & Launcher Setup

Create a system-wide desktop launcher (`.desktop` entry) in `/usr/share/applications/antigravity-ide.desktop` so AntiGravity IDE appears in the Linux application menu with custom icon and URL scheme handlers.

### Option A: System-Wide Launcher (Recommended)
Create `/usr/share/applications/antigravity-ide.desktop`:

```bash
sudo cat <<EOF | sudo tee /usr/share/applications/antigravity-ide.desktop > /dev/null
[Desktop Entry]
Version=1.0
Type=Application
Name=AntiGravity IDE
Comment=Native Agentic Coding Environment by Google DeepMind
Exec=/opt/antigravity-ide/antigravity-ide %U
Icon=/home/mohaddes/Pictures/Shared/google_antigravity_logo.png
Terminal=false
StartupWMClass=antigravity-ide
Categories=Development;IDE;
MimeType=text/x-python;x-scheme-handler/antigravity;x-scheme-handler/antigravity-ide;
EOF
```

### Option B: User-Specific Launcher (Single User)
If installing without `sudo`:

```bash
cat <<EOF > ~/.local/share/applications/antigravity-ide.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=AntiGravity IDE
Comment=Native Agentic Coding Environment by Google DeepMind
Exec=/opt/antigravity-ide/antigravity-ide %U
Icon=/home/mohaddes/Pictures/Shared/google_antigravity_logo.png
Terminal=false
StartupWMClass=antigravity-ide
Categories=Development;IDE;
MimeType=text/x-python;x-scheme-handler/antigravity;x-scheme-handler/antigravity-ide;
EOF
```

### Update Desktop Application Database Cache
Refresh the application menu database:

```bash
# Update system-wide cache:
sudo update-desktop-database /usr/share/applications/

# Update user cache:
update-desktop-database ~/.local/share/applications/
```

---

## 5. CLI Command Setup

To open projects directly from the terminal using `antigravity-ide .` or `antigravity .`:

Ensure `/usr/local/bin` is in your environment `PATH` in `~/.bashrc` or `~/.zshrc`:

```bash
echo 'export PATH="$PATH:/usr/local/bin"' >> ~/.bashrc
source ~/.bashrc
```

Verify terminal execution:

```bash
antigravity-ide --help
```

---

## 6. First-Time Launch & Configuration

### Launching the IDE
Launch from your application menu or terminal:

```bash
# Open current directory
antigravity-ide .
# or
antigravity .

# Open specific project folder
antigravity-ide /var/www/my-project
```

### Initial Configuration
1. **Google Account Authentication**: Sign in with your account when prompted to activate AI pair-programming capabilities.
2. **Model Selection**: Select your preferred AI model engine (e.g., Gemini Flash / Pro).
3. **Workspace Permissions**: Grant terminal and file-system permissions when executing tasks.

---

## 7. Customization & Agent Settings

Antigravity IDE supports global and workspace-level customization rules and skills.

### Directory Structure & Settings Locations

| Setting Type | File Location | Purpose |
| :--- | :--- | :--- |
| **Global Rules** | `~/.gemini/config/AGENTS.md` | Universal rules applied across all projects |
| **Global Skills** | `~/.gemini/config/skills/` | Shared AI agent automation workflows |
| **Project Rules** | `.agents/AGENTS.md` | Workspace-specific instructions and coding styles |
| **Project Skills** | `.agents/skills/` | Project-specific agent skills |
| **App Data** | `~/.gemini/antigravity-ide/` | IDE internal state, logs, and artifacts |

---

## 8. Troubleshooting & Common Issues

### Issue 1: Electron Chrome Sandbox Error
If launch fails with `The SUID sandbox helper binary was not found`:

Launch with `--no-sandbox`:
```bash
antigravity --no-sandbox
```

Or set the correct sandbox permissions:
```bash
sudo chown root /opt/antigravity-ide/chrome-sandbox
sudo chmod 4755 /opt/antigravity-ide/chrome-sandbox
```

---

### Issue 2: AppImage fails to start (FUSE issue)
If double-clicking the AppImage does nothing:

```bash
sudo apt install -y libfuse2
```

---

### Issue 3: `antigravity: command not found`
Check where the binary is installed:

```bash
which antigravity
# If empty, recreate the symlink:
sudo ln -sf /opt/antigravity-ide/antigravity /usr/local/bin/antigravity
```

---

## 9. Updating and Uninstalling

### Updating Antigravity IDE

#### Package Manager (`.deb`):
```bash
sudo apt update
sudo apt --only-upgrade install antigravity-ide
```

#### Manual Extraction (`.tar.gz` / AppImage):
Replace `/opt/antigravity-ide` with the newly extracted version or download the updated AppImage file.

---

### Uninstalling Antigravity IDE

#### Remove `.deb` Installation:
```bash
sudo apt remove --purge antigravity-ide -y
sudo apt autoremove -y
```

#### Remove Tarball / Manual Installation:
```bash
sudo rm -rf /opt/antigravity-ide
sudo rm -f /usr/local/bin/antigravity-ide /usr/local/bin/antigravity
sudo rm -f /usr/share/applications/antigravity-ide.desktop
rm -f ~/.local/share/applications/antigravity-ide.desktop
```

#### Clear Local Settings & Data (Optional):
```bash
rm -rf ~/.gemini/antigravity-ide
rm -rf ~/.gemini/config
```
