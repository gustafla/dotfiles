#!/bin/sh

while [ 1 ]; do
    STR=""
    STR="$STR | `cat /sys/class/power_supply/BAT0/capacity`%"
    STR="$STR | `date`"
    xsetroot -name "$STR"
    sleep 10
done
