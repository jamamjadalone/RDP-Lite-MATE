#!/bin/bash

# --- RDP-LITE: One-Block Setup Script for MATE/CRD ---

# 1. Clean up any previous, potentially conflicting CRD or XFCE installations
# '|| true' allows the script to continue if the packages aren't installed
sudo apt purge -y chrome-remote-desktop ^xfce4* || true && sudo apt autoremove -y

# 2. Update and install MATE Desktop, necessary X components, and dependencies
sudo apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt install -y mate-core mate-desktop-environment dbus-x11

# 3. Download and install the Chrome Remote Desktop Host package
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb

# 4. Install the Chrome Remote Desktop Host package
sudo dpkg --install chrome-remote-desktop_current_amd64.deb

# 5. Fix any broken dependencies (essential for a clean install)
sudo apt install -y --fix-broken

# 6. CRITICAL: Configure CRD to launch the new MATE session instead of the default
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/mate-session" > /etc/chrome-remote-desktop-session'

# 7. Clean up the downloaded CRD package
rm chrome-remote-desktop_current_amd64.deb

# --- Setup Complete ---
echo "========================================================================"
echo "MATE Desktop and Chrome Remote Desktop Host installed successfully!"
echo "NEXT STEP IS CRITICAL: YOU MUST RUN THE MANUAL AUTHORIZATION COMMAND."
echo "See the README or visit: https://remotedesktop.google.com/headless"
echo "========================================================================"
