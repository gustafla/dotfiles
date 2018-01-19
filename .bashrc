# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.
PS1="\[\e[0;32m\]\w\[\e[0m\] \$ "
set -o vi

# Set path
export PATH=$PATH:~/.local/bin:~/tmcbeans/bin

# Aliases
alias vim="nvim"

# Read by my .xserverrc
export XSERVER_ARGS="-ardelay 300 -arinterval 17"

# Application vars
export TERMINAL="urxvtc"
export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less"

# Neofetch rice hell yeah
neofetch
