#!/usr/bin/env bash

echo
echo "CossenOS post-installation script!"
echo

PKGS=(
	'base-devel'	# Base package group
	'xorg-server'	# Display server
	'xorg-drivers'	# Display Drivers 
	'xorg-xinit'	# Display server init
	'xorg-xinput'	# XOrg xinput
	'python-pip'	# Python package manager
	'zsh'		# Shell
	'git'		# Version control system
	'rofi'		# Menu
	'rsync'		# File transfer
	'picom'		# Compositor
	'xclip'		# Clipboard
	'ffmpeg'	# Video editing
	'mpv'		# Media player
	'gimp'		# Image editor
	'sxiv'		# Image viewier
	'neofetch'	# System info
	'nitrogen'	# Wallpapers
	'pandoc'	# Convert documents
	'zathura'	# Document viewer
	'lolcat'	# Colorful text
	'neovim'	# Text editor
)

for PKG in "${PKGS[@]}"; do
    echo "Installing ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done! Starting yay setup..."
echo

# Change default shell
chsh -s $(which zsh)

cd "${HOME}"

echo "Cloning yay"
git clone "https://aur.archlinux.org/yay.git"
cd yay
makepkg -si

cd "${HOME}"

# Web browser
yay -S --noconfirm brave-bin

echo "Installing Python libraries"
pip install yt-dlp

echo
echo "Done! Getting the CossenOS wallpaper..."
echo

mkdir wallpapers
wget --output-document="${HOME}/wallpapers/wpp.jpg" "https://wikilovesearth.wikimedia.pt/wp/wp-content/uploads/2022/05/Serra_da_Estrela-_Brumas_Matinais-2048x925.jpg"
nitrogen --set-auto ~/wallpapers/wpp.jpg
echo 'nitrogen --restore &' >> "${HOME}/.xinitrc"

# echo
# echo "Done! Installing Nerd Fonts..."
# echo
# 
# curl -sS https://webi.sh/nerdfont | sh

echo
echo "Done! Getting the CossenOS dotfiles..."
echo

# Set default fonts (especially allacritty)
# Replace qtile source with custom gaps and colors
# picom transparency
# mpv config
# .zshrc with aliases

echo
echo "That's it! Now we will run zsh4humans."
echo

if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

