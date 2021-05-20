#!/bin/bash
tmpprefix=$USER-bg
rm -f ${TMPDIR:-/tmp}/$tmpprefix*
bgpath="$HOME/pictures/wallpapers"
mood=cold
hour=$(date +%H)
if [[ $hour -gt 17 ]] || [[ $hour -lt 7 ]]; then
    mood=warm
fi
background=$(ls "$bgpath/$mood" | shuf -n 1)
highestres=$(swaymsg -t get_outputs | jq -r '.[].current_mode | select(. != null) | "\(.width * .height) \(.width)x\(.height)"' | sort -n -r -k 1 | head -n 1 | cut -d' ' -f 2)
blurred=$(mktemp --tmpdir $tmpprefix-XXXXXXXXXXXX)
magick "$bgpath/$mood/$background" -resize $highestres^ -gravity center -extent $highestres -gaussian-blur x3 $blurred
swaymsg output '*' bg $blurred fill
