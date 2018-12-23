# stop if uninteractive
case $- in
	*i*) ;;
	*) return ;;
esac

PS1='\[\e[0;32m\]\w\[\e[0m\] \$ '

set -o vi

alias ls="ls --color=auto"
alias tmc="java -cp ~/.local/share/tmc-cli fi.helsinki.cs.tmc.cli.Application"
alias shelli="ssh -p 443 gustafla.space"
