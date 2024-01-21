source "$DOTFILES/bash/env_vars.sh"
if [ "$(getos)" = "mac" ]; then
  defaults write -g InitialKeyRepeat -int 15
  defaults write -g KeyRepeat -int 1
fi
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
