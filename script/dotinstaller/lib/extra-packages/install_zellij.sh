#!/usr/bin/env bash

set -ue

# check golang is installed
if command -v cargo >/dev/null 2>&1; then
  cargo install --locked zellij
fi
