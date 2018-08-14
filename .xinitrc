#!/bin/sh
QT_QPA_PLATFORMTHEME=gtk2
XDG_CONFIG_HOME="$HOME/.config"
# fix java awt apps in bspwm
_JAVA_AWT_WM_NONREPARENTING=1

export QT_QPA_PLATFORMTHEME
export XDG_CONFIG_HOME

export _JAVA_AWT_WM_NONREPARENTING

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
systemctl --user restart conky@left.service
systemctl --user restart conky@right.service

exec bspwm
