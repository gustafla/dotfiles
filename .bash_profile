# Set paths
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.local/lib64"

# Application vars
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less

# Refer bibliography db
export REFER="$HOME/.refer-database"

# fix netbeans
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dswing.aatext=TRUE -Dawt.useSystemAAFontSettings=on'

# configure libraries to use wayland
export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export GDK_BACKEND=wayland

# sway cursor size and style
export XCURSOR_THEME=Neutral
export XCURSOR_SIZE=16

if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec sway
fi
