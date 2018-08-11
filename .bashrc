# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Set path
export PATH=$PATH:~/.local/bin
#:~/.cargo/bin:~/.npm/bin

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls --color=auto"

# prompt
source /usr/share/git/git-prompt.sh
PS1="\[\e[0;32m\]\w\[\e[0m\]\$(__git_ps1) \$ "

# completion
_yay() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(yay -Pc)" -- $cur) )
}
complete -F _yay yay
complete -cf sudo

# vi mode
set -o vi

# Application vars
export TERMINAL="st"
export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less"

# Aliases
#alias update="sudo emerge --ask -uDU --keep-going --with-bdeps=y @world"
alias shelli="ssh -p 443 luutifa.tunk.org"
alias pacorphans="pacman -Qtdq"
alias yay="yay --sudoloop --editmenu --nodiffmenu"
