
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon # Disable ctrl-s and ctrl-q

# Path
export PATH="$PATH:$HOME/.local/bin:$HOME/.scripts" 

# Shopt
shopt -s autocd # cd into a dir merely by typing its name
shopt -s histappend # Do not overwrite history

# Vi mode, useful to edit commands in an easier way
set -o vi 

HISTSIZE= HISTFILESIZE= # Infinite history
export LESSHISTFILE="-" # No history on less
HISTFILE=$HOME/.bash_history

# Bash prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Aliases
alias la='ls -al --color=auto --group-directories-first' 
alias ll='ls -l --color=auto --group-directories-first'
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias v='nvim'
