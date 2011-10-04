# Add local bin to PATH
PATH="/usr/local/bin:${PATH}"

# Add Go to PATH
PATH="/Library/go/bin:${PATH}"

# Add GDAL to PATH
PATH="$PATH:/Library/Frameworks/GDAL.framework/Programs"

# Setting PATH for Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
export PATH

# Vi editing mode for bash.
set -o vi

# Set default editor to vim.
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

# Python file for interactive console
export PYTHONSTARTUP=$HOME/.pythonrc.py

# Source .aliases.sh file
[[ -s "$HOME/.aliases.sh" ]] && . "$HOME/.aliases.sh"

# Django shell autocompletion
[[ -s "$HOME/.django_completion.sh" ]] && . "$HOME/.django_completion.sh"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

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


# The following is for a green git prompt of the current branch.
if [ -f ~/.git_completion.sh ]; then
  source ~/.git_completion.sh
fi

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working
  directory clean)" ]] && echo ""
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/*
  \(.*\)/[\1$(parse_git_dirty)]/"
}

# Cool characters: ✩ ✪ ⚡
export PS1='\u:\W $(__git_ps1 "(\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\]) ")✩  '

# Settings for Mapnik.framework Installer to enable Mapnik programs and python bindings
export PATH=/Library/Frameworks/Mapnik.framework/Programs:$PATH
export PYTHONPATH=/Library/Frameworks/Mapnik.framework/Python:$PYTHONPATH
