#!/usr/bin/env bash

set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utilfuncs.sh

function install_go() {
	local distro
	distro=$(whichdistro)
	if [[ $distro == "debian" ]]; then
		sudo add-apt-repository ppa:longsleep/golang-backports && \
			sudo apt-get update && \
			sudo apt-get install -y golang-go

	elif [[ $distro == "redhat" ]]; then
		:
	elif [[ $distro == "arch" ]]; then
		:
	elif [[ $distro == "alpine" ]]; then
		:
	else
		:
	fi
}

install_go
go install github.com/x-motemen/ghq@latest
go install github.com/peco/peco/cmd/peco@latest
go install github.com/github/hub@latest
