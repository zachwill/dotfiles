#!bin/bash
for file in $(ls -a | grep ^\\.[a-z])
do
  if [ -f $HOME/$file ]
    then
      echo $file already exists in the home directory.
      # prompt for deletion
      # then link files
    else
      ln -s $PWD/$file $HOME/$file
  fi
done

# Easily link all the dotfiles after a `git pull`.
#
# Usage:
#   bash link_files.sh
