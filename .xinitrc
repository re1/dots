#!/bin/sh
# change default editor
VISUAL=nvim
EDITOR=nvim
# configure qt using gtk
QT_QPA_PLATFORMTHEME=gtk2
export QT_QPA_PLATFORMTHEME
# set config directory
XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME
# fix java awt apps in bspwm
_JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_AWT_WM_NONREPARENTING
# run java proxies over tor
JAVA_OPTIONS="$JAVA_OPTIONS -DsocksProxyHost=localhost -DsocksProxyPort=9050"
export JAVA_OPTIONS

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
systemctl --user restart polybar@primary.service
systemctl --user restart polybar@secondary.service
systemctl --user restart conky@left.service
systemctl --user restart conky@right.service

exec bspwm

