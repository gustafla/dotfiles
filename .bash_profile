# Set paths
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin
export COWPATH=$HOME/.local/share/cows

# Application vars
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less

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

if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
