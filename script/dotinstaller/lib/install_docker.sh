#!/usr/bin/env bash

set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utilfuncs.sh

function install_docker() {
	local distro
	distro=$(whichdistro)
	if [[ $distro == "debian" ]]; then
		# Add Docker's official GPG key:
		sudo apt update
		sudo apt install ca-certificates curl
		sudo install -m 0755 -d /etc/apt/keyrings
		sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
		sudo chmod a+r /etc/apt/keyrings/docker.asc
		
		# Add the repository to Apt sources:
		sudo tee /etc/apt/sources.list.d/docker.sources <<-EOF
		Types: deb
		URIs: https://download.docker.com/linux/ubuntu
		Suites: noble
		Components: stable
		Signed-By: /etc/apt/keyrings/docker.asc
		EOF

		sudo apt update
		sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

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
