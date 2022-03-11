#!/bin/sh

xrandr --output $XOUTPUT --mode $XRES --rate $XRATE
feh --bg-fill --no-fehbg --randomize $WALLPAPERS
. xexclusiverc # declarations and commands exclusive to this machine

exec $WM
