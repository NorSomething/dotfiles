#!/bin/bash

BACKUP_DIR="$HOME/.rice-backup"

if [ ! -d "$BACKUP_DIR" ]; then
    echo "No backup found at $BACKUP_DIR"
    exit 1
fi

echo "Restoring configs from $BACKUP_DIR..."

for item in "$BACKUP_DIR"/.*  "$BACKUP_DIR"/*; do
    name=$(basename "$item") 
    [ "$name" = "." ] || [ "$name" = ".." ] || [ ! -e "$item" ] && continue

    if [ "$name" = ".zshrc" ]; then
        cp "$item" ~/
    else
        cp -r "$item" ~/.config/
    
    fi
    echo "  restored $name"
done

echo "Done! Restart your session to apply changes."
