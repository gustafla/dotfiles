# stop if uninteractive
case $- in
	*i*) ;;
	*) return ;;
esac

PS1='\[\e[0;32m\]\w\[\e[0m\] \$ '

set -o vi


if [[ -f ~/.bash_aliases ]]; then
	. ~/.bash_aliases
fi
