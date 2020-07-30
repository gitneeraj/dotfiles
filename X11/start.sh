#!/bin/bash
exec dwmblocks &
exec picom --config $XDG_CONFIG_HOME/compton.conf &
exec nitrogen --restore &

export AWT_TOOLKIT=MToolkit
#exec dwm
while true; do
    dwm 2> $XDG_CONFIG_HOME/dwm/dwm.log
done
