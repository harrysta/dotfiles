export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export VISUAL="vim"

os="$("$DOTFILES"/scripts/getos)"
if [ "$os" = "win" ]; then
  export HOME="$USERPROFILE"
  export XDG_CONFIG_HOME="$LOCALAPPDATA"
  export XDG_CACHE_HOME="$TMP"
  export XDG_DATA_HOME="$LOCALAPPDATA"
  export XDG_STATE_HOME="$LOCALAPPDATA"
  export SRC="$HOMEDRIVE/src"
else
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_STATE_HOME="$HOME/.local/state"
  export XDG_DATA_DIRS="/usr/local/share:/usr/share"
  export XDG_CONFIG_DIRS="/etc/xdg"
  export XDG_RUNTIME_DIR="/run/user/$UID"
  export SRC="$HOME/.local/src"
fi
