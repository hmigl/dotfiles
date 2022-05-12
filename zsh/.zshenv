# Environment file; sourced on all invocations

# Add `~/.local/bin` to $PATH
export PATH="$PATH:$HOME/.local/bin"

# Default programs
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="librewolf"
export OPENER="xdg-open"

# Clean up ~/
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
# export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export AWT_TOOLKIT="MToolkit wmname LG3D"
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix for Java applications in dwm

# Disable files
export LESSHISTFILE=-
