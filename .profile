# Set path
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin

# Application vars
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less

# Qt5 style
export QT_QPA_PLATFORMTHEME=gtk3

# Refer bibliography db
export REFER=$HOME/.refer-database

# wlc/wlroots keyboard configuration
export XKB_DEFAULT_LAYOUT='us,fi'
export XKB_DEFAULT_OPTIONS='caps:escape,grp:shifts_toggle'

# configure libraries to use wayland
#export QT_QPA_PLATFORM=wayland-egl
#export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
#export CLUTTER_BACKEND=wayland
#export SDL_VIDEODRIVER=wayland

# hack ash to read my configs
export ENV=$HOME/.bashrc

if [[ "`tty`" = "/dev/tty1" ]]; then
    exec startx
fi
