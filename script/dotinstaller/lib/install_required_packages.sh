#!/usr/bin/env bash

set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utilfuncs.sh

distro=$(whichdistro)
if [[ $distro == "redhat" ]]; then
  checkinstall zsh git bc curl wget gawk python3-pip unzip procps jq xsel
elif [[ $distro == "debian" ]]; then
  checkinstall zsh git bc curl wget gawk python3-pip unzip procps jq xsel
else
  checkinstall zsh git bc curl wget xsel gawk python-pip procps jq xsel
fi

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install additional required packages
local dir_name="$(dirname "${BASH_SOURCE[0]:-$0}")/required-packages"
if [ -d "$dir_name" ]; then
  for f in $dir_name/*; do
    source "$f"
  done
fi
