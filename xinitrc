#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

[[ -f ~/.screenlayout/default.sh ]] && ~/.screenlayout/default.sh

xset s off -dpms
xset r rate 300 60
setxkbmap -option caps:escape

#case "$1" in
#        i3)
#                exec "i3"
#                ;;
#        pcmanfm)
#                exec "pcmanfm --desktop"
#                ;;
#esac
#compton -GG --backend glx --paint-on-overlay --glx-no-stencil --vsync opengl-swc &
exec i3
