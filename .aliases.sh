#!/bin/bash

# Use .json_tool.py to print JSON input
alias json='python ~/.json_tool.py'

# Use the whatismyip.py script to find IP
alias whatismyip='python ~/.whatismyip.py'

# Run nosetests with coverage for current directory
alias nose="nosetests --cover-erase --with-coverage --cover-package=$PWD"

# lesscss
alias lessc="$HOME/.lessc/bin/lessc"

# Add PhantomJS to PATH
alias phantomjs="/Library/phantomjs.app/Contents/MacOS/phantomjs"

# Because I sometimes forget I'm not in Vim
alias :q='echo LOLVIM'
alias :w='echo LOLVIM'

# Colored ls output
alias ls='ls -G'
alias ll='ls -Gl'
alias la='ls -Ga'
alias lsa='ls -Ga'

# Convenient shell commands
alias cd..='cd ..'
alias ..='cd ..'

# Reload ~/.bash_profile
alias reload='source ~/.bash_profile'

#vi should point to vim
alias vi='vim'

# Newer version of vim in MacVim distribution
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim 

# Enhanced git for the win.
alias git=hub

# Because I misspell often...
alias gti='git'

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

# Kill all the jobs!
alias killjobs='kill -9 $(jobs -p)'

# Aliases to interact with GNU screen
alias ss='screen -S'
alias sr='screen -r'
alias sls='screen -ls'

# Alias to Python library
alias PYTHON_LIB='cd /Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/'

# Objective-C GCC compiling.
alias objc='gcc -framework foundation'

# For Memcache
EVENT_NOKQUEUE=1
