#!/bin/bash


# For working with Python's pip and virtualenv modules.
activate() {
  if [ "$1" != "" ]; then
    source "$1/bin/activate"
  elif [ -d "env" ]; then
    source "env/bin/activate"
  else
    source "./bin/activate"
  fi
}

# Easy switching between DotCloud config files.
dotcloud_config() {
  export DOTCLOUD_CONFIG_FILE="$HOME/.dotcloud/$1.conf"
}

extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# mkdir && cd
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# Taken from alias.sh
# http://alias.sh/reconnect-or-start-tmux-or-screen-session-over-ssh
sssh() {
  ssh -t "$1" 'tmux attach || tmux new || screen -DR';
}

# For Xcode workspaces.
work() {
  xcode=$(ls | grep ".*xcworkspace" || ls | grep ".*xcodeproj")
  echo $xcode | xargs open
}

apps() {
  cd "$HOME/Music/iTunes/iTunes Media/Mobile Applications"
}
