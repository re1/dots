alias dmenu="rofi -dmenu -lines 0"
alias firefox="firefox-developer-edition"
alias xo="xdg-open"
# short git commands
alias ga="git add ."
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push"
alias gst="git status"
# faster directory creation
alias mpdir="mkdir -p"
mcdir() { test -e "$1" || mkdir -p "$1" && cd "$1" }

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
