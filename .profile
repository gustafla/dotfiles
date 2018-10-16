# Set path
export PATH=$PATH:~/.local/bin:~/.cargo/bin

# Configure pinentry to use the correct TTY
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null

# Application vars
export TERMINAL="alacritty"
export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less"
