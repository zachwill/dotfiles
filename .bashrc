# Enable bash completion.
if [ -f /etc/bash_completion ]; then
 source /etc/bash_completion
fi

# Source .alias.sh file
if [ -f ~/.aliases.sh ]; then
  source ~/.aliases.sh
fi

# Add RVM to PATH for scripting
if [ -f ~/.rvm ]; then
  PATH="$PATH:$HOME/.rvm/bin"
fi
