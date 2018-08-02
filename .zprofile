alias dmenu="rofi -dmenu -lines 0"
alias firefox="firefox-developer-edition"
alias mpdir="mkdir -p"
alias xo="xdg-open"

mcdir() { test -e "$1" || mkdir -p "$1" && cd "$1" }

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
