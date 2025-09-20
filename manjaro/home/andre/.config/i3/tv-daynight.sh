#!/bin/bash

readonly MONNAME_PRIMARY=DP-1
readonly MONNAME_TV=HDMI-2
readonly BRIGHT_DAY=1.0
readonly BRIGHT_NIGHT=0.4


if xrandr --verbose | grep "Brightness: $BRIGHT_NIGHT" > /dev/null
then
	xrandr --output $MONNAME_TV --brightness $BRIGHT_DAY --gamma 1.0:1.0:1.0
else
	xrandr --output $MONNAME_TV --brightness $BRIGHT_NIGHT --gamma 1.0:0.8:0.5
fi



