# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export MANPATH="/usr/local/man:$MANPATH"

# Homebrew stuff
# Until LinuxBrew is fixed, the following is required.
# # See: https://github.com/Homebrew/linuxbrew/issues/47
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH
# ## Setup linux brew
export LINUXBREWHOME=$HOME/.linuxbrew
export PATH=$LINUXBREWHOME/bin:$PATH
export MANPATH=$LINUXBREWHOME/man:$MANPATH
export PKG_CONFIG_PATH=$LINUXBREWHOME/lib64/pkgconfig:$LINUXBREWHOME/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$LINUXBREWHOME/lib64:$LINUXBREWHOME/lib:$LD_LIBRARY_PATH

source $ZSH/oh-my-zsh.sh

mkcdl () {
    mkdir -p "$*"
    cd "$*"
    ls -al
}

cdl () {
    cd "$*"
    la
}

update () {
    sudo apt-get update
}

upgrade () {
    sudo apt-get upgrade
}

up () {
    sudo apt-get update && sudo apt-get upgrade
}

install () {
    sudo apt-get install "$*"
}

alias -s txt=vim
alias -s log=vim
alias -s html=sensible-browser
alias -s php=vim
alias -s css=vim
alias -s js=vim
alias -s sql=vim
alias -s cpp=vim
alias -s c=vim
alias -s h=vim
alias -s tex=vim
alias -s out="tailf"
alias -s png=eog
alias -s jpg=eog
alias -s bmp=eog
alias -s pdf=evince
alias -s kdbx=keepassx

# Add completions
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

function google; {
    firefox "http://www.google.com/search?q=`url-encode "${(j: :)@}"`"
}

bindkey '^R' history-incremental-search-backward
