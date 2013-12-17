#!/bin/bash

alias star='starcluster'

# Use .json_tool.py to print JSON input
alias json='python ~/.json_tool.py'

# Use ifconfig.me website
alias ip='curl ifconfig.me'

# Run nosetests with coverage for current directory
alias nose="nosetests --cover-erase --with-coverage --cover-package=$PWD"

# Add PhantomJS to PATH
alias phantomjs="/Library/phantomjs.app/Contents/MacOS/phantomjs"

# Python server
alias simple='python -m SimpleHTTPServer'

# Because I sometimes forget I'm not in Vim
alias :q='echo LOLVIM'
alias :w='echo LOLVIM'

# git can be a little verbose
alias gpo='git push origin'
alias gph='git push heroku'

# Colored ls output
alias ls='ls -G'
alias ll='ls -Gl'
alias la='ls -Ga'
alias lh='ls -Glh'
alias lla='ls -Gla'
alias lsa='ls -Ga'

# Because I'm tired of typing `brew switch`.
alias bs='brew switch'

# Convenient shell commands
alias cd..='cd ..'
alias ..='cd ..'

# Reload ~/.bash_profile
alias reload='source ~/.bash_profile'

# vi should point to vim
alias vi='vim'

# Because I misspell often...
alias gti='git'

# Alias for Tcl shell-like interpreter
alias tcl='tclsh'

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

# Kill a specific screen
sk(){
  if [ "$1" != "" ]; then
    screen -S $1 -X kill
    echo "Killed screen: $1"
  fi
}

# VLC
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# MAMP
alias mamp='/Applications/MAMP/Library/bin/mysql'

# Vundle BundleInstall from the CLI
alias vundle='vim +BundleInstall +qall'

# Homebrew SQLite
alias sqlite='/usr/local/opt/sqlite/bin/sqlite3'
