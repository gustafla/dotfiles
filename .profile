# Set paths
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# Application vars
export VISUAL=hx
export EDITOR=hx

# Remove QT Window decoration
#export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# Rust libraries debugging vars
#export RUST_BACKTRACE=full

# Set CMake to export compile_commands.json for clangd
export CMAKE_EXPORT_COMPILE_COMMANDS=1

# pass dir
export PASSWORD_STORE_DIR="$HOME/.pass"

# Use GnuPG SSH daemon
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

export XKB_DEFAULT_LAYOUT="us,fi"
export XKB_DEFAULT_VARIANT="euro"
export XKB_DEFAULT_OPTIONS="caps:escape,grp:lwin_toggle"
