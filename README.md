```markdown
# 🚀 RDP-Lite-MATE: Easy Cloud Remote Desktop Setup

This repository provides a single, robust script to set up a clean, lightweight **MATE Desktop Environment** and **Chrome Remote Desktop (CRD) Host** on Debian/Ubuntu-based Linux cloud environments (such as Google Cloud Shell or standard Debian/Ubuntu VMs).

This setup is designed for **stability and simplicity** by using MATE and enforcing a clean slate before installation.

## 💻 Setup Instructions

Follow these two critical steps to get your remote desktop access online.

### Step 1: Run the Installation Script (One Command)

Run the following command in your Cloud Shell or Linux terminal. This command handles all installation, cleanup, and configuration automatically:

```bash
wget https://raw.githubusercontent.com/jamamjadalone/RDP-Lite-MATE/main/install.sh && chmod +x install.sh && ./install.sh
```

> **Note**: The script may take a few minutes to complete as it downloads and installs all necessary packages. Wait until you see the "Setup Complete" message in your terminal.

### Step 2: Crucial Final Step (Manual Authorization)

After the script finishes, the host is installed, but it is **not yet linked to your Google Account**. This step is mandatory and cannot be automated:

#### 📋 Authorization Process:

1. **Generate Code**: Open this link in your browser:  
   **[Chrome Remote Desktop Headless Setup](https://remotedesktop.google.com/headless)**

2. **Follow the prompts**:
   - Ensure the **Linux** tab is selected
   - Copy the entire command (the one starting with `./chrome-remote-desktop --code=...`)

3. **Execute Command**: Paste the copied command into your terminal and press **Enter**

4. **Set PIN**: Enter your desired **6-digit PIN** when prompted

✅ **Your host should now appear "Online" on your [Chrome Remote Desktop access page](https://remotedesktop.google.com/access/)!**

---

## 🌐 Post-Installation (Optional: Google Chrome Browser)

To install the **Google Chrome web browser** inside your new MATE remote session, run the following commands in your terminal **after the connection is online**:

```bash
# Download Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install the package
sudo dpkg --install google-chrome-stable_current_amd64.deb

# Fix any dependency issues
sudo apt install -y --fix-broken

# Clean up the downloaded file
rm google-chrome-stable_current_amd64.deb
```

> **Tip**: After installation, you can launch Chrome from the MATE desktop applications menu or by running `google-chrome` in the terminal.

---

## 🛠️ Troubleshooting

If you encounter any issues:
- Ensure your cloud instance has sufficient resources (at least 2GB RAM recommended)
- Check that all dependencies were installed correctly
- Verify your Google Account has access to Chrome Remote Desktop
- Restart the Chrome Remote Desktop service if needed

## 📝 License

This project is open source and available under the [MIT License](LICENSE).


**Enjoy your cloud remote desktop!** 🎉
```
