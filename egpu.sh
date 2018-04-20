#!/bin/sh

if [ -e /dev/dri/by-path/pci-0000:04:00.0-card ]; then
    ln -sf ~/.dotfiles/10-gpu.conf /etc/X11/xorg.conf.d/10-gpu.conf
    export EGPU=1
else
    ln -sf /dev/null /etc/X11/xorg.conf.d/10-gpu.conf
fi

exec startx
