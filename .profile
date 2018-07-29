BROWSER=firefox-developer-edition
TERM=termite
TERMINAL=termite
QT_QPA_PLATFORMTHEME=gtk2
VISUAL=vim
XDG_CONFIG_HOME="$HOME/.config"

export BROWSER
export TERM
export TERMINAL
export QT_QPA_PLATFORMTHEME
export VISUAL
export XDG_CONFIG_HOME

alias dmenu="rofi -dmenu -lines 0"
alias firefox="firefox-developer-edition"
alias mpdir="mkdir -p"

mcdir() { test -e "$1" || mkdir -p "$1" && cd "$1" }

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

