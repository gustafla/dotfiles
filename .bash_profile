# Set paths
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig"

# Application vars
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less

# Refer bibliography db
export REFER="$HOME/.refer-database"

# fix netbeans
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dswing.aatext=TRUE -Dawt.useSystemAAFontSettings=on'

# configure libraries and applications to use wayland
export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export KITTY_ENABLE_WAYLAND=1
export MOZ_ENABLE_WAYLAND=1
export ECORE_EVAS_ENGINE=wayland_egl
export ELM_ENGINE=wayland_egl

# sway cursor size and style
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=16

if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi

if [ "$XDG_SESSION_TYPE" = "tty" ] && [ $XDG_VTNR -eq 1 ]; then
    export XDG_SESSION_TYPE=wayland
    exec dbus-run-session sway
else
    # swap caps lock and escape
    echo -e 'keycode 1 = Caps_Lock\nkeycode 58 = Escape' | loadkeys -
fi
