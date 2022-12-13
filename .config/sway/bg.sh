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
hour=$(date +%-H)
if [[ $hour -gt 17 ]] || [[ $hour -lt 7 ]]; then
    mood=warm
fi

# Roll a random wallpaper
background=$(ls "$bgdir/$mood" | shuf -n 1)
bgpath="$bgdir/$mood/$background"

# Blur all pictures
#tmpfile=$(mktemp --tmpdir $tmpprefix-XXXXXXXXXXXX)
#magick "$bgpath" -resize 10% -blur x40 png:$tmpfile
#bgpath=$tmpfile

# Set it
swaymsg output '*' bg "$bgpath" fill
#swaymsg output '*' bg $bgpath tile
