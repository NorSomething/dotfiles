# Created by newuser for 5.9
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias instal="sudo pacman -S"
alias sysupdate="sudo pacman -Syu"
alias hyprconfig="nvim ~/.config/hypr/hyprland.conf"
alias i3config="nvim ~/.config/i3/config"

#starship
eval "$(starship init zsh)"

#zoxide
eval "$(zoxide init zsh)"
