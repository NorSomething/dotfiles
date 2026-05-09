# Created by newuser for 5.9
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias instal="sudo pacman -S"
alias sysupdate="sudo pacman -Syu"
alias hyprconfig="nvim ~/.config/hypr/hyprland.conf"
alias i3config="nvim ~/.config/i3/config"

#starship
eval "$(starship init zsh)"


alias ls="eza --icons --group-directories-first -F=always"
alias la="eza --icons --group-directories-first -a -F=always"
alias ll="eza --icons --group-directories-first -a -F=always --long"
alias lsd="ls -D"

#zoxide
eval "$(zoxide init zsh)"

#choosing the correct toml file for the correct wm
if [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" ]]; then
  export STARSHIP_CONFIG=~/.config/starship-hyprland.toml
elif [[ "$XDG_CURRENT_DESKTOP" == "i3" ]]; then
  export STARSHIP_CONFIG=~/.config/starship-i3.toml
else
  export STARSHIP_CONFIG=~/.config/starship-i3.toml  # fallback
fi

#now for fastfetch config
if [[ "$XDG_CURRENT_DESKTOP" == "i3" ]]; then
  alias fastfetch="fastfetch --config ~/.config/fastfetch/fastfetch-i3.jsonc"
fi

#now for kitty conf - we do some symlink wizardy
if [[ "$XDG_CURRENT_DESKTOP" == "i3" ]]; then
  ln -sf ~/.config/kitty/kitty-theme-i3.conf ~/.config/kitty/kitty.conf
elif [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" ]]; then
  ln -sf ~/.config/kitty/kitty-theme-hyprland.conf ~/.config/kitty/kitty.conf
fi
