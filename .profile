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

# wlc/wlroots keyboard configuration
export XKB_DEFAULT_LAYOUT="us,fi"
export XKB_DEFAULT_OPTIONS="caps:escape,grp:shifts_toggle"

# configure libraries to use wayland
#export QT_QPA_PLATFORM=wayland-egl
#export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
#export CLUTTER_BACKEND=wayland
#export SDL_VIDEODRIVER=wayland
