#!/bin/sh

srcdir="$HOME/.local/src"
fontdir="$XDG_DATA_HOME/fonts"
suckless_programs=("dwm" "st" "dmenu")

# suckless
for n in "${suckless_programs[@]}"
do
  cdir=$srcdir/$n
  mkdir -p $srcdir
  git -C $cdir init
  git -C $cdir remote add origin https://git.suckless.org/$n
  git -C $cdir pull origin master
  sudo make clean install -C $srcdir/$n
done

# fonts
wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip -P $fontdir
unzip -o $fontdir/master.zip -d $fontdir
find $fontdir/YosemiteSamFranciscoFont-master ! -name "*.ttf" -type f -delete
rm $fontdir/master.zip
