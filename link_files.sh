#!/bin/bash

# Easily link all the dotfiles after a `git pull`.
#
# Usage:
#   bash link_files.sh

link_file() { ln -s $PWD/$file $HOME/$file ; return ; }

rm_and_link() { rm $HOME/$file && link_file ; return ; }

prompt_deletion() {
  read -n1 -p "Delete $HOME/$file and link new one? (y/n) " ;
  printf "\n" ;  # Blank newline
  [[ $REPLY == [yY] ]] && rm_and_link && echo Done || echo File not linked ;
}

for file in $(ls -a | grep ^\\.[a-z] | grep -v .git$)
do
  if [ -f $HOME/$file ]
    then
      prompt_deletion
    else
      link_file
  fi
done
