#!/bin/sh

# Read Xresources
xrdb ~/.Xresources

# Launch wm with consolekit (for pulseaudio device permissions)
exec i3
