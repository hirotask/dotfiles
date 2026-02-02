#!/usr/bin/env bash

set -ue

# check golang is installed
if command -v go >/dev/null 2>&1; then
  go install github.com/x-motemen/ghq@latest
  go install github.com/peco/peco/cmd/peco@latest
  go install github.com/github/hub@latest
fi
