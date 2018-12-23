#!/bin/sh

file=/tmp/redshift.${USER}.pid
if [ -e $file ]; then
	kill `cat $file`
	rm $file
else
	redshift &
	echo $! > $file
fi
