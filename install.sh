#!/bin/bash

directories=". .config .config/nvim .config/alacritty .config/i3 .config/i3status .config/trizen .config/mpv"

# make the script work from any working directory
cd $(dirname $0)

# create necessary directories
for d in $directories; do
    mkdir -p ~/$d
done

# find relevant config files
files=$(find $directories -maxdepth 1 -type f -not -name "*.sh")

# symlink config files to home
for f in $files; do
    f_fixed=${f/"./"/}
    ln -s $PWD/$f_fixed ~/$f_fixed
done

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
