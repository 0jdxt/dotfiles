#!/bin/bash
export BROWSER=brave
export EDITOR=nvim
export TERM=xterm-256color # for 💯 compatibility 🙏
export WM=bspwm
export PAGER="more -n 30"
export BAT_PAGER="more"
export MANPAGER="sh -c 'col -bx | bat -pl man'"

export ZDOTDIR="$HOME/.config/zsh"
export CARGO_HOME="$HOME/.config/cargo"
export RUSTUP_HOME="$HOME/.config/rustup"
export MOST_INITFILE="$HOME/.config/mostrc"

PATH="$HOME/.bin:$PATH"
PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
PATH="$CARGO_HOME/bin:$PATH"
export PATH="$HOME/.config/npm/bin:$PATH"

# misc
export POLYGLOT_PROMPT_DIRTRIM=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc"
export _JAVA_AWT_WM_NONREPARENTING=1

# tidy up perl
export PERL5LIB="$HOME/perl5/lib/perl5"
export PERL_LOCAL_LIB_ROOT="$HOME/.config/perl5"
export PERL_MB_OPT="--install_base $HOME/.config/perl5"
export PERL_MM_OPT="INSTALL_BASE=$HOME/.config/perl5"

# dircolors
[ -f ~/.config/dir_colors ] && eval "$(dircolors ~/.config/dir_colors)"

# auto start tbsm after login on first two VTs
[ -n "$XDG_VTNR" ] && (( XDG_VTNR < 2 )) && tbsm

# set BW_SESSION, uses gnome keyring
BW_SESSION=$(secret-tool lookup bw password)
export BW_SESSION

