[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

export LC_ALL="en_US.UTF-8"
export EDITOR="nvim"
export TERMINAL="st"

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_RUNTIME_DIR=/run/user/$UID
command -v wine && export WINEPREFIX=$HOME/.local/wine

export CONDARC=$XDG_CONFIG_HOME/conda/condarc
export WALLPAPERS="$HOME/pic/wallpapers/"
export QTDIR=/opt/qt/$(ls /opt/qt | grep '^[0-9]' | sort -nr | head -n1)/gcc_64

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
PATH=$PATH:$QTDIR/bin
PATH=$PATH:$QTDIR/lib

[[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && startx
