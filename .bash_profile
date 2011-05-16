
# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:/Users/zachwill/go/bin:${PATH}"
export PATH

#vi should point to vim
alias vi='vim'

# Newer version of vim in MacVim distribution
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim 

# Vi editing mode for bash.
set -o vi

# Keep from clobbering directories
alias mkdir='mkdir -p'

# Who doesn't love tree's colored output?
alias tree='tree -C'

# Kill all jobs
alias killjobs='kill -9 $(jobs -p)'

# Aliases to interact with GNU screen
alias ss='screen -S'
alias sr='screen -r'
alias sx='screen -X -S'
alias sls='screen -ls'

# Use GCC to compile C++ files.
alias gccp='gcc -lstdc++'

# Growl command for iTerm2 -- useful for notifications.
# Usage:
#     run long_process; growl "long_process complete"
growl() { echo -e $'\e]9;'${@}'\007'; return ; }

# The following is for a green git prompt of the current branch.
source ~/.git_completion.sh

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working
  directory clean)" ]] && echo ""
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/*
  \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\u:\W $(__git_ps1 "(\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\]) ")$ '
