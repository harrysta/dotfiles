# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export LC_ALL="en_US.UTF-8"
export EDITOR="nvim"
export TERMINAL="st"

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=$HOME/.local/share
export XDG_RUNTIME_DIR=/run/user/1000

export CONDARC=$XDG_CONFIG_HOME/conda/condarc
export WALLPAPERS="$HOME/pic/wallpapers/"

export QTDIR=/opt/qt/$(ls /opt/qt | grep '^[0-9]' | sort -nr | head -n1)/gcc_64
PATH=$PATH:$QTDIR/bin
PATH=$PATH:$QTDIR/lib

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
