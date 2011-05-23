# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Vi editing mode for bash.
set -o vi

# Set default editor to vim.
export EDITOR=vim

# Python file for interactive console
export PYTHONSTARTUP=$(echo $HOME)/.pythonrc.py

# Source .aliases.sh file
if [ -f ~/.aliases.sh ]; then
  source ~/.aliases.sh
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Growl command for iTerm2 -- useful for notifications.
# Usage:
#   long_process && growl "long_process complete"
growl() { echo -e $'\e]9;'${@}'\007'; return ; }

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

export PS1='\u:\W $(__git_ps1 "(\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\]) ")$ '
