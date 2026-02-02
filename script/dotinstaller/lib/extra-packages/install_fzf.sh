#!/usr/bin/env bash

set -ue

local SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]:-$0}")"
local PARENT_DIR="$(dirname $SCRIPT_DIR)"

source $PARENT_DIR/utilfuncs.sh

function install_fzf() {
  local fzf_dir="$HOME/.fzf"
  git_clone_or_fetch https://github.com/junegunn/fzf.git \
    $fzf_dir
  $fzf_dir/install --key-bindings --no-completion --no-update-rc
}

install_fzf
