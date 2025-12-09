# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

###########################
### 	 Aliases		###
###########################
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Setup StarShip
eval "$(starship init zsh)"
