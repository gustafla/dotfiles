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
	ls -R --color=auto src/ 2>/dev/null
}

synkki() {
	local rsync_command="rsync -vrte 'ssh -p 443'"
	eval "$rsync_command $1 $2"
	eval "$rsync_command $2 $1"
}

# disable .bash_history and don't record duplicates
unset HISTFILE
export HISTCONTROL=ignoredups

if [[ -f ~/.bash_aliases ]]; then
	. ~/.bash_aliases
fi
