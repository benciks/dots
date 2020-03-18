#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xidlehook --not-when-fullscreen --not-when-audio --timer 600 'betterlockscreen -l dim' '' --timer 1200 'systemctl suspend' '' &
numlockx &
xsetroot -cursor_name left_ptr &
setxkbmap -model pc104 -layout us,sk -variant ,qwerty -option grp:alt_shift_toggle &
exec bspwm
