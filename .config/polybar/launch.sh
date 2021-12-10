#!/bin/bash
 
killall -q polybar
 
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
 
polybar --reload opaque_second &
polybar --reload opaque_main &
 
echo "Polybar launched..."
