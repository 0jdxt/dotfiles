#!/bin/bash
xrandr_out=$(awk '{print $4}' <<< "$(xrandr --listmonitors)" | xargs)
n=$(wc -w <<< "$xrandr_out")

if (( n == 2 )); then
    scr=$(awk '{print $1}' <<< "$xrandr_out")
    ext=$(awk '{print $2}' <<< "$xrandr_out")
	# xrandr --output "$ext" --above "$scr"
    echo "$ext above $scr"
fi

