
echo "Starting at $(date)" >> ~/.i3/logfile
exec /usr/bin/i3  -V -d all >> ~/.i3/logfile

notify-send "started"
