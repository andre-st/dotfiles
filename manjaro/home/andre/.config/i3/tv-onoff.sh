#!/bin/bash

readonly MONNAME_PRIMARY=DP-1
readonly MONNAME_TV=HDMI-2

if xrandr --listactivemonitors | grep $MONNAME_TV > /dev/null
then
	xrandr --output $MONNAME_TV --off
else
	xrandr --output $MONNAME_TV  \
		--mode 1920x1080        \
		--rate 75               \
		--right-of $MONNAME_PRIMARY
fi




