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

# Set cursor
xsetroot -cursor_name left_ptr

# Set key repeat delay and rate
xset r rate 350 50

# Set background
feh --bg-center --no-fehbg $HOME/wallpapers/wallpaper.png

# Start redshift (Flux-like)
redshift &

# Start sleep timer
xidlehook --not-when-fullscreen \
  --timer primary 3600 "$HOME/.yadm/bin/suspend-if-no-audio" "" &

# Start wm
exec $HOME/.config/bspwm/wm
