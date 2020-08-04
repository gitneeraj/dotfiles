#!/bin/bash
#exec dwmblocks &
exec picom &
exec nitrogen --restore &
exec $XDG_CONFIG_HOME/polybar/launch.sh &
exec nm-applet &

export AWT_TOOLKIT=MToolkit
#exec dwm
while true; do
    dwm 2> $XDG_CONFIG_HOME/dwm/dwm.log
done