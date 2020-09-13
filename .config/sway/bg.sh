#!/bin/bash
BGPATH="$HOME/pictures/wallpapers"
mood=cold
hour=$(date +%H)
if [[ $hour -gt 17 ]] || [[ $hour -lt 7 ]]; then
    mood=warm
fi
background=$(ls "$BGPATH/$mood" | shuf -n 1)
swaymsg output '*' bg "$BGPATH/$mood/$background" fill
