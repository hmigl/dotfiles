# profile file; runs on login. Environmental variables are set here

# adds `~/.local/bin` and '~/.scripts' to $PATH
export PATH="$PATH:$HOME/.local/bin:$HOME/.scripts" 

# default programs
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="librewolf"
export OPENER="rifle"

# clean up ~/
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
# export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"

# disable files
export LESSHISTFILE=-

# start graphical server
if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x dwm || exec startx
fi
