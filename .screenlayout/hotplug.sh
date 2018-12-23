#!/bin/sh

# card0 is egpu if plugged
read -r DP_STATUS</sys/class/drm/card0/card0-DP-1/status

if [ -e /dev/dri/by-path/pci-0000:04:00.0-card ]; then
	/bin/sh $(dirname "$0")/egpu-hdmi.sh
else
	if [ "connected" = "$DP_STATUS" ]; then
		/bin/sh $(dirname "$0")/dp.sh
	else
		/bin/sh $(dirname "$0")/none.sh
	fi
fi

# reset desktop background related stuff
feh --bg-fill ~/.config/i3/bg
