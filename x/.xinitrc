#!/bin/sh

xrandr --output DP-4 --mode 2560x1440 --rate 170
xinput --set-prop "SINOWEALTH Game Mouse" 300 -0.7
xset r rate 250 30
feh --bg-fill --no-fehbg --randomize $WALLPAPERS
picom -b
dwmstatus &
discord &
steam &
qjackctl start &

exec dwm
