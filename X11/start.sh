#!/bin/bash

# Start dwmblocks
#exec dwmblocks &

# Start picom compositor
exec picom &

# Start nitrogen for setting wallpaper
exec nitrogen --restore &

# Start network manager system tray
exec nm-applet &

# Start bluetooth manager
exec blueman-applet &

# Start battery notification service
exec $XDG_CONFIG_HOME/dunst/notifications/bat0.sh &

# Start polybar
exec $XDG_CONFIG_HOME/polybar/launch.sh &

# export variables required for dwm
export AWT_TOOLKIT=MToolkit

# Start dwm
while true; do
    dwm 2> $XDG_CONFIG_HOME/dwm/dwm.log
done
