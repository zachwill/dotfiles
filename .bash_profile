# Mac OS X specific things
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Add local bin to PATH
  PATH="/usr/local/bin:${PATH}"
  # Python scripts
  PATH="${PATH}:/usr/local/share/python"
fi

# Export the PATH
export PATH

# Vi editing mode for bash.
set -o vi

# Set default editor to vim.
if [[ "$OSTYPE" == "darwin"* ]]; then
  export EDITOR=vim
fi

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

# Our secret shell functions/aliases
[[ -s "$HOME/.secrets.sh" ]] && . "$HOME/.secrets.sh"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.bash

# The following is for a green git prompt of the current branch.
if [ -f ~/.git_completion.sh ]; then
  source ~/.git_completion.sh
fi

function parse_git_branch {
  local prompt=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
  if [ -n $prompt ]; then
    echo " $prompt"
  fi
}

# Cool characters: ✩ ✪ ⚡
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PS1="\W\[\e[1;32m\]\$(parse_git_branch)\[\e[0m\] ✩  "
else
  export PS1="\W\[\e[1;32m\]\$(parse_git_branch)\[\e[0m\] ✪  "
fi
