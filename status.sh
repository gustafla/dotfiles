#!/bin/sh

while [ 1 ]; do
    nbat=`find /sys/class/power_supply -maxdepth 1 -name "BAT*" | wc -l`
    let bat=0
    for d in /sys/class/power_supply/BAT*; do
        let bat=$bat+`cat $d/capacity`
    done
    let bat=$bat/$nbat

    STR=""
    STR="$STR | $bat%"
    STR="$STR | `date`"
    xsetroot -name "$STR"
    sleep 10
done
