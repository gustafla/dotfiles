# stop if uninteractive
case $- in
    *i*) ;;
    *) return ;;
esac

if [ -n "$BASH" ]; then
    alias ls="ls --color=auto"
fi

PS1='\[\e[0;32m\]\w\[\e[0m\] \$ '
set -o vi
alias tmc="java -cp ~/.local/share/tmc-cli fi.helsinki.cs.tmc.cli.Application"
