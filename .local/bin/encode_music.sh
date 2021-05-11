#!/bin/bash

[ $# -ne 2 ] && \
    echo "Usage: $0 src_dir dst_dir" && \
    exit 1

bitrate="128K"
src_dir="$1"
dst_dir="$PWD/$2"

# Work in source dir
cd "$src_dir"

# Copy lossy files and directory structure
rsync -r --include '*/' \
--include '*.aac' \
--include '*.m4a' \
--include '*.mp3' \
--include '*.ogg' \
--include '*.opus' \
--exclude '*' . "$dst_dir"

echo Starting encoding

# Encode lossless files to opus
find . -type f -regex '.*\.\(flac\|wav\)' | \
parallel \
ffmpeg -n -i {} \
-codec:a libopus \
-b:a $bitrate \
-filter:a aresample=48000:\
resampler=soxr:\
precision=28:\
dither_method=triangular \
-ar 48000 \
"$dst_dir/{.}.opus"

# Remove empty directories
find "$dst_dir" -type d -empty -delete

# Send notification
notify-send "$(basename $0) finished" "$(du -sh "$dst_dir")"
