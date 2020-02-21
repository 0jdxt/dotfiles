#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "---" | tee -a /tmp/main.log /tmp/top_screen.log
polybar --reload main >>/tmp/main.log 2>&1 &
polybar --reload top_screen >>/tmp/top_screen.log 2>&1 &
polybar --reload tray >>/tmp/top_screen.log 2>&1 &

