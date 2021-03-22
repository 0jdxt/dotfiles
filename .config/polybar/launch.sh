#!/usr/bin/env bash

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# broadcast: echo to console and send to polybar logs
bc() { echo "$@" | tee -a --output-error=exit /tmp/polybar/*.log; }

# load monitor names
mapfile -s 1 -t monitors < <(xrandr --listactivemonitors | awk '{print $4}')

MON_COUNT=0
mkdir -p /tmp/polybar
bc "---" # indicates new session
init_mon() {
    name=$1
    mon="${monitors[MON_COUNT]}"
    if [[ $mon =~ ^$name\-1 ]]; then
        shift # get bars
        for bar in "$@"; do
            touch "/tmp/polybar/$bar.log"
            MONITOR=$mon polybar --reload "$bar" >>"/tmp/polybar/$bar.log" 2>&1 &
        done
    else
        bc "warning: $name not found."
    fi
    ((MON_COUNT++))
}

# init in order that xrandr lists them
init_mon eDP main
init_mon HDMI top_screen

