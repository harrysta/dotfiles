#!/bin/sh

set -e

srcdir="$HOME/.local/src"
fontdir="$XDG_DATA_HOME/fonts"
suckless_programs={"dwm", "st"}

# suckless
for n in $suckless_programs
do
  git clone https://git.suckless.org/$n $srcdir/$n
  sudo make clean install -C $srcdir/$n
done

# fonts
wget https://github.com/supermarin/YosemiteSamFranciscoFont/archive/master.zip -P $fontdir
unzip -o $fontdir/master.zip -d $fontdir
find $fontdir/YosemiteSamFranciscoFont-master ! -name "*.ttf" -type f -delete
rm $fontdir/master.zip
