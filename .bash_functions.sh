#!/bin/bash


# Growl command for iTerm2 -- useful for notifications.
# Usage:
#   long_process && growl "long_process complete"
growl() { echo -e $'\e]9;'${@}'\007'; return ; }


# Shell function to turn .less files in the current directory
# into minified CSS files.
lesscss(){
  for file in $(find . -type f | grep .less$)
  do
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
