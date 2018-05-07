#!/bin/sh

# set egpu output provider
if [ -e /dev/dri/by-path/pci-0000:04:00.0-card ]; then
    xrandr --setprovideroutputsource 1 0
fi

# Set backlight
xbacklight -set 12

# Monitor detection
~/.screenlayout/hotplug.sh

# Read Xresources
xrdb ~/.Xresources

# Start urxvtd
#urxvtd --opendisplay --fork

# Launch redshift
~/.dotfiles/redshift.sh

# Launch i3 with consolekit (for pulseaudio device permissions)
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session dwm
