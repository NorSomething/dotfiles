# ze dotfiles
Simple bashscripts to easily loadup my `hyprland`/`i3` setups.

# Features

- The `i3` and `hyprland` rices have the same custom `fastfetch` (slight difference for the colors), `zsh + zoxide` (from `.zshrc`) and `eza` setups.
- The script also installs the `yay` aur helper if you don't have it installed already.
- The `backup.sh` script runs at the start of each rice script.


## hyprland

<img width="1920" height="1080" alt="hypr" src="https://github.com/user-attachments/assets/1e4ef6f0-a850-4e2b-b75d-acf1b2c30f00" />

- `IN/ RAINBOWS`inspired rice 
- Custom waybar and wofi configs
- Almost opaue kitty setup
- Uses `awwww` for wallpaper setup

## i3

<img width="1920" height="1080" alt="i3" src="https://github.com/user-attachments/assets/83ceac21-4bd9-4137-8df8-022f936abc63" />

- General dark theme rice
- No compositor cuz I like my i3 snappy asf
- Different transparency for kitty in i3wm
- Uses `feh` for wallpaper setup

# Usage

## Clone the repo
```bash
git clone https://github.com/NorSomething/dotfiles
cd dotfiles
chmod +x *.sh
```
## Backup your current configs 
The backup script is ran automatically at the start of each rice scripts.

## Install your desired rice
```bash
./rice-hyprland.sh

or

./rice-i3.sh
```

## If you wish to revert back to your original configs
```bash
./restore.sh
```

## Notes
- Only items that already exist are backed up, nothing is created if it was not there to begin with.
- A restart after the install is recommended, although not compulsary.
- The screenshot wallpaper for the i3 rice is different from what actually gets installed. (This readme is a long time due so some stuff is different in the SS) :P

