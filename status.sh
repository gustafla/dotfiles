#!/bin/sh

while [ 1 ]; do
    STR=""
    BAT="`cat /sys/class/power_supply/BAT0/power_now`"
    STR="$STR | `echo "scale=1;$BAT/1000000"|bc`W"
    STR="$STR | `cat /sys/class/power_supply/BAT0/capacity`%"
    STR="$STR | `date`"
    xsetroot -name "$STR"
    sleep 10
done
