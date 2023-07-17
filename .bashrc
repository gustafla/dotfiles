# Stop if uninteractive
case $- in
    *i*) ;;
    *) return ;;
esac

function cd {
    command cd $@
    ls --color=auto -lth
}

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
source /usr/share/git/git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\[\e[0;32m\]\w\[\e[0m\]" " \$ "'

# Set vi controls
set -o vi

# Set stricter umask (u=rwx,g=,o=)
umask 077

# Disable .bash_history and don't record duplicates
unset HISTFILE
export HISTCONTROL=ignoredups

# Load aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
