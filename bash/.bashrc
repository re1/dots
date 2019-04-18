# if not running interactively, don't do anything
[[ $- != *i* ]] && return
# set prompt
PS1='\e[0;32m→\e[m '
# change directory when entering a path
shopt -s autocd
# append history instead of overwriting it
shopt -s histappend
# history search with up and down keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
