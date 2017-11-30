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

alias ls="ls --color"
alias ll="ls --color -l"
alias android-studio="LD_PRELOAD='/usr/lib/libstdc++.so.6 /usr/lib/libgcc_s.so.1 /usr/lib/libxcb.so.1 /usr/lib/libgpg-error.so' ~/android-studio/bin/studio.sh"
alias rsync="rsync --info=progress2"
alias osrs="/opt/runescape/runescape --prmfile=oldschool.prm"

#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
