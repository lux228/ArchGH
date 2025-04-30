#!/usr/bin/env bash
set -e

echo "Creating build user for yay..."

# Create a non-root user just for yay build
useradd -m -G wheel yaybuilder
echo 'yaybuilder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/yaybuilder

# Build yay as non-root user
cd /home/yaybuilder
sudo -u yaybuilder git clone https://aur.archlinux.org/yay.git
cd yay
sudo -u yaybuilder makepkg -si --noconfirm
cd ..
rm -rf yay

# Clean up
userdel -r yaybuilder
rm -f /etc/sudoers.d/yaybuilder

echo "yay installed successfully!"
