#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "---" | tee -a /tmp/main.log /tmp/top_screen.log

screen=eDP-1
ext=HDMI-1

curr_mode=$(optimus-manager --status | awk -F': ' '/^Current/ {print $2}')
if [ "$curr_mode" = "nvidia" ]; then
    screen="$screen-1"
    ext="$ext-1"
fi

MONITOR=$screen polybar --reload main >>/tmp/main.log 2>&1 &
MONITOR=$ext polybar --reload top_screen >>/tmp/top_screen.log 2>&1 &

