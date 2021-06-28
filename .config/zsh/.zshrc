#!/usr/bin/zsh

## basic zsh options
zle && { zle reset-prompt; zle -R }
autoload -U colors && colors
setopt autocd autopushd pushdignoredups

# compile stuff
zc() {
    { [ ! -f $ZDOTDIR/$1.zwc ] || [ $ZDOTDIR/$1 -nt $ZDOTDIR/$1.zwc ] } && zcompile $ZDOTDIR/$1
}
zc .zshrc
zc zr.zsh
zc funcs.zsh

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

## autocomplete
fpath+=($ZDOTDIR/comp)
zmodload zsh/complist
_comp_options+=(globdots)
zstyle ':completion:*' menu select=2
zstyle ':completion:*' rehash true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
unsetopt complete_aliases

## environment stuff
source ~/.config/aliasrc
source ~/.fzf.zsh

## functions & completions
autoload -Uz compinit
compdump="$ZDOTDIR/.zcompdump"
if [[ -n "$compdump" ]]; then
  compinit -i "$compdump"
else
  compinit -C "$compdump"
fi
# NB: load after compinit for completions
source ~/.config/zsh/funcs.zsh

## vi mode, modified from LukeSmithxyz
bindkey -v
export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

## history search
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

## clear bind
function clear-scrollback {
    echo -en "\ec\e[3J"
    pfetch
    zle reset-prompt
    zle zle-line-init
}
zle -N clear-scrollback
bindkey '^L' clear-scrollback

## plugins
if [[ ! -f $ZDOTDIR/zr.zsh ]] || [[ $ZDOTDIR/.zshrc -nt $ZDOTDIR/zr.zsh ]]; then
     zr \
        agkozak/polyglot \
        hlissner/zsh-autopair \
        zpm-zsh/colorize \
        twang817/zsh-clipboard \
        rapgenic/zsh-git-complete-urls \
        zdharma/fast-syntax-highlighting \
    > $ZDOTDIR/zr.zsh
fi
source $ZDOTDIR/zr.zsh

## prompt
# NB: must go after plugins
# Change cursor shape for different vi modes; works w/ polyglot
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]]; then
        psvar[4]='vicmd'
        echo -ne '\e[1 q'
    else
        psvar[4]=''
        echo -ne '\e[5 q'
    fi

    zle reset-prompt
    zle -R
}
zle -N zle-keymap-select

# init cursor in insert mode
function zle-line-init {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init

## change title
case "$TERM" in
    xterm*|rxvt*)
        function xtitle () {
            builtin print -n -- "\e]0;$@\a"
        }
        ;;
    screen)
        function xtitle () {
            builtin print -n -- "\ek$@\e\\"
        }
        ;;
    *)
        function xtitle () {
        }
esac

function precmd () {
    xtitle "$(print -P $HOST: zsh '(%~)')"
}
 function preexec () {
    xtitle "zsh: $1"
}
