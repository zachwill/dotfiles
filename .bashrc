# Enable bash completion.
if [ -f /etc/bash_completion ]; then
 source /etc/bash_completion
fi

# Source .alias.sh file
if [ -f ~/.aliases.sh ]; then
  source ~/.aliases.sh
fi
