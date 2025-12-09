# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

##############
### Environment variables ###
##############
if [ -f ~/.common_env ]; then
    source ~/.common_env
fi

###########################
### 	 Aliases		###
###########################
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

##########################
## load local settings ###
##########################
[ -f "$HOME/.bash_aliases.local" ] && source ~/.bash_aliases.local
[ -f "$HOME/.bashrc.local" ] && source ~/.bashrc.local
[ -f "$HOME/.local/bin/env" ] && source ~/.local/bin/env

# Setup StarShip
eval "$(starship init bash)"
