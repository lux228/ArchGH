#!/usr/bin/env bash
set -e

# Install yay from built package
pacman -U yay-12.5.0-1-x86_64.pkg.tar.zst

echo "[*] Setting up fish shell with starship prompt..."

# Change default shell to fish for root
chsh -s /bin/fish root

# Create fish config folder
mkdir -p /root/.config/fish

# Add config.fish
cat << 'EOF' > /root/.config/fish/config.fish
# Enable starship prompt
starship init fish | source

# Optional: custom greeting
function fish_greeting
    echo "Welcome to the Arch Greybeards Hall"
end

neofetch
EOF

# Create starship config
mkdir -p /root/.config
cat << 'EOF' > /root/.config/starship.toml
add_newline = false

[character]
success_symbol = "[➜](bold cyan) "
error_symbol = "[✗](bold red) "
EOF

echo "[*] Fish shell environment configured successfully."
