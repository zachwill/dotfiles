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

sk(){
  if [ "$1" != "" ]; then
    screen -S $1 -X kill
    echo "Killed screen: $1"
  fi
}

# For Xcode workspaces.
work() {
  xcode=$(ls | grep ".*xcworkspace" || ls | grep "*.xcodeproj")
  xcode | xargs open
}

apps() {
  cd "$HOME/Music/iTunes/iTunes Media/Mobile Applications"
}
