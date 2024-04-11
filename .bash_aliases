alias sudo='sudo '
alias ls='ls --color=auto'
alias ll='ls --color=auto -l'
alias diff='diff --color=auto -y'
alias time='"time" '
alias vi='echo "Use hx"'
alias ssh='TERM=xterm-256color ssh'
alias win32='WINEARCH=win32 WINEPREFIX=~/.wine32 '

function archvm-kbuild {
  make -j$(nproc) -C ~/archvm/mnt/kernelbuild/linux-6.6.25 M=$PWD "$@"
}
