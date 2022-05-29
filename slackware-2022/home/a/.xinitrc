#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi


# Allow other users to access X11
xhost +localhost
#xhost +SI:localuser:m
xhost +SI:localuser:p


# Music player daemon
#mpd


/home/a/work/app/remonitor/run.sh &


# Start notion
if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
 exec ck-launch-session notion
else
 exec notion
fi
