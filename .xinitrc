#!/bin/sh

# Read Xresources
xrdb ~/.Xresources

# Launch dwm status updater script
~/.dotfiles/status.sh &

# Launch wm with consolekit (for pulseaudio device permissions)
exec dwm
