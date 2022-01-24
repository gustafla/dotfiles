# Stop if uninteractive
case $- in
    *i*) ;;
    *) return ;;
esac

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
source /usr/share/git/git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\[\e[0;32m\]\w\[\e[0m\]" " \$ "'

set -o vi

# Disable .bash_history and don't record duplicates
unset HISTFILE
export HISTCONTROL=ignoredups

# Load aliases
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

# Run zoxide
eval "$(zoxide init --no-aliases bash)"

z() {
    __zoxide_z "${1:-$HOME}" && exa -l
    echo "$PWD" > $XDG_RUNTIME_DIR/last_working_directory
}

at_exit() {
    echo "$PWD" > $XDG_RUNTIME_DIR/last_working_directory
}

trap at_exit EXIT

cd() {
    echo "Use z"
}
