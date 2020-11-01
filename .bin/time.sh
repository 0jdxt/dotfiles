#!/usr/bin/bash
#  _   _                      _
# | |_(_)_ __ ___   ___   ___| |__
# | __| | '_ ` _ \ / _ \ / __| '_ \
# | |_| | | | | | |  __/_\__ \ | | |
#  \__|_|_| |_| |_|\___(_)___/_| |_|
##
# Script to output time for polybar
# - rounds to nearest second
# - displays appropriate emoji by half hour
###

set -e

## emoji
declare -A clocks=(
    # hours
    [0,0]="🕛"  [0,1]="🕐"  [0,2]="🕑"
    [0,3]="🕒"  [0,4]="🕓"  [0,5]="🕔"
    [0,6]="🕕"  [0,7]="🕖"  [0,8]="🕗"
    [0,9]="🕘" [0,10]="🕙" [0,11]="🕚"
    # halfs
    [1,0]="🕧"  [1,1]="🕜"  [1,2]="🕝"
    [1,3]="🕞"  [1,4]="🕟"  [1,5]="🕠"
    [1,6]="🕡"  [1,7]="🕢"  [1,8]="🕣"
    [1,9]="🕤" [1,10]="🕥" [1,11]="🕦"
)

## read in vars
# - unpadded time parts
# - date together
read -r hour mins secs nanos date <<< "$(date "+%-H %-M %-S %N %a, %d %b")"

## parse nanos and increment secs if past .5s mark, cascading to hours
(( ${nanos:0:1} > 4 )) && ((\
    secs++, secs==60)) && ((secs=0,\
    mins++, mins==60)) && ((mins=0,\
    hour++, hour==24)) && hour=0

## set clock
clock="$(( mins>29 )),$(( hour%12 ))"

## output
printf "$date %02d:%02d:%02d ${clocks[$clock]}\n" $hour "$mins" "$secs"

