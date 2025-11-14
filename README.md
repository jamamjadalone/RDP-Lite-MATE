# 🚀 RDP-Lite-MATE: Easy Cloud Remote Desktop Setup

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Platform: Linux](https://img.shields.io/badge/Platform-Linux-blue)](https://www.linux.org/)
[![Shell: Bash](https://img.shields.io/badge/Shell-Bash-green)](https://www.gnu.org/software/bash/)
[![Cloud Ready](https://img.shields.io/badge/Cloud-Ready-brightgreen)](#quick-start)

A simple, robust, and clean installation script that sets up a lightweight **MATE Desktop Environment** with **Chrome Remote Desktop (CRD) Host** on Debian/Ubuntu-based Linux cloud environments—perfect for Google Cloud Shell, AWS, Azure, DigitalOcean, and standard Debian/Ubuntu VMs.

**Designed for stability, simplicity, and minimal resource usage.**

## 📋 Table of Contents

- [Features](#-features)
- [System Requirements](#-system-requirements)
- [Installation Steps](#-installation-steps)
- [Optional: Install Google Chrome](#-optional-install-google-chrome)
- [Troubleshooting](#-troubleshooting)
- [Project Structure](#-project-structure)
- [Contributing](#-contributing)
- [License](#-license)
- [Support](#-support)

## ✨ Features

- ✅ **One-Command Installation**: Single script handles all setup automatically
- ✅ **Lightweight MATE Desktop**: Minimal resource footprint, ideal for cloud VMs
- ✅ **Chrome Remote Desktop Integration**: Full support for Google's CRD
- ✅ **Clean Installation**: Removes conflicting packages before setup
- ✅ **Cloud-Optimized**: Works on Google Cloud Shell, AWS, Azure, and more
- ✅ **Automatic Dependency Management**: Handles all required packages
- ✅ **Easy Authorization**: Simple 6-digit PIN setup
- ✅ **No Manual Configuration Required**: Install and connect—that's it!

## 💻 System Requirements

| Requirement | Specification |
|-------------|---------------|
| **OS** | Debian 10+, Ubuntu 18.04+, or compatible |
| **Architecture** | x86_64 (64-bit) |
| **Disk Space** | Minimum 5GB free space |
| **RAM** | Minimum 512MB (1GB+ recommended) |
| **Internet** | Stable connection required |
| **Privileges** | Root or sudo access |

## 📖 Installation Steps

### Step 1: Download and Run the Installation Script
Copy and paste this single command into your terminal:

```bash
wget https://raw.githubusercontent.com/jamamjadalone/RDP-Lite-MATE/main/install.sh && chmod +x install.sh && ./install.sh
```

The script will automatically:
1. Update system packages
2. Install MATE Desktop Environment
3. Install Chrome Remote Desktop Host
4. Configure the system
5. Display a success message

⏱️ **Installation typically takes 3-5 minutes.** The script will show "Setup Complete" when finished.

**What the script does:**
- Updates system packages
- Removes conflicting desktop environments
- Installs MATE Desktop Environment
- Installs Chrome Remote Desktop Host
- Configures all services
- Cleans up temporary files

**Expected output:**
```
✓ Installing dependencies...
✓ Setting up MATE Desktop...
✓ Configuring Chrome Remote Desktop...
✓ Setup Complete!
```
### Step 2: Authorize Your Remote Desktop (⚠️ Critical - Manual Step)

After the script finishes, **authorization is mandatory** to link the host to your Google Account. This step **cannot be automated**.

#### Authorization Process:

1. **Open the Chrome Remote Desktop Setup Page**  
   Visit: https://remotedesktop.google.com/headless

2. **Generate the Authorization Code**
   - Ensure the **Linux** tab is selected
   - Follow the prompts
   - Copy the complete command (starting with `DISPLAY= /opt/google/chrome-remote-desktop --code=...`)

3. **Execute the Authorization Command**
   - Paste the copied command into your terminal
   - Press **Enter**

4. **Set Your 6-Digit PIN**
   - When prompted, enter a memorable 6-digit PIN
   - You'll use this PIN to connect to your remote desktop

5. **Verify Connection**
   - ✅ Your host should now appear **"Online"** on your [Chrome Remote Desktop access page](https://remotedesktop.google.com/access/)

---

## 📦 Optional: Install Google Chrome

To add the **Google Chrome browser** to your MATE desktop session, run these commands **after your remote connection is confirmed online**:

```bash
# Download Google Chrome stable release
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install the package
sudo dpkg --install google-chrome-stable_current_amd64.deb

# Fix any dependency issues (if needed)
sudo apt install -y --fix-broken

# Clean up the installer file
rm google-chrome-stable_current_amd64.deb
```

**Launch Chrome:**
- Use the MATE applications menu, or
- Run in terminal: `google-chrome`

---

## 🐛 Troubleshooting

### Installation Script Hangs

**Symptoms:** Script appears frozen during installation

**Solutions:**
1. Press `Ctrl+C` to stop
2. Check your internet connection
3. Wait a few minutes (installation can be slow on cloud VMs)
4. Run the script again

### Host Not Appearing Online

**Symptoms:** Authorization completed but host doesn't show as "Online"

**Solutions:**
1. Verify Chrome Remote Desktop Host is running:
   ```bash
   sudo systemctl status chrome-remote-desktop
   ```
2. Restart the service:
   ```bash
   sudo systemctl restart chrome-remote-desktop
   ```
3. Ensure your PIN is set correctly (redo Step 2)
4. Check firewall settings allow outbound HTTPS connections

### Cannot Connect to Remote Desktop

**Symptoms:** Host is online but connection fails

**Solutions:**
1. Verify PIN is correct (6 digits)
2. Check network connection stability
3. Try connecting from a different network
4. Reinstall CRD:
   ```bash
   sudo apt install --reinstall chrome-remote-desktop
   ```

### Poor Connection Quality

**Solutions:**
- Use a wired internet connection if possible
- Close unnecessary applications on the remote machine
- Reduce screen resolution in CRD settings
- Check available bandwidth

### MATE Desktop Not Displaying

**Symptoms:** Black screen or no desktop visible after connection

**Solutions:**
1. Restart the CRD service:
   ```bash
   sudo systemctl restart chrome-remote-desktop
   ```
2. Reconnect to the remote desktop
3. If issue persists, reinstall MATE:
   ```bash
   sudo apt install --reinstall mate-desktop-environment
   ```

### Permission Denied Errors

**Solutions:**
1. Ensure you have sudo access
2. Run installation script with appropriate privileges:
   ```bash
   sudo ./install.sh
   ```

---

## 📁 Project Structure

```
RDP-Lite-MATE/
├── install.sh              # Main installation script
├── README.md               # This file
├── LICENSE                 # MIT License
└── docs/
    ├── TROUBLESHOOTING.md  # Extended troubleshooting guide
    ├── FAQ.md              # Frequently asked questions
    └── ADVANCED.md         # Advanced configuration
```

---

## 🤝 Contributing

We welcome contributions! Here's how to help:

### Report Issues

Found a bug? [Open an issue](https://github.com/jamamjadalone/RDP-Lite-MATE/issues) with:
- Your OS version (e.g., Ubuntu 22.04)
- Installation steps you followed
- Complete error messages
- Expected vs. actual behavior

### Submit Improvements

Want to improve the script?

1. Fork the repository
2. Create a feature branch:
   ```bash
   git checkout -b feature/your-improvement
   ```
3. Make your changes and test thoroughly
4. Commit with clear messages:
   ```bash
   git commit -m "Add: Description of improvement"
   ```
5. Push to your fork:
   ```bash
   git push origin feature/your-improvement
   ```
6. Open a Pull Request with a clear description

### Code Standards

- Use clear, readable Bash code
- Comment complex sections
- Test on multiple OS versions (Debian 10+, Ubuntu 18.04+)
- Follow existing code style
- Include error handling

---

## 📄 License

This project is licensed under the **MIT License**—see the [LICENSE](LICENSE) file for full details.

You are free to use, modify, and distribute this project for personal and commercial use.

---

## 💬 Support

### Need Help?

- **📖 Documentation**: Check the [docs](docs/) folder
- **🐛 Report Issues**: [GitHub Issues](https://github.com/jamamjadalone/RDP-Lite-MATE/issues)
- **💭 Discussions**: [GitHub Discussions](https://github.com/jamamjadalone/RDP-Lite-MATE/discussions)

### Quick Links

- [Chrome Remote Desktop Help](https://support.google.com/chromebook/answer/1649523)
- [MATE Desktop Official Site](https://mate-desktop.org/)
- [Debian Documentation](https://www.debian.org/doc/)
- [Ubuntu Documentation](https://ubuntu.com/support)

---
## 👨‍💻 Author

**Created by:** [jamamjadalone](https://github.com/jamamjadalone)  
**Last Updated:** 2025-11-14

---

## ⭐ Show Your Support

If this project helped you:
- ⭐ Star this repository
- 🔄 Share it with others
- 💬 Leave feedback or suggestions

---

**Made with ❤️ for easy remote desktop access on the cloud**
