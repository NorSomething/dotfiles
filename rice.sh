#!/bin/bash

set -e

echo "Updating System..."
sudo pacman -Syu --noconfirm

echo "Installing packages..."
sudo pacman -S --noconfirm \
    hyprland waybar wofi kitty thunar \
    starship zsh git base-devel hyprshot zoxide \
    awww zsh-autosuggestions zsh-syntax-highlighting brightnessctl playerctl \
    polkit-gnome

echo "Installing yay (AUR helper)..."
if ! command -v yay >/dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
fi

echo "Copying configs..."
mkdir -p ~/.config
mkdir -p ~/.config ~/Pictures

rm ~/.config/hypr/hyprland.conf

cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r wofi ~/.config/
cp -r kitty ~/.config/

cp zshrc ~/.zshrc
cp starship.toml ~/.config/starship.toml

cp -r wallpapers ~/Pictures/

echo "Setting up Zsh"
chsh -s $(which zsh)

echo "Done! Please restart your system."
