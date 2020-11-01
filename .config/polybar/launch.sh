#!/usr/bin/env bash

# Terminate already running bar instances
# killall -q polybar
pkill polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "---" | tee -a /tmp/polybar/*.log

screen=eDP-1
ext=HDMI-1

curr_mode=$(optimus-manager --status | awk -F': ' '/^Current/ {print $2}')
if [ "$curr_mode" = "nvidia" ]; then
    screen="$screen-1"
    ext="$ext-1"
fi

mkdir /tmp/polybar
pb() {
    MONITOR=$1 polybar --reload "$2" >>"/tmp/polybar/$2.log" 2>&1 &
}
pb $screen main
pb $screen extras
pb $screen music
pb $ext top_screen

