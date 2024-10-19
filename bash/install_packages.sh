#!/bin/bash

sudo apt-get update && \
	sudo apt-get install -y fzf xsel eza

# Install Docker

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install Go

sudo add-apt-repository ppa:longsleep/golang-backports && \
	sudo apt-get update && \
	sudo apt-get install -y golang-go

# Link dotfiles

ln -sf .bashrc ~/.bashrc
ln -sf .bash_aliases ~/.bash_aliases

source ~/.bashrc
source ~/.bash_aiases

# Install ghq + peco

go install github.com/motemen/ghq@latest
go install github.com/peco/peco/cmd/peco@latest
go install github.com/github/hub@latest

# Move git configuration files

sudo mv git-completion.bash /usr/local/etc/
sudo mv git-prompt.sh /usr/local/etc/

sudo chmod 644 /usr/local/etc/git-completion.bash
sudo chmod 644 /usr/local/etc/git-prompt.sh
