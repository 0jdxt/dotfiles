## Functions for zsh

## FUNCS
# prints custom zsh functions
# Args: none
function funcs {
    grep -E -A3 '^## [A-Z\.]{2,}' $ZDOTDIR/funcs.zsh
}

## FUCK
# shortcut for `$ sudo !!`
# Args: none
function fuck {
    cmd="sudo $(fc -ln -1)"
    echo $cmd
    eval $cmd
}


## CD
# run ls after cd
# Args: path?
function cd {
    builtin cd $1 && l
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
