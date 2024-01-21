set -u
cd "$(dirname "$0")" || exit
DOTFILES="$(pwd)"
export DOTFILES

source "bash/env_vars.sh"
repos_str="harrysta/dotfiles"
repos="harrysta\/dotfiles"

fn_help() {
  cat << EOF
usage: $0 [OPTIONS]

    --help               Show help message
    --all                Install and source everything
    --vim                Source vim configuration file
    --nvim               Source neovim configuration file
    --tmux               Source tmux configuration file (Unix systems only)
    --profile            Source either .profile or .bash_profile
    --bashrc             Source .bashrc
    --brew               Install homebrew packages (Darwin systems only)

EOF
}

if [ "$#" -eq 0 ]; then
  fn_help
  exit 2
fi

vim_config=0
neovim_config=0
tmux_config=0
brew_config=0
profile_config=0
bashrc_config=0

for opt in "$@"; do
  case $opt in
    --help)
      fn_help
      exit 0
      ;;
    --all)
      vim_config=1
      neovim_config=1
      tmux_config=1
      profile_config=1
      bashrc_config=1
      ;;
    --vim)
      vim_config=1
      ;;
    --nvim)
      neovim_config=1
      ;;
    --tmux)
      tmux_config=1
      ;;
    --brew)
      brew_config=1
      ;;
    --profile)
      profile_config=1
      ;;
    --bashrc)
     bashrc_config=1
      ;;
    *)
      echo "unknown option: $opt"
      fn_help
      exit 2
      ;;
  esac
done

fn_remove_vim_lines() {
  vimrc_path="$1"

  if [ "$(uname)" = "Darwin" ]; then
    sed -i "" '/" '$repos'/d' "$vimrc_path"
  else
    sed -i '/" '$repos'/d' "$vimrc_path"
  fi
}

fn_remove_sh_lines() {
  vimrc_path="$1"

  if [ "$(uname)" = "Darwin" ]; then
    sed -i "" '/# '$repos'/d' "$vimrc_path"
  else
    sed -i '/# '$repos'/d' "$vimrc_path"
  fi
}

if [ "$vim_config" -eq 1 ]; then
  printf "Sourcing vim config...\n"
  if [ -f "$HOME/.vimrc" ]; then
    vimrc_path="$HOME/.vimrc"
    printf "  - Found %s\n" "$vimrc_path"
  elif [ -f "$HOME/.vim/vimrc" ]; then
    vimrc_path="$HOME/.vim/vimrc"
    printf "  - Found %s\n" "$vimrc_path"
  else
    vimrc_path="$HOME/.vim/vimrc"
    printf "  - No vimrc found\n"
    if [ ! -d "$HOME/.vim" ]; then
      mkdir "$HOME/.vim"
    fi
    touch "$vimrc_path"
    printf "  - Created %s\n" "$vimrc_path"
  fi

  fn_remove_vim_lines "$vimrc_path"
  printf "source \$DOTFILES/vim/vanilla.vim \" %s\n" "$repos_str" >> "$vimrc_path"
  printf "  - Done\n"
fi

if [ "$neovim_config" -eq 1 ]; then
  printf "Sourcing neovim config...\n"
  vimrc_path="$XDG_CONFIG_HOME/nvim/init.vim"
  if [ -f "$vimrc_path" ]; then
    printf "  - Found %s\n" "$vimrc_path"
  else
    printf "  - No init.vim found\n"
    if [ ! -d "$XDG_CONFIG_HOME/nvim" ]; then
      mkdir -p "$XDG_CONFIG_HOME/nvim"
    fi
    touch "$vimrc_path"
    printf "  - Created %s\n" "$vimrc_path"
  fi

  fn_remove_vim_lines "$vimrc_path"
  {
    printf "\" let g:colorscheme = { \"path\": \"\", \"name\": \"\" } \" %s\n" "$repos_str"
    printf "source \$DOTFILES/vim/vanilla.vim \" %s\n" "$repos_str"
    printf "source \$DOTFILES/vim/ide.lua \" %s\n" "$repos_str"
  } >> "$vimrc_path"
  printf "  - Done\n"
fi

if [ "$tmux_config" -eq 1 ] && [ "$(getos)" != "win" ]; then
  printf "Sourcing tmux config...\n"
  tmuxconf_path="$XDG_CONFIG_HOME/tmux/tmux.conf"
  if [ -f "$tmuxconf_path" ]; then
    printf "  - Found %s\n" "$tmuxconf_path"
  else
    printf "  - No tmux config found\n"
    if [ ! -d "$XDG_CONFIG_HOME/tmux" ]; then
      mkdir -p "$XDG_CONFIG_HOME/tmux"
    fi
    touch "$tmuxconf_path"
    printf "  - Created %s\n" "$tmuxconf_path"
  fi

  fn_remove_sh_lines "$tmuxconf_path"
  printf "source-file $DOTFILES/tmux.conf # %s\n" "$repos_str" >> "$vimrc_path"
  printf "  - Done\n"
fi

if [ "$(uname)" = "Darwin" ] && [ "$brew_config" -eq 1 ]; then
  printf "Detected Darwin\n"
  if ! command -v brew &> /dev/null; then
    printf "  - Installing homebrew...\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  printf "  - Installing homebrew packages...\n"
  while IFS= read -r package || [ -n "$package" ]; do
    brew install "$package"
  done < "brew_packages"
fi

if [ "$profile_config" -eq 1 ]; then
  printf "Sourcing profile...\n"
  profile_path="$HOME/.profile"
  if [ -f "$profile_path" ]; then
    printf "  - Found %s\n" "$profile_path"
  elif [ -f "$HOME/.bash_profile" ]; then
    profile_path="$HOME/.bash_profile"
    printf "  - Found %s\n" "$profile_path"
  else
    printf "  - No profile found\n"
    touch "$profile_path"
    printf "  - Created %s\n" "$profile_path"
  fi

  fn_remove_sh_lines "$profile_path"
  cat << EOF >> "$profile_path"
export DOTFILES="$DOTFILES" # $repos_str
export PATH="\$PATH:\$DOTFILES/scripts" # $repos_str
source \$DOTFILES/bash/profile.sh # $repos_str
# $repos_str: place custom exports here
if [ "\$(tty)" = "/dev/tty1" ] && [ -z "\$DISPLAY" ] && command -v "startx" > /dev/null 2>&1; then # $repos_str
  exec dbus-launch --exit-with-session --sh-syntax startx # $repos_str
fi # $repos_str
EOF
  printf "  - Done\n"
fi

if [ "$bashrc_config" -eq 1 ]; then
  printf "Sourcing bashrc...\n"
  bashrc_path="$HOME/.bashrc"
  if [ -f "$bashrc_path" ]; then
    printf "  - Found %s\n" "$bashrc_path"
  else
    printf "  - No bashrc found\n"
    touch "$bashrc_path"
    printf "  - Created %s\n" "$bashrc_path"
  fi

  fn_remove_sh_lines "$bashrc_path"
  printf "source \$DOTFILES/bash/bashrc.sh # %s\n" "$repos_str" >> "$bashrc_path"
  printf "  - Done\n"
fi

fn_mkdir() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
    printf "  - Created %s\n" "$1"
  fi
}

printf "Checking source dirs...\n"
fn_mkdir "$SRC/local" # Projects I contribute to
fn_mkdir "$SRC/misc" # Software built from source and is used on target system
fn_mkdir "$SRC/lib" # Libraries built from source and required to build other local projects
printf "  - Done\n"
