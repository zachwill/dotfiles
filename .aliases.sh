#!/bin/bash

# Use .json_tool.py to print JSON input
alias json='python ~/.json_tool.py'

# Run nosetests with coverage for current directory
alias nose="nosetests --cover-erase --with-coverage --cover-package=$PWD"

# lesscss
alias lessc="$HOME/.lessc/bin/lessc"

# Add PhantomJS to PATH
alias phantomjs="/Library/phantomjs.app/Contents/MacOS/phantomjs"

# Colored ls output
alias ls='ls -G'
alias la='ls -Ga'

# Reload ~/.bash_profile
alias reload='source ~/.bash_profile'

#vi should point to vim
alias vi='vim'

# Newer version of vim in MacVim distribution
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim 

# Alias for Tcl shell-like interpreter
alias tcl='tclsh'

# Redis server
alias redis_server="$HOME/Library/redis/src/redis-server"
# Redis client
alias redis="$HOME/Library/redis/src/redis-cli"

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
