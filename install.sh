#!/bin/sh

files=$(find $PWD -maxdepth 1 -type f -name '.*')

for f in $files; do
    ln -s $f $HOME/$(basename $f)
done
