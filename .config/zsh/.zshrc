## SRC
# sources files if they exist
# Args: file
function src { [ -f $1 ] && source $1 }

## basic zsh options
autoload -U colors && colors
setopt autocd
zle && { zle reset-prompt; zle -R }

## history
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
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## environment stuff
src ~/.config/aliasrc
src ~/.fzf.zsh

## functions & completions
autoload -Uz compinit
compinit
# NB: load after compinit for completions
src ~/.config/zsh/funcs.zsh
# load aws completions
src /usr/bin/aws_zsh_completer.sh

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
    printf "\ec\e[3J"
    pfetch
    echo -n "\033[F" # move cursor up a line
    zle reset-prompt
    zle zle-line-init
}
zle -N clear-scrollback
bindkey '^L' clear-scrollback

## plugins
zr=~/.config/zsh/zr.zsh
if [[ ! -f $zr ]] || [ ~/.config/zsh/.zshrc -nt $zr ]; then
    zr \
        agkozak/polyglot \
        hlissner/zsh-autopair \
        zpm-zsh/colorize \
        twang817/zsh-clipboard \
        rapgenic/zsh-git-complete-urls \
    > $zr
fi
# TODO: use zr for dl and update, make own sourcer/parser
src $zr

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

# load highlighting last
zr zdharma/fast-syntax-highlighting > "${zr}2"
src "${zr}2"

