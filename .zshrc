#!/usr/bin/env zsh

########
# TMUX #
########
if [ -z "$TMUX"  ]; then
    unatt=$(tmux ls | grep -v attached)
    ([ -n "$unatt" ] && tmux attach) || tmux new
    exit
fi

#############
# dircolors #
#############
test -r "$HOME/.dir_colors" && eval $(dircolors "$HOME/.dir_colors")

#############
# oh-my-zsh #
#############
export ZSH="/home/jay/.oh-my-zsh"

ZSH_THEME="sorin" # "wedisagree"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

#######
# zsh #
#######
autoload -U colors && colors
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d /.cache/zsh/zcompdump

_comp_options+=(globdots)

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

plugins=(git)
source $ZSH/oh-my-zsh.sh
fpath=(~/.zfunc ~/.zsh_comp $fpath)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

export KEYTIMEOUT=0

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}


# session keys
export CODESTATS_API_KEY="SFMyNTY.YW1SNGRBPT0jI05Ua3pOUT09.PPy-4F3qHwT8VKZqO2-nTNUB-KL-HH-OiQHAgdij2F0"

#######################
# zplug - zsh plugins #
#######################
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:"2"
zplug "leophys/zsh-plugin-fzf-finder"
zplug "peterhurford/git-aliases.zsh"
zplug "peterhurford/up.zsh"
zplug "rummik/zsh-ing"
zplug "paraqles/zsh-plugin-ssh"
zplug "joow/youtube-dl"
zplug "srijanshetty/zsh-pip-completion"
zplug "zpm-zsh/ssh"
zplug "code-stats/code-stats-zsh", from:"gitlab", use:"codestats.plugin.zsh"
zplug "supercrabtree/k"
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"

if zplug check; then
    zplug install
fi
zplug load >/dev/null

########
# MISC #
########

if [[ $VIRTUAL_ENV ]]; then
    export PS1="($(basename \"$VIRTUAL_ENV\")) $PS1"
fi

lfcd() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# unwanted home directories
#declare -a home_dirs=(Documents Downloads Music Pictures Videos)
#for dir in "${home_dirs[@]}"; do
#    pth=~/$dir
#    if [ -d $pth ]; then
#        rmdir "$pth"
#        echo "[-] Deleted $pth"
#    fi
#done

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jay/.sdkman"
[[ -s "/home/jay/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jay/.sdkman/bin/sdkman-init.sh"

export PATH="/usr/local/lib/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="/usr/local/lib/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/usr/local/lib/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/usr/local/lib/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/usr/local/lib/perl5"


wttr() {
    local request="v2.wttr.in/${1-Shepherds+Bush}"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}

proj() {
    dox=~/dox
    lang=$(ls $dox | grep stuff | dmenu)
    if [ -n "$lang" ]; then
        folder=$(ls $dox/$lang | dmenu)
        [ -n "$folder" ] && $EDITOR $dox/$lang/$folder
    fi
}

clone() {
    echo Cloning $1 to ~/repos/$1
    cd ~/repos
    git clone git@github.com:$1
    cd $1
}

function gi() {
    curl -sLw "\n" https://www.gitignore.io/api/$@
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.profile ] && source ~/.profile
[ -f ~/.config/aliasrc ] && source ~/.config/aliasrc
eval "$(direnv hook zsh)"

~/repos/pfetch/pfetch

alias dotfiles='git --git-dir=/home/jay/dotfiles --work-tree=/home/jay'
