#!/bin/sh

read -r DP_STATUS</sys/class/drm/card0/card0-DP-1/status

if [ "connected" = "$DP_STATUS" ]; then
  /bin/sh $(dirname "$0")/dp.sh
else
  /bin/sh $(dirname "$0")/none.sh
fi

# reset desktop background related stuff
feh --bg-fill ~/.config/i3/bg
