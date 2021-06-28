#!/usr/bin/sh
# .zlogin

echo
pfetch | sed 's/^/  /'
echo -n "\033[F" # move cursor up a line
colorscript exec zwaves | sed 's/^/          /'
source ~/repos/hacker-quotes/hacker-quotes.plugin.zsh | fold -sw 60 | sed 's/^/  /'

