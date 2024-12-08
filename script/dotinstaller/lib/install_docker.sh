#!/usr/bin/env bash

set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utilfuncs.sh

function install_docker() {
	local distro
	distro=$(whichdistro)
	if [[ $distro == "debian" ]]; then
		# Add Docker's official GPG key:
		sudo apt-get update
		sudo apt-get install -y ca-certificates curl
		sudo install -m 0755 -d /etc/apt/keyrings
		sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
		sudo chmod a+r /etc/apt/keyrings/docker.asc

		echo \
			"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
			$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
			sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
		sudo apt-get update

		sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

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

install_docker
