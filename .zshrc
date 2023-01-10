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

source $ZSH/oh-my-zsh.sh

mkcdl () {
    mkdir -p "$*"
    cd "$*"
    ls -al
}

cdl () {
    cd "$*"
    ls -la
}

update () {
    sudo apt-get update
}

upgrade () {
    sudo apt-get upgrade
}

autoremove () {
    sudo apt-get autoremove
}

autoclean () {
    sudo apt-get autoclean
}

up () {
    sudo apt-get update && sudo apt-get upgrade
}

autoup () {
    sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove && sudo apt-get autoclean
}

install () {
    sudo apt-get install "$*"
}

distup () {
    sudo apt-get dist-upgrade
    sudo apt-get autoremove && sudo apt-get autoclean
}

allup () {
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get autoremove
    sudo apt-get autoclean
    sudo apt-get dist-upgrade
    sudo apt-get autoremove
    sudo apt-get autoclean
}

purge () {
    sudo apt-get purge "$*"
    sudo apt-get update
    sudo apt-get autoremove
    sudo apt-get autoclean
}

fmanager () {
    xdg-open "$*"
}

passgen () {
    date +%s | sha256sum | base64 | head -c "$*"
}

pbcopy () {
    xclip -selection clipboard
}

pbpaste () {
    xclip -selection clipboard -o
}

mk () {
    make "$@"
}

# alias -s txt=vim
# alias -s log=vim
alias -s html=xdg-open
# alias -s php=vim
# alias -s css=vim
# alias -s js=vim
# alias -s sql=vim
# alias -s cpp=vim
# alias -s c=vim
# alias -s h=vim
# alias -s tex=vim
# alias -s out="tailf"
alias -s png=eog
alias -s jpg=eog
alias -s bmp=eog
alias -s pdf=xdg-open
alias -s ods=xdg-open
alias -s odt=xdg-open
alias -s docx=xdg-open
alias -s kdbx=keepassx

bindkey -v
bindkey '^R' history-incremental-search-backward

# Add completions
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export PATH=$PATH:/usr/local/go/bin

alias python=python3
if [ -e /home/jim/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jim/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH=$PATH:/home/jim/.local/bin
