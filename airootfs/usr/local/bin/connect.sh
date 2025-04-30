#!/usr/bin/env bash
set -e

echo "[*] Enabling NetworkManager..."
systemctl enable NetworkManager
systemctl start NetworkManager

# Check for Wi-Fi
if nmcli device | grep -q wifi; then
    echo "[*] Detected wireless interface. Launching nmtui for Wi-Fi selection..."
    sleep 1
    nmtui
else
    echo "[*] Attempting auto-connection on wired interface..."
    nmcli device connect "$(nmcli device | awk '/ethernet/ {print $1}' | head -n 1)"
fi

echo "[*] Network connection should now be active."
