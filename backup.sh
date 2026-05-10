#!/bin/bash

BACKUP_DIR="$HOME/.rice-backup"

echo "Backing up existing configs to $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"

#for the i3 rice - if folder exists then do this
[ -d ~/.config/i3 ]        && cp -r ~/.config/i3         "$BACKUP_DIR/"
[ -d ~/.config/polybar ]   && cp -r ~/.config/polybar     "$BACKUP_DIR/"
[ -d ~/.config/rofi ]      && cp -r ~/.config/rofi        "$BACKUP_DIR/"
[ -d ~/.config/fastfetch ] && cp -r ~/.config/fastfetch   "$BACKUP_DIR/"

#for the hyprland rice
[ -d ~/.config/hypr ]      && cp -r ~/.config/hypr        "$BACKUP_DIR/"
[ -d ~/.config/waybar ]    && cp -r ~/.config/waybar       "$BACKUP_DIR/"
[ -d ~/.config/wofi ]      && cp -r ~/.config/wofi         "$BACKUP_DIR/"

#for both
[ -d ~/.config/kitty ]              && cp -r ~/.config/kitty              "$BACKUP_DIR/"
[ -f ~/.zshrc ]                     && cp    ~/.zshrc                      "$BACKUP_DIR/"
[ -f ~/.config/starship.toml ]      && cp    ~/.config/starship.toml       "$BACKUP_DIR/"
[ -f ~/.config/starship-i3.toml ]   && cp    ~/.config/starship-i3.toml    "$BACKUP_DIR/"

echo "Backup done!"
