# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/luutifa/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt CORRECT

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

bindkey "^j" beginning-of-line
bindkey "^[[H" beginning-of-line
bindkey "^k" end-of-line
bindkey "^[[F" end-of-line
bindkey "^D" delete-char-or-list
bindkey "^H" backward-delete-char
bindkey "^[3;5~" delete-char
bindkey "^[[3~" delete-char
bindkey "^?" backward-delete-char
bindkey "^l" clear-screen

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh