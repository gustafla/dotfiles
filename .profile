# Set paths
export PATH="$HOME/.local/bin:$PATH"

# Application vars
export VISUAL=hx
export EDITOR=hx

# Fix netbeans font antialiasing
export _JAVA_OPTIONS='-Dswing.aatext=TRUE -Dawt.useSystemAAFontSettings=on'

# Remove QT Window decoration
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# Sway cursor size and style
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=16

# Rust libraries debugging vars
export RUST_BACKTRACE=full

# Set CMake to export compile_commands.json for clangd
export CMAKE_EXPORT_COMPILE_COMMANDS=1

# pass dir
export PASSWORD_STORE_DIR="$HOME/.pass"

# This is here to get PanVk to run. I know what I'm doing.
export PAN_I_WANT_A_BROKEN_VULKAN_DRIVER=1

# Use GnuPG SSH daemon
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
