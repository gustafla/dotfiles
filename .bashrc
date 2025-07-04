# Stop if uninteractive
case $- in
    *i*) ;;
    *) return ;;
esac

function cd {
    command cd "$@" && ls --color=always -t
}

function tere {
    local result=$(command tere "$@")
    [ -n "$result" ] && cd -- "$result"
}

# Configure prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
source /usr/share/git/git-prompt.sh
PROMPT_DIRTRIM=2
PROMPT_COMMAND='__git_ps1 "\[\e[0;32m\]\w\[\e[0m\]" " \$ "'

# Set vi controls
set -o vi

# Set stricter umask (u=rwx,g=,o=)
umask 077

# Don't record duplicates in history
HISTCONTROL=ignoredups

# Load aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
