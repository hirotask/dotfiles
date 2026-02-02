#!/usr/bin/env bash

set -ue

local SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]:-$0}")"
local PARENT_DIR="$(dirname $SCRIPT_DIR)"

source $PARENT_DIR/utilfuncs.sh

local distro
distro=$(whichdistro)
if [[ $distro == "debian" ]]; then
  sudo add-apt-repository ppa:longsleep/golang-backports &&
    sudo apt-get update &&
    sudo apt-get install -y golang-go
elif [[ $distro == "redhat" ]]; then
  :
elif [[ $distro == "arch" ]]; then
  :
elif [[ $distro == "alpine" ]]; then
  :
else
  brew install go
fi
