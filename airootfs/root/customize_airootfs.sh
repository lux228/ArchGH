#!/usr/bin/env bash
set -e

echo "Installing yay from AUR..."

# Create working directory for yay
cd /opt
git clone https://aur.archlinux.org/yay.git
chown -R root:root yay
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

echo "yay installed successfully."
