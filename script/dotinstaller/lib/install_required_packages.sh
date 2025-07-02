#!/usr/bin/env bash

set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utilfuncs.sh

distro=$(whichdistro)
if [[ $distro == "redhat" ]]; then
	checkinstall zsh git tmux bc curl wget gawk python3-pip unzip procps jq xsel neovim
elif [[ $distro == "debian" ]]; then
	checkinstall zsh git tmux bc curl wget gawk python3-pip unzip procps jq xsel neovim
else
	checkinstall zsh git tmux bc curl wget xsel gawk python-pip procps jq xsel neovim
fi
