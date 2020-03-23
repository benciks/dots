#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xidle -program "/usr/bin/betterlockscreen -l dim" -timeout 600 &
xidle -program "/bin/sudo /usr/bin/zzz" -timeout 1200 &
numlockx &
xsetroot -cursor_name left_ptr &
setxkbmap -model pc104 -layout us,sk -variant ,qwerty -option grp:alt_shift_toggle &
exec bspwm
