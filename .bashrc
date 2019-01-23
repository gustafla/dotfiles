# stop if uninteractive
case $- in
	*i*) ;;
	*) return ;;
esac

source /usr/share/git/git-prompt.sh
PS1="\[\e[0;32m\]\w\[\e[0m\]\$(__git_ps1) \$ "

set -o vi

cd() {
	command cd $1
	ls --color=auto
}

if [[ -f ~/.bash_aliases ]]; then
	. ~/.bash_aliases
fi
