#!/bin/bash
 
killall -q polybar
 
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
 
polybar --reload top &
polybar --reload main &
 
echo "Polybar launched..."
