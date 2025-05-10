#!/usr/bin/env bash

# Set fish as default shell for the live user
chsh -s /usr/bin/fish archiso

# Enable SDDM
systemctl enable sddm.service

# Enable NetworkManager
systemctl enable NetworkManager.service

# Set up starship for root
mkdir -p /root/.config
cp /etc/skel/.config/starship.toml /root/.config/
cp /etc/skel/.config/fish/config.fish /root/.config/fish/

# Set fish as default shell for root
chsh -s /usr/bin/fish root

# Create a welcome message
cat > /etc/motd << EOF
Welcome to Arch Greybeards Hall!
A minimal KDE-based Arch Linux distribution.
EOF

# Create build user and install yay
useradd -m -G wheel -s /bin/bash builder
echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
chown -R builder:builder .
sudo -u builder makepkg -si --noconfirm
cd /
rm -rf /tmp/yay
userdel -r builder
rm /etc/sudoers.d/builder

# Copy branding assets
mkdir -p /usr/share/wallpapers/AGH
cp /root/Branding/wallpaper.jpg /usr/share/wallpapers/AGH/wallpaper.jpg
cp /root/Branding/logo.png /usr/share/wallpapers/AGH/logo.png
cp /root/Branding/logo.svg /usr/share/wallpapers/AGH/logo.svg
cp /root/Branding/grub.xpm.gz /grub.xpm.gz 