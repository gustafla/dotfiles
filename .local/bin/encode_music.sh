#!/bin/bash

[ $# -ne 2 ] && \
    echo "Usage: $0 src_dir dst_dir" && \
    exit 1

bitrate="128K"
src_dir="$1"
dst_dir="$(pwd)/$2"

cd "$src_dir"
find . -type d -exec mkdir -p "$dst_dir/{}" \;
rsync -vrt \
	--exclude='*.flac' \
	--exclude='*.wav' \
	--exclude='*.cue' \
	--exclude='*.png' \
	--exclude='*.jpg' \
	--exclude='*.JPG' \
	--exclude='*.jpeg' \
	--exclude='*.tiff' \
	--exclude='*.tif' \
	--exclude='*.txt' \
	--exclude='*.log' \
	--exclude='*.accurip' \
	--exclude='*.ffp' \
	--exclude='*.m3u' \
	--exclude='*.m3u8' \
	--exclude='*.url' \
	--exclude='*.nfo' \
	--exclude='*.md5' \
	--exclude='*.pdf' \
	--exclude='*.mp4' \
	--exclude='*.mkv' \
	--exclude='*.avi' \
	--exclude='*.7z' \
	--exclude='*.tar*' \
	--exclude='*.tgz' \
	--exclude='*.zip' \
	--exclude='*.rar' \
	--exclude='*.it' \
	--exclude='*.mod' \
	--exclude='*.xm' \
	--exclude='*.s3m' \
	. "$dst_dir"
echo Starting encoding
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

notify-send "$(basename $0) finished" "$(du -sh "$dst_dir")"
