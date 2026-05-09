#!/bin/bash

set -e

echo "Updating System..."
sudo pacman -Syu --noconfirm

echo "Installing packages..."
sudo pacman -S --noconfirm \
    i3-wm polybar wofi kitty thunar \
    starship zsh git base-devel zoxide \
    zsh-autosuggestions zsh-syntax-highlighting brightnessctl playerctl \
    polkit-gnome feh picom xorg-xinit xorg-server fastfetch eza rofi

echo "Installing yay (AUR helper)..."
if ! command -v yay >/dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
fi

echo "Copying configs..."
mkdir -p ~/.config/i3
mkdir -p ~/.config/polybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/kitty
mkdir -p ~/wallpapers
mkdir -p ~/.config/fastfetch

cp -r i3/. ~/.config/i3/
cp -r polybar/. ~/.config/polybar/
cp -r rofi/. ~/.config/rofi/
cp -r kitty/. ~/.config/kitty/
cp -r fastfetch/fastfetch-i3.jsonc ~/.config/fastfetch

cp .zshrc ~/.zshrc
cp -r starship/starship-i3.toml ~/.config/starship-i3.toml
cp -r wallpapers/* ~/wallpapers/

echo "Setting wallpaper with feh..."
feh --bg-scale ~/wallpapers/i3wallblack

echo "Setting up Zsh..."
chsh -s "$(which zsh)"

echo "Done! Please restart your system."
