#!/bin/sh

# set egpu output provider
if [ -e /dev/dri/by-path/pci-0000:04:00.0-card ]; then
    xrandr --setprovideroutputsource 1 0
fi

# Monitor detection
#~/.screenlayout/hotplug.sh

# Read Xresources
xrdb ~/.Xresources

# Launch dwm status updater script
~/.dotfiles/status.sh &

# Launch wm with consolekit (for pulseaudio device permissions)
exec dwm
