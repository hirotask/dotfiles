#!/usr/bin/env bash

set -ue

mkdir -p ~/.local/share/fonts

# FiraCode Nerd Font
mkdir -p ~/.local/share/fonts/UDEVGothic
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip"
curl -sfL "${DOWNLOAD_URL}" -o /tmp/FiraCode.zip
(cd /tmp && unzip -j -o FiraCode.zip -d ~/.local/share/fonts/FiraCode)

fc-cache -vf
