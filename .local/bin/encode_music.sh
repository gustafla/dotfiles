#!/bin/bash

[ $# -ne 2 ] && \
    echo "Usage: $0 src_dir dst_dir" && \
    exit 1

bitrate="128K"
src_dir="$1"
dst_dir="$(pwd)/$2"

# Work in source dir, clone dir structure into dst
cd "$src_dir"
find . -type d -exec mkdir -p "$dst_dir/{}" \;

echo Starting encoding

# Strip pictures from lossy files
find . -type f -regex '.*\.\(aac\|m4a\|mp3\|ogg\|opus\)' | \
parallel ffmpeg -n -i {} -vn -codec:a copy "$dst_dir/{}"

# Encode lossless files to opus
find . -type f -regex '.*\.\(flac\|wav\)' | \
parallel \
ffmpeg -n -i {} \
-vn \
-codec:a libopus \
-b:a $bitrate \
-filter:a aresample=48000:\
resampler=soxr:\
precision=28:\
dither_method=triangular \
-ar 48000 \
"$dst_dir/{.}.opus"

# Send notification
notify-send "$(basename $0) finished" "$(du -sh "$dst_dir")"
