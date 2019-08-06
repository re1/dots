#   re1's          _
#          _______| |__  _ __ ___
#         |_  / __| '_ \| '__/ __|
#        _ / /\__ \ | | | | | (__
#       (_)___|___/_| |_|_|  \___|

# if not running interactively, don't do anything
[[ $- != *i* ]] && return
# load compiled plugins
source ~/.zsh_plugins.sh

# load and initialize autocompletion
autoload -Uz compinit
compinit
# load history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# bind up and down keys for history search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
# initialize fasd
eval "$(fasd --init posix-alias zsh-hook)"
# change directory without cd
setopt autocd
# save command history to file
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=$HISTSIZE
# update spaceship char
SPACESHIP_CHAR_SYMBOL='→ '
# no chicken emoji in fontawesome
SPACESHIP_GOLANG_SYMBOL="  "
# list only needed spaceship prompts
SPACESHIP_PROMPT_ORDER=(
    time          # Time stamps section
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    package       # Package version
    node          # Node.js section
    golang        # Go section
    php           # PHP section
    rust          # Rust section
    docker        # Docker section
    venv          # virtualenv section
    pyenv         # Pyenv section
    dotnet        # .NET section
    ember         # Ember.js section
    exec_time     # Execution time
    line_sep      # Line break
    battery       # Battery level and status
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
)

# default applications
export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/nvim
# PATH extensions
export PATH="$HOME/.local/bin:$PATH"                        # Add user's local binaries to PATH
export PATH="$(yarn global bin):$PATH"                      # Add yarn global binaries to PATH
# export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"     # Add ruby gems to PATH


# ----------------------- #
#   Aliases & Functions   #
# ----------------------- #
alias c='cat'
alias p='pass'

# Antibody bundle plugins and compile them to ~/.zsh_plugins.sh
alias ab='antibody bundle < ~/.zsh_plugins > ~/.zsh_plugins.sh'

# Clipboard
alias clip='xclip -selection clipboard'

# Fasd
alias e='f -e nvim'
alias j='fasd_cd -d'
alias o='a -e xdg-open'

# Files and directories
alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias mkdir='mkdir -p'
alias t='tree -C'
alias ta='tree -aC -I .git'
alias td='tree -dC'

# Git
alias ga='git add .; git status'
alias gc='git add .; git status; git commit -S -e'
alias gp='git push'
alias gl='git pull'
alias gcp='git add .; git status; git commit -e; git push'
# download gitignore for arguments from gitignore.io
gi () {
    old="$IFS"; IFS=','
    curl "https://www.gitignore.io/api/$*" >> "$PWD/.gitignore"
    IFS=$old
}

# Node
alias yd='yarn develop'
alias yb='yarn build'

# avoid permission problems
alias chmod='chmod --preserve-root'
# Pacman as in https://wiki.archlinux.org/index.php/Pacman_Tips)
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacrem='sudo pacman -Rns'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
# @dylanaraps has some weird aliases
alias anakin='sudo pacman -Rns $(pacman -Qtdq)'
# list packages as in https://bbs.archlinux.org/viewtopic.php?id=93683
function paclist() {
  LC_ALL=C pacman -Qei $(pacman -Qu | cut -d " " -f 1) | \
    awk 'BEGIN {FS=":"} /^Name/{printf("\033[1;36m%s\033[1;37m", $2)} /^Description/{print $2}'
}
