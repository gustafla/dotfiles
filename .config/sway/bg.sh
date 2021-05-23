#!/bin/bash
function w {
    echo $1 | cut -d'x' -f 1
}

function h {
    echo $1 | cut -d'x' -f 2
}

# Set up and clean up tmp file(s) for blurred low res bgs
tmpprefix=$USER-bg
rm -f ${TMPDIR:-/tmp}/$tmpprefix*

# The wallpaper directory path
bgdir="$HOME/pictures/wallpapers"

# Determine which set of bgs will be used
mood=cold
hour=$(date +%H)
if [[ $hour -gt 17 ]] || [[ $hour -lt 7 ]]; then
    mood=warm
fi

# Roll a random wallpaper
background=$(ls "$bgdir/$mood" | shuf -n 1)
bgpath="$bgdir/$mood/$background"

# Determine picture and screen resolution (eg. 1920x1080)
bgres=$(identify "$bgpath" | grep -oE '[0-9]{3,6}x[0-9]{3,6} ')
highestres=$(swaymsg -t get_outputs | jq -r '.[].current_mode | select(. != null) | "\(.width * .height) \(.width)x\(.height)"' | sort -n -r -k 1 | head -n 1 | cut -d' ' -f 2)

# Blur pictures with less resolution than current screen
if [[ $(w $bgres) -lt $(w $highestres) || $(h $bgres) -lt $(h $highestres) ]]; then
    tmpfile=$(mktemp --tmpdir $tmpprefix-XXXXXXXXXXXX)
    magick "$bgpath" -resize $highestres^ -gravity center -extent $highestres -blur x10 $tmpfile
    bgpath=$tmpfile
fi

# Set it
swaymsg output '*' bg $bgpath fill
