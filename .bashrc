# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls --color=auto"

# prompt
source /usr/share/git/git-prompt.sh
PS1="\[\e[0;32m\]\w\[\e[0m\]\$(__git_ps1) \$ "

# completion
complete -cf sudo
source /home/luutifa/.tmc-autocomplete.sh || true

# vi mode
set -o vi

# Aliases
#alias update="sudo emerge --ask -uDU --keep-going --with-bdeps=y @world"
alias vim="nvim"
alias shelli="ssh -p 443 luutifa.tunk.org"
alias pacorphans="pacman -Qtd"
