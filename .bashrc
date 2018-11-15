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

# vi mode
set -o vi

# Aliases
#alias update="sudo emerge --ask -uDU --keep-going --with-bdeps=y @world"
alias shelli="ssh -p 443 luutifa.tunk.org"
alias pacorphans="pacman -Qtd"
alias tmc="java -cp ~/.local/share/tmc-cli fi.helsinki.cs.tmc.cli.Application"
alias webcam="mpv av://v4l2:/dev/video0"
