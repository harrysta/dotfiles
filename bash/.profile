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
export BIN=$HOME/.local/bin
export SRC=$HOME/.local/src
export WALLPAPERS="$HOME/pic/wallpapers/"
[ -d "$BIN" ] && PATH="$BIN:$PATH"
[ $(tty) = /dev/tty1 ] && [ -z $DISPLAY ] && exists startx && startx
