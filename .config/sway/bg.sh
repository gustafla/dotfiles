#!/bin/bash
function w {
    echo $1 | cut -d'x' -f 1
}

function h {
    echo $1 | cut -d'x' -f 2
}

tmpprefix=$USER-bg
rm -f ${TMPDIR:-/tmp}/$tmpprefix*
bgpath="$HOME/pictures/wallpapers"
mood=cold
hour=$(date +%H)
if [[ $hour -gt 17 ]] || [[ $hour -lt 7 ]]; then
    mood=warm
fi
background=$(ls "$bgpath/$mood" | shuf -n 1)
bgres=$(identify "$bgpath/$mood/$background" | grep -oE '[0-9]{3,6}x[0-9]{3,6} ')
highestres=$(swaymsg -t get_outputs | jq -r '.[].current_mode | select(. != null) | "\(.width * .height) \(.width)x\(.height)"' | sort -n -r -k 1 | head -n 1 | cut -d' ' -f 2)
[[ $(w $bgres) -lt $(w $highestres) || $(h $bgres) -lt $(h $highestres) ]] && sigma=10
blurred=$(mktemp --tmpdir $tmpprefix-XXXXXXXXXXXX)
magick "$bgpath/$mood/$background" -resize $highestres^ -gravity center -extent $highestres -blur x${sigma:-3} $blurred
swaymsg output '*' bg $blurred fill
