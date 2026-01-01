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

function trash() {
  local DEFAULT_TRASH_DIR="$HOME/.trash"
  local TRASH_DIR="$DEFAULT_TRASH_DIR"

  # 第1引数がパスならゴミ箱指定
  if [ -n "$1" ] && [[ "$1" == /* ]]; then
    TRASH_DIR="$1"
    shift
  fi

  local NOWDATE
  NOWDATE=$(date +"%y%m%d-%H%M%S")

  local DEST="$TRASH_DIR/$NOWDATE"
  mkdir -p "$DEST"

  local MV_OPTS=()

  # オプション解析（rm 互換だが mv に渡すのは -f のみ）
  while [ $# -gt 0 ]; do
    case "$1" in
    -f)
      MV_OPTS+=("-f")
      shift
      ;;
    -r | -R | -rf | -fr)
      # rm互換として受け取るが mv には渡さない
      shift
      ;;
    --)
      shift
      break
      ;;
    -*)
      echo "trash: unknown option $1" >&2
      return 1
      ;;
    *)
      break
      ;;
    esac
  done

  for target in "$@"; do
    local abs_target
    abs_target="$(realpath "$target")"
    local abs_trash
    abs_trash="$(realpath "$TRASH_DIR")"

    # ゴミ箱自身を移動しない
    if [[ "$abs_target" == "$abs_trash"* ]]; then
      echo "trash: cannot trash the trash directory itself: $target" >&2
      continue
    fi

    mv "${MV_OPTS[@]}" "$target" "$DEST" &&
      echo "mv \"$target\" \"$DEST\""
  done
}
