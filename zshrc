# Path to your oh-my-zsh configuration.
export ZSH=~/.oh-my-zsh


#==============================================================================
# Stuff to do before Zsh config gets sourced
#==============================================================================

#========================
# Use dircolors
#========================

# Specify path to default dircolors
eval $(dircolors -b "${HOME}/.configfiles/dircolors-solarized/dircolors.256dark")

export TERM=xterm-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme
# each time that oh-my-zsh is loaded.
#ZSH_THEME="avit"

# Only load Liquid Prompt in interactive shells, not from a script from scp
[[ $- = *i* ]] && source ~/Projects/Configuration/liquidprompt/liquidprompt

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while
# waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked
# files under VCS as dirty. This makes repository status check for
# large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in
# ~/.oh-my-zsh/plugins/*) Custom plugins may be added to
# ~/.oh-my-zsh/custom/plugins/ Example format: plugins=(rails git
# textmate ruby lighthouse) per-directory-history
plugins=(git git-extras gitfast themes cp history compleat pip)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

#==============================================================================
# Prepend user-specific bin/ paths
#==============================================================================
if [ -d "${HOME}/.bin" ]
then
  PATH="${HOME}/.bin:${PATH}"
fi

#==============================================================================
# Miscellanneous
#==============================================================================

alias grep='grep --color=always -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias vp='vim PKGBUILD'
alias vs='vim SPLITBUILD'

#==============================================================================
# Vim stuff
#==============================================================================
export EDITOR=vim
export DIFF=vimdiff
export VISUAL=vim
alias vi=vim
alias view='vim -R'

#==============================================================================
# Nice ls
#==============================================================================
alias ls='ls -FX --group-directories-first --color=always'

#==============================================================================
# Location alias
#==============================================================================
alias uni='cd ~/Documents/DHBW'
alias workspace='cd ~/workspace'

#==============================================================================
# Create new directory and cd into it
#==============================================================================
alias md='__make_and_change_directory'

__make_and_change_directory() {
    for v in "$@"
    do
        mkdir "$v"
        cd "$v"
    done
}

#==============================================================================
# Extract an archive
#==============================================================================
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)        tar xjf $1        ;;
      *.tar.gz)         tar xzf $1        ;;
      *.bz2)            bunzip2 $1        ;;
      *.rar)            unrar x $1        ;;
      *.gz)             gunzip $1         ;;
      *.tar)            tar xf $1         ;;
      *.tbz2)           tar xjf $1        ;;
      *.tgz)            tar xzf $1        ;;
      *.zip)            unzip $1          ;;
      *.Z)              uncompress $1     ;;
      *)                echo "'$1' cannot be extracted via extract()" ;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#==============================================================================
# Git
#==============================================================================
alias glg='git lg'
alias gst='git st'

#==============================================================================
# Useful enter-key
#==============================================================================
magic-enter () {
  if [[ -z $BUFFER ]]; then
    echo ""
    if git rev-parse --is-inside-work-tree &>/dev/null; then
      git status
    else
      ls
    fi
    zle redisplay
  else
    zle accept-line
  fi
}
zle -N magic-enter
bindkey "^M" magic-enter

#==============================================================================
# thefuck alias
#==============================================================================
eval "$(thefuck --alias)"

#==============================================================================
# Fortune 10% chance of printing
#==============================================================================
if [ $(( RANDOM % 10)) -eq 0 ]; then
      fortune -an 140 | cowsay
    fi

export DEFAULT_USER=naibafo
