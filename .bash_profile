# Set paths
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin

# Application vars
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less

# Refer bibliography db
export REFER=$HOME/.refer-database

# configure libraries to use wayland
export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export GDK_BACKEND=wayland

# sway cursor size
export XCURSOR_SIZE=12

if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec sway
fi
