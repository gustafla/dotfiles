#!/bin/bash

[ $# -ne 4 ] && [ $# -ne 5 ] && \
    echo "Usage: $0 bitrate src_dir dst_dir (extra_ffmpeg_flags)" && \
    exit 1

bitrate="$1"
src_dir="$2"
dst_dir="$(pwd)/$3"
fflags="$4"

cd "$src_dir"
find . -type d -exec mkdir -p "$dst_dir/{}" \;
rsync -vrt \
	--exclude='*.flac' \
	--exclude='*.wav' \
	--exclude='*.cue' \
	--exclude='*.png' \
	--exclude='*.jpg' \
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
	. "$dst_dir"
echo Starting encoding
find . -type f -regex '.*\.\(flac\|wav\)' | \
    parallel \
    ffmpeg $fflags -i {} -codec:a libopus \
    -b:a $bitrate -sample_fmt s16 "$dst_dir/{.}.opus"
