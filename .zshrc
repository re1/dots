# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/markus/.oh-my-zsh

ZSH_THEME="spaceship"           # Set name of the theme to load

# CASE_SENSITIVE="true"         # Use case-sensitive completion

# Uncomment the following line to use hyphen-insensitive completion. 
# Case sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# DISABLE_AUTO_UPDATE="true"    # Disable bi-weekly auto-update checks
# export UPDATE_ZSH_DAYS=13     # Change how often to auto-update (in days)

# DISABLE_LS_COLORS="true"      # Disable colors in ls
# DISABLE_AUTO_TITLE="true"     # Disable auto-setting terminal title

ENABLE_CORRECTION="true"        # Enable command auto-correction.
COMPLETION_WAITING_DOTS="true"  # Display red dots whilst waiting for completion.

# Disable marking untracked files under VCS as dirty. 
# This makes repository status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Change the command execution time stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(archlinux autoenv.plugin autojump docker yarn pass bd)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"  # Set path for man pages
# export LANG=en_US.UTF-8                   # Set language environment manually
export ARCHFLAGS="-arch x86_64"             # Compilation flags
export SSH_KEY_PATH="~/.ssh/id_rsa"         # SSH

# Set personal aliases, overriding those provided by oh-my-zsh libs, 
# plugins, and themes.  Aliases can be placed here, though oh-my-zsh 
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

key=key+sizeof(key);

[[ $- != *i* ]] && return   # If not running interactively, don't do anything

# Download gitignore for arguments from gitignore.io
gi () {     
    old="$IFS"; IFS=','
    curl "https://www.gitignore.io/api/$*" >> "$PWD/.gitignore"
    IFS=$old
}

alias ga='git add .; git status'
alias gc='git add .; git status; git commit -e'
alias gp='git push'
alias gcp='git add .; git status; git commit -e; git push'
alias ls='ls --color=auto'
alias t ='tree'

BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/nvim

export PATH="$(yarn global bin):$PATH"  # Add yarn global binaries to PATH
export PATH="$HOME/.local/bin:$PATH"    # Add user's local binaries to PATH

