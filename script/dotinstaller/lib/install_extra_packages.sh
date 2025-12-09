#!/usr/bin/env bash

set -ue

# Install starship
curl -sS https://starship.rs/install.sh | sh

source $(dirname "${BASH_SOURCE[0]:-$0}")/install_docker.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/install_font.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/install_fzf.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/install_ghq_peco.sh
source $(dirname "${BASH_SOURCE[0]:-$0}")/install_fnm.sh
