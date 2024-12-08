# Set key binds

if [ -f ~/.bin/bindfuncs.sh ]; then
    source ~/.bin/bindfuncs.sh
	bind -x '"\C-f": fzf'    # Ctrl-F に割り当てる
	bind -x '"\C-@": find_and_edit' # Ctrl-@ に割り当てる
	bind -x '"\C-r": replace_by_history' # Ctrl-R の履歴検索を上書きする
	bind -x '"\C-j": peco_ghq' # Ctrl-[ に割り当てる
	bind -x '"\C-k": peco_hub' # Ctrol-] に割り当てる
fi
