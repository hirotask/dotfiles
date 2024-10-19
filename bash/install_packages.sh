#!/bin/bash

sudo apt-get update && \
	sudo apt-get install -y fzf xsel exa

# Install Go

sudo add-apt-repository ppa:longsleep/golang-backports && \
	sudo apt-get update && \
	sudo apt-get install -y golang-go

go get github.com/motemen/ghq
go get github.com/peco/peco/cmd/peco
go get github.com/github/hub

# Move git configuration files

mv git-completion.bash /usr/local/etc/
mv git-prompt.sh /usr/local/etc/

chmod 644 /usr/local/etc/git-completion.bash
chmod 644 /usr/local/etc/git-prompt.sh
