#!/usr/bin/env bash

set -ue

local dir_name="$(dirname "${BASH_SOURCE[0]:-$0}")/extra-packages"
if [ -d "$dir_name" ]; then
  for f in $dir_name/*; do
    source "$f"
  done
fi
