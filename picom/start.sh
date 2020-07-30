#!/usr/bin/env bash

# Terminate already running bar instances
killall picom

# Launch bar1 and bar2
picom --config $HOME/.config/compton.conf
