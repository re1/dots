#!/bin/sh
xrdb $HOME/.Xresources

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

systemctl --user restart sxhkd
systemctl --user restart compton
systemctl --user restart redshift
systemctl --user restart dunst
systemctl --user restart xfce4-panel
systemctl --user restart xfce4-power-manager
systemctl --user restart nm-applet

exec bspwm
