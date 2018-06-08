# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

complete -cf sudo

# Set path
export PATH=$PATH:~/.local/bin
#:~/.cargo/bin:~/.npm/bin

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

# prompt
PS1="\[\e[0;32m\]\w\[\e[0m\] \$ "

# vi mode
set -o vi

# Application vars
export TERMINAL="st"
export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less"

# Aliases
#alias update="sudo emerge --ask -uDU --keep-going --with-bdeps=y @world"
alias update="sudo apt -y update && sudo apt -y upgrade"
alias shelli="ssh -p 443 luutifa.tunk.org"
alias ls="ls --color=auto"
