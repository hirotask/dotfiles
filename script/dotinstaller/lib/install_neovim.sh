#!/usr/bin/env bash

set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utilfuncs.sh

wget https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.appimage -P $HOME

chmod u+x "$HOME/nvim-linux-x86_64.appimage"
./nvim-linux-x86_64.appimage

