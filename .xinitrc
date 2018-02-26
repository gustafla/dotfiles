#!/bin/sh

# Set backlight
xbacklight -set 12

# Read Xresources
xrdb ~/.Xresources

# Start urxvtd
urxvtd --opendisplay --fork

# Start redshift
~/.dotfiles/redshift.sh

# Launch i3 with consolekit (for pulseaudio device permissions)
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
