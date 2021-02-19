## basic zsh options
autoload -U colors && colors
setopt autocd
zle && { zle reset-prompt; zle -R }

zc() {
    ([ ! -f "$1.zwc" ] || [ $1 -nt "$1.zwc" ]) && zcompile $1
}
zc $ZDOTDIR/.zshrc
zc $ZDOTDIR/funcs.zsh
zc $ZDOTDIR/zr.zsh

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
unsetopt complete_aliases

## autocomplete
fpath=(~/.config/zsh/comp $fpath)
zmodload zsh/complist
_comp_options+=(globdots)
zstyle ':completion:*' menu select=2
zstyle ':completion:*' rehash true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

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
# load aws completions - only thing that needs bashcompinit
autoload bashcompinit && bashcompinit
complete -C '/usr/bin/aws_completer' aws

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
export _ZR=$ZDOTDIR/zr.zsh
if [[ ! -f $_ZR ]] || [ $ZDOTDIR/.zshrc -nt $_ZR ]; then
    zr \
        hlissner/zsh-autopair \
        zpm-zsh/colorize \
        twang817/zsh-clipboard \
        rapgenic/zsh-git-complete-urls \
        zdharma/fast-syntax-highlighting \
    > $_ZR
fi
source $_ZR

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

eval $(starship init zsh)


