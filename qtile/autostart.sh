#!/bin/bash

# Load picom
picom &

# Load nm-applet
nm-applet &

# Load blueman-applet
blueman-applet &

# Load display config
autorandr -c

~/.config/qtile/scripts/wallpaper.sh init &

source ~/.cache/wal/colors.sh

killall polybar

polybar --reload top -c ~/.config/polybar/config &
