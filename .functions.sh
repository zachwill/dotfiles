#!/bin/bash

# Shell function to turn .less files in the current directory
# into minified CSS files.
lesscss(){
  for file in $(find . -type f | grep .less$); do
    css_file=${file/less/css}
    lessc -x $file > $css_file
  done
}

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
