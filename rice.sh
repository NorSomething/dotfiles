#!/bin/bash

set -e

echo "Updating System..."
sudo pacman -Syu --noconfirm

echo "Installing packages..."
sudo pacman -S --noconfirm \
    hyprland waybar wofi kitty thunar \
    starship zsh git base-devel hyprshot

echo "Installing yay (AUR helper)..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..

echo "Copying configs..."
mkdir -p ~/.config

cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r wofi ~/.config/
cp -r kitty ~/.config/

cp zshrc ~/.zshrc
cp starship.toml ~/.starstip.toml
cp -r wallpapers ~/.wallpapers

echo "Setting up Zsh"
chsh -s $(which zsh)

echo "Setting up Starship"

cp -r zsh/zshrc ~/.config/
cp -r zsh/starship.toml ~/.config/

echo "Done! Please restart your system."
