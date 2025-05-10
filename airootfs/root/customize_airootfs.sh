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