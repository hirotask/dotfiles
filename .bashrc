# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return ;;
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

if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

##########################
## load local settings ###
##########################
[ -f "$HOME/.bash_aliases.local" ] && source ~/.bash_aliases.local
[ -f "$HOME/.bashrc.local" ] && source ~/.bashrc.local
[ -f "$HOME/.local/bin/env" ] && source ~/.local/bin/env

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
fi

# nvim
NVIM_PATH="/opt/nvim"
if [ "$NVIM_PATH" ]; then
  export PATH="/opt/nvim:$PATH"
fi

# Setup StarShip
eval "$(starship init bash)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.cargo/env"
