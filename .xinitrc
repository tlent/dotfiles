#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set key repeat delay and rate
xset r rate 350 50

# Set resolution and refresh rate
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144

# Start compton
compton -b

# Set background color
hsetroot -solid "#7F4145"

# Start redshift (Flux-like)
redshift &

# Start sleep timer
xautolock -time 15 -locker "~/bin/lock && systemctl suspend" &

# Start i3
exec i3
