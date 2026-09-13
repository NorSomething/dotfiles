# Created by newuser for 5.9

#shared command histroy
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=100000
SAVEHIST=100000
mkdir -p -- "${HISTFILE:h}"
setopt APPEND_HISTORY INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS HIST_SAVE_NO_DUPS

#some shortcuts i personally like
bindkey -e
bindkey '^[[3~' delete-char                 # Delete
bindkey '^[[3;5~' kill-word                 # Ctrl+Delete (CSI)
bindkey '^[[5;3~' kill-word                 # Ctrl+Delete (alternate)
bindkey '^[[1;5D' backward-word             # Ctrl+Left (CSI)
bindkey '^[[1;5C' forward-word              # Ctrl+Right (CSI)
bindkey '^[[5D' backward-word               # Ctrl+Left (legacy)
bindkey '^[[5C' forward-word                # Ctrl+Right (legacy)

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias instal="sudo pacman -S"
alias sysupdate="sudo pacman -Syu"
alias hyprconfig="nvim ~/.config/hypr/hyprland.conf"
alias i3config="nvim ~/.config/i3/config"
alias setrfr60="xrandr --output DP-2 --mode 1920x1080 --rate 144"
alias ..="cd .."

#copy command
if [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" ]]; then
	alias copy='wl-copy <'
elif [[ "$XDG_CURRENT_DESKTOP" == "i3" ]]; then
	alias copy='xclip -selection clipboard <'
fi 

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

#now for kitty conf - we do some simlink wizardy
if [[ "$XDG_CURRENT_DESKTOP" == "i3" ]]; then
  ln -sf ~/.config/kitty/kitty-theme-i3.conf ~/.config/kitty/kitty.conf
elif [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" ]]; then
  ln -sf ~/.config/kitty/kitty-theme-hyprland.conf ~/.config/kitty/kitty.conf
fi

. "$HOME/.local/bin/env"
