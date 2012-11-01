# Add local bin to PATH
PATH="/usr/local/sbin:/usr/local/bin:${PATH}"

# Postgres.app
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Setting PATH for Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"

# Export the PATH
export PATH

# Vi editing mode for bash.
set -o vi

# Set default editor to vim.
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

# Python file for interactive console
export PYTHONSTARTUP=$HOME/.pythonrc.py

# Node modules
export NODE_PATH="/usr/local/lib/node_modules"

# Source .aliases.sh file
[[ -s "$HOME/.aliases.sh" ]] && . "$HOME/.aliases.sh"

# Source .functions.sh file
[[ -s "$HOME/.functions.sh" ]] && . "$HOME/.functions.sh"

# Django shell autocompletion
[[ -s "$HOME/.django_completion.sh" ]] && . "$HOME/.django_completion.sh"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# The following is for a green git prompt of the current branch.
if [ -f ~/.git_completion.sh ]; then
  source ~/.git_completion.sh
fi

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working
  directory clean)" ]] && echo ""
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Cool characters: ✩ ✪ ⚡
export PS1="\W \[\e[1;32m\]\$(parse_git_branch)\[\e[0m\] ✩  "

# Settings for Mapnik.framework Installer to enable Mapnik programs and python bindings
# export PATH=/Library/Frameworks/Mapnik.framework/Programs:$PATH
# export PYTHONPATH=/Library/Frameworks/Mapnik.framework/Python:$PYTHONPATH
