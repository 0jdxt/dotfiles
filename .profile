export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export BROWSER=brave
export EDITOR=nvim
export PAGER=most
export TERM=xterm-256color
export WM=bspwm

export ZDOTDIR="$HOME/.config/zsh"
export CARGO_HOME="$HOME/.config/cargo"
export RUSTUP_HOME="$HOME/.config/rustup"

PATH="$HOME/.bin:$PATH"
PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
PATH="$CARGO_HOME/bin:$PATH"
export PATH="$HOME/.config/npm/bin:$PATH"

export PERL5LIB="$HOME/perl5/lib/perl5"
export PERL_LOCAL_LIB_ROOT="$HOME/.config/perl5"
export PERL_MB_OPT="--install_base $HOME/.config/perl5"
export PERL_MM_OPT="INSTALL_BASE=$HOME/.config/perl5"

dc=~/.config/dir_colors
[ -f $dc ] && eval "$(dircolors $dc)"

# auto start tbsm after login on first two VTs
[ "$XDG_VTNR" -le 2 ] && tbsm

# echo "SOURCED AS $0"

