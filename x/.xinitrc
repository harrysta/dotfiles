#!/bin/sh

xrandr --output DP-4 --mode 2560x1440 --rate 170
feh --bg-fill --no-fehbg --randomize $WALLPAPERS
dwmstatus &
discord &
steam &

exec dwm
