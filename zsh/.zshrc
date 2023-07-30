#   re1's          _
#          _______| |__  _ __ ___
#         |_  / __| '_ \| '__/ __|
#        _ / /\__ \ | | | | | (__
#       (_)___|___/_| |_|_|  \___|

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load compiled plugins
source ~/.zsh_plugins.sh

# Load starship prompt
eval "$(starship init zsh)"

# Load and initialize autocompletion
fpath+=(~/.zsh $fpath)
autoload -Uz compinit
compinit

# Load history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Bind up and down keys for history search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Initialize fasd
eval "$(fasd --init posix-alias zsh-hook)"

# Change directory without cd
setopt autocd

# Save command history to file
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=$HISTSIZE

# Plugin configuration
export AUTO_NOTIFY_THRESHOLD=120
export AUTO_NOTIFY_EXPIRE_TIME=5000
AUTO_NOTIFY_IGNORE+=("yarn" "npm" "docker")

# Default applications
export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/nvim

# PATH extensions
export PATH="$HOME/.local/bin:$PATH" # user's local binaries
export PATH="$HOME/go/bin:$PATH" # go binaries
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH" # Add ruby gems to PATH

# Java development
export JAVA_HOME="/usr/lib/jvm/default" # Java

# Android development
export ANDROID_HOME="$HOME/Android/Sdk/"
export PATH=$PATH:$ANDROID_HOME/tools/
export PATH=$PATH:$ANDROID_HOME/tools/bin/
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/emulator

# Flutter development
export PATH="$HOME/.local/share/flutter/bin:$PATH" # Add Flutter binaries to Path
export CHROME_EXECUTABLE=/usr/bin/chromium # Set Chrome browser binary for Flutter

# Docker
export DOCKER_BUILDKIT=1 # Enable Docker Buildkit for faster builds

# Dotnet development
export PATH="$HOME/.dotnet/tools:$PATH" # Add dotnet tools to path
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # disable dotnet telemetry
export DOTNET_INTERACTIVE_CLI_TELEMETRY_OPTOUT=1 # again..
# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")
  reply=( "${(ps:\n:)completions}" )
}
compctl -K _dotnet_zsh_complete dotnet

# NVM
source /usr/share/nvm/init-nvm.sh

# ----------------------- #
#   Aliases & Functions   #
# ----------------------- #
alias b='bat'
alias c='cat'
alias g='git'
alias p='pass'
alias ydl='youtube-dl'

# Antibody bundle plugins and compile them to ~/.zsh_plugins.sh
alias ab='antibody bundle < ~/.zsh_plugins > ~/.zsh_plugins.sh'

# Clipboard
alias clip='xclip -selection clipboard'

# Docker
alias up='docker-compose up'
alias down='docker-compose down'

# Fasd
alias e='f -e nvim'
alias j='fasd_cd -d'
alias o='a -e xdg-open'

# Files and directories
alias ls='ls --color=auto'
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
alias gcp='git add .; git status; git commit -S -e; git push'
alias gms='git checkout stable; git merge master; git push; git checkout master'

# Download gitignore for arguments
function gi() {
    curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@;
}

# Node
alias yb='yarn build'
alias yc='yarn clean'
alias yd='yarn develop'
alias ys='yarn start'

alias nb='npm run build'
alias nc='npm run clean'
alias nd='npm run develop'
alias ns='npm run start'

alias dev='yarn develop'
alias build='yarn build'

# Avoid permission problems
alias chmod='chmod --preserve-root'

# Pacman as in https://wiki.archlinux.org/index.php/Pacman_Tips)
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacrem='sudo pacman -Rns'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'

# @dylanaraps has some weird aliases
alias anakin='sudo pacman -Rns $(pacman -Qtdq)'

# List packages as in https://bbs.archlinux.org/viewtopic.php?id=93683
function paclist() {
  LC_ALL=C pacman -Qei $(pacman -Qu | cut -d " " -f 1) | \
    awk 'BEGIN {FS=":"} /^Name/{printf("\033[1;36m%s\033[1;37m", $2)} /^Description/{print $2}'
}
