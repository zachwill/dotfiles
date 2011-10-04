#!/bin/bash

# Easily link all the dotfiles after a `git pull`.
#
# Usage:
#   bash link_files.sh

# Colors...
GREEN='\033[32m'
RED='\033[31m'
BLUE='\033[34m'
NC='\033[0m' # No Color


link_file() {
  ln -s $PWD/$file $HOME/$file && echo "${GREEN}Linked ~/$file ${NC}"
}

rm_and_link() {
  rm $HOME/$file && link_file
}

prompt_deletion() {
  read -n1 -p "Delete ~/$file and link new one? (y/n) "
  printf "\n"
  [[ $REPLY == [yY] ]] && rm_and_link || echo "${RED}File not linked.${NC}"
}


# Loop through available dotfiles...
for file in $(ls -a | grep ^\\.[a-z] | grep -v .git$); do
  if [ -e $HOME/$file ]; then
    prompt_deletion
  else
    link_file
  fi
done

# All done.
echo "\n${BLUE}Returning to shell...${NC}\n"
