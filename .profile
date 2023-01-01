# Set paths
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig"

# Application vars
export VISUAL=helix
export EDITOR=helix

# Fix netbeans font antialiasing
export _JAVA_OPTIONS='-Dswing.aatext=TRUE -Dawt.useSystemAAFontSettings=on'

# Remove QT Window decoration
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# Sway cursor size and style
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=16

# Rust libraries debugging vars
export RUST_BACKTRACE=full

# Git ceiling directories
export GIT_CEILING_DIRECTORIES="$HOME/code"

# R libraries path
export R_LIBS_USER="$HOME/.local/share/R_libs"

# pass dir
export PASSWORD_STORE_DIR="$HOME/.pass"

# Use GnuPG SSH daemon
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
