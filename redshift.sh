#!/bin/sh

file=/tmp/redshift.${UID}.pid
if [ -e $file ]; then
  kill `cat $file`
  rm $file
else
  redshift &
  echo $! > $file
fi
