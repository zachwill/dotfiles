#!/bin/bash

#vi should point to vim
alias vi='vim'

# Newer version of vim in MacVim distribution
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim 

# Alias for Tcl shell-like interpreter
alias tcl='tclsh'

# Keep from clobbering directories
alias mkdir='mkdir -p'

# Who doesn't love tree's colored output?
alias tree='tree -C'

# Kill all jobs
alias killjobs='kill -9 $(jobs -p)'

# Aliases to interact with GNU screen
alias ss='screen -S'
alias sr='screen -r'
alias sls='screen -ls'

# Use GCC to compile C++ files.
alias gccp='gcc -lstdc++'
