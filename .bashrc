# Stop if uninteractive
case $- in
    *i*) ;;
    *) return ;;
esac

source /usr/share/git/git-prompt.sh
PS1="\[\e[0;32m\]\w\[\e[0m\]\$(__git_ps1) \$ "

set -o vi

cd() {
    command cd "${1:-$HOME}" && exa -l
}

# Disable .bash_history and don't record duplicates
unset HISTFILE
export HISTCONTROL=ignoredups

# Load aliases
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi
