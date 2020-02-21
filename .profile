#!/usr/bin/env bash

####################
# Add shit to PATH #
####################
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.poetry/bin:$PATH
export PATH=/snap/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/apache-maven-3.6.2/bin
export PATH=$PATH:/usr/local/apache-maven-3.6.2/
export PATH_TO_FX="/usr/lib/javafx-sdk-13.0.1/lib"
export PATH_TO_FX_MODS="/usr/lib/javafx-jmods-13.0.1"

# nodejs
# VERSION=v12.8.0
# DISTRO=linux-x64
# export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH
export PATH=~/.npm-global/bin:$PATH

# export PATH=$(yarn global bin):$PATH

# personal bin
export PATH=$HOME/py_bin:$PATH
export PATH=$HOME/rust_bin:$PATH

############
# env vars #
############
export JAVA_HOME="/usr/lib/jvm/jdk-13.0.1"
export PATH=$PATH:$GOPATH/bin
export DEFAULT_USER="jay"
export EDITOR="nvim"
export BROWSER="firefox"
export RANGER_LOAD_DEFAULT_RC="FALSE"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export MANPATH=/usr/local/man:$MANPATH
export LANG="en_GB.UTF-8"
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH=$HOME/.ssh/rsa_id
export BAT_THEME="Nord"
# export ZDOTDIR="$HOME/.config/zsh"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export TERM=tmux-256color

#############
# FUNCTIONS #
#############

se() {
    command du -a . | awk '{print $2}' | fzf | xargs -r $EDITOR
}

# remap caps lock to exclamation
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = exclam"

