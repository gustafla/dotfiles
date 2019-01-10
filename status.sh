#!/bin/sh

while [ 1 ]; do
	STR=""

	nbat=`find /sys/class/power_supply -maxdepth 1 -name "BAT*" | wc -l`
	if [ $nbat -gt 0 ]; then
		let bat=0
		for d in /sys/class/power_supply/BAT*; do
			let bat=$bat+`cat $d/capacity`
		done
		let bat=$bat/$nbat

		STR="$STR | $bat%"
	fi

	STR="$STR | `date +%A\ %F\ %T`"
	xsetroot -name "$STR"
	sleep 10
done
