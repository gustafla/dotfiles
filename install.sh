#!/bin/bash

directories=". .vice .local/share/applications .config .config/gtk-3.0 .config/nvim .config/mpv"

# make the script work from any working directory
cd $(dirname $0)

# create necessary directories
for d in $directories; do
    mkdir -p $HOME/$d
done

# find relevant config files
files=$(find $directories -maxdepth 1 -type f -not -name "*.sh")

# symlink config files to home
for f in $files; do
    f_fixed=${f/"./"/}
    ln -s $PWD/$f_fixed ~/$f_fixed
done

# install vim-plug
mkdir -p ~/.local/share/nvim/site/autoload
aria2c -d ~/.local/share/nvim/site/autoload https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
