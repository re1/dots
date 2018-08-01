BROWSER=firefox-developer-edition
QT_QPA_PLATFORMTHEME=gtk2
VISUAL=vim
XDG_CONFIG_HOME="$HOME/.config"

export BROWSER
export QT_QPA_PLATFORMTHEME
export VISUAL
export XDG_CONFIG_HOME

export _JAVA_AWT_WM_NONREPARENTING=1

alias dmenu="rofi -dmenu -lines 0"
alias firefox="firefox-developer-edition"
alias mpdir="mkdir -p"
alias xo="xdg-open"

mcdir() { test -e "$1" || mkdir -p "$1" && cd "$1" }

