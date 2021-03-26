#!/usr/bin/zsh

## Functions for zsh

## FUNCS
# prints custom zsh functions
# Args: none
function funcs {
    grep -E -A2 '^## [A-Z\.]{2,}' $ZDOTDIR/funcs.zsh
}

## PARU
# wrapper for paru - sets `--devel` for updates
# Args: inherited
# function paru {
#     (($# == 0)) && set -- "-Syu" "--devel"
#     command paru $@
# }

## SUDOEDIT
# sudoedit wrapper to get syntax highlighting in vim
# Args: inherited
function sudoedit {
    SUDO_COMMAND="sudoedit $@" command sudoedit "$@"
}

## FUCK
# shortcut for `$ sudo !!`
# Args: none
function fuck {
     sudo $(fc -ln -1)
 }

## CD
# run ls after cd
# Args: path?
function cd {
    builtin cd $1 && lsd --group-dirs first
}


## GITIGNORE
# curls .gitignore templates
# Args: [lang,]+
function gi {
    curl -sL https://gitignore.io/api/$@
}
# suggests list fetched by gi function
function _gi {
    compset -P '*,'
    compadd -S '' $(gi list | tr "," "\n")
}
compdef _gi gi


## QRENCO.DE
# generates qr code with byte data
# Args: data
function qr {
    bytes=$(echo $@ | hexdump -v -e '/1 "%02x"' | sed 's/\(..\)/%\1/g')
    curl "qrenco.de/$bytes"
}


## WTTR
# Fetches weather, translates spaces to %20
# Args: location?
function wttr {
    loc=${@:-W12%209BB}
    curl "v2.wttr.in/${loc/ /%20}"
}


## ANK
# ank prints the nth field using awk
# Args: [n ]+
function ank {
    nums=$(for a in $@; do echo -n "\$$a,"; done)
    awk "{print ${nums:0:-1}}"
}
# suggest numbers for completion
function _ank {
    nums=($(seq 0 9))
    compset -P '*'
    compadd -a nums
}
compdef _ank ank

function _unp {
    exts=($(unp -s 2>/dev/null | tail -n +2 | awk -F: '{print $1}' | tr ',' '\n'))
    files=("${(@f)$(for ext in ${exts[@]}; do find . -maxdepth 1 -name "*.$ext" | cut -c3-; done)}")
    compset -P '* '
    compadd -a files
}
compdef _unp unp


## SCR
# close terminal then take screenshot after 3s delay
# Args: args for scrot
function scr {
    scrot -c -d 3 $@ & disown

    for i in $(seq 3 -1 1); do
        notify-send scr "taking shot in $i..." -t 900
        sleep 1
    done & disown

    exit
}
