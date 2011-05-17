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

# Output...
DONE="${GREEN}Done${NC}"
NOT_LINK="${RED}File not linked${NC}"

link_file() { ln -s $PWD/$file $HOME/$file ; return ; }

rm_and_link() { rm $HOME/$file && link_file ; return ; }

prompt_deletion() {
  read -n1 -p "Delete ~/$file and link new one? (y/n) " ;
  printf "\n" ;  # Blank newline
  [[ $REPLY == [yY] ]] && rm_and_link && echo -e $DONE || echo -e $NOT_LINK ;
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
echo -e "\n${BLUE}Returning to shell...${NC}\n"
