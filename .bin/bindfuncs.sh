#!/usr/bin/env bash

function find_and_edit() {
  # fzf でファイルを検索して Visual Studio Code で開く
  fzf | xargs code
}

function replace_by_history() {
  # fzf を使った、コマンド履歴検索
  local l
  l=$(HISTTIMEFORMAT='' history | sort -k1,1nr | sed -e 's/^[[:space:]]*[0-9]\+[[:space:]]*//' | awk '!a[$0]++{print}' | fzf --query "$READLINE_LINE")
  READLINE_LINE="$l"
  READLINE_POINT=${#l}
}

function peco_ghq() {
	cd $(ghq root)/$(ghq list | peco)
}

function peco_hub() {
	hub browse $(ghq list | peco | cut -d "/" -f 2,3)
}
