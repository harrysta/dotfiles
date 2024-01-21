# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

shopt -s histappend
shopt -s checkwinsize
eval "$(dircolors -b)"
export color_prompt=

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  export color_prompt=yes
fi

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoredups

GREEN="\e[1;32m"
YELLOW="\e[33m"
NC="\e[0m"

LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
PS1="\[$GREEN\]\u@\h:\[$YELLOW\]\w\$\[$NC\] "

unset GREEN
unset YELLOW
unset NC

alias cp="cp -i"
alias mv="mv -i"
alias ls="ls -Fv --color=auto --group-directories-first"
alias less="less --ignore-case"
alias yt-dlp="yt-dlp --compat-options no-certifi"
alias hosts="cat /etc/hosts"

alias dl="cd \$HOME/Downloads"
alias doc="cd \$HOME/Documents"
alias pic="cd \$HOME/Pictures"
alias dsk="cd \$HOME/Desktop"
alias mus="cd \$HOME/Music"
alias src="cd \$SRC"

fn_alias_cd() {
  if [ -d "$1" ]; then
    alias "$1"="cd \$HOME/$1"
  fi
}

fn_alias_cd "dl"
fn_alias_cd "doc"
fn_alias_cd "pic"
fn_alias_cd "dsk"
fn_alias_cd "mus"

# list usage
alias lu="find . -maxdepth 1 -type d ! -path . -print | xargs du -sh | sort -rh"
alias s='cd $(find $SRC/* -mindepth 1 -maxdepth 1 -type d | fzf)'
alias j="pst | jq | bat --language json"

# rm, rmdir
alias rm="rm -i"
alias rmdir="rmdir -i"
if command -v "trash" > /dev/null 2>&1; then
  alias rm="trash -i"
  alias rmdir="trash -i"
fi

# python
alias py="python"
if command -v "python3" > /dev/null 2>&1; then
  alias py="python3"
fi

case "$(getos)" in
  mac)
    if command -v "gls" &> /dev/null; then
      alias ls="gls -Fv --color=auto --group-directories-first"
    fi
    alias gdb="lldb"
    alias cpy="pbcopy <"
    alias pst="pbpaste"
    ;;
  linux)
    alias cpy="xclip -sel c <"
    alias pst="xclip -o -selection clipboard"
    ;;
  win)
    alias hosts="cat \$SYSTEMDRIVE/Windows/System32/drivers/etc/hosts"
    alias cpy='echo "No idea"'
    alias pst="powershell.exe get-clipboard"
    ;;
esac
