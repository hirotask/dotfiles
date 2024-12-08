
if [ -f ~/.bin/bindfuncs.sh ]; then
    source ~/.bin/bindfuncs.sh
	[ -f "$HOME/.fzf.zsh" ] && source ~/.fzf.zsh

	zle -N find_and_edit
	zle -N replace_by_history
	zle -N peco_ghq
	zle -N peco_hub

	bindkey '^@'        find_and_edit     # Ctrl-@
	bindkey '^r'        replace_by_history     # Ctrl-r
	bindkey '^j'        peco_ghq     # Ctrl-j
	bindkey '^k'        peco_hub     # Ctrl-k
fi


