#!/usr/bin/env bash

set -euo pipefail

# load helper functions (keeps original behavior)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
source "$SCRIPT_DIR/utilfuncs.sh"

# Determine repository root (script is in script/dotinstaller/lib -> go up 3 levels)
REPO_ROOT="$(cd "$SCRIPT_DIR/../../.." 2>/dev/null && pwd || echo "$HOME")"
TARGET_DIR="$REPO_ROOT/.bin"

NVIM_VERSION="v0.11.5"
NVIM_FILENAME="nvim-linux-x86_64.appimage"
NVIM_URL="https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/${NVIM_FILENAME}"
TARGET_PATH="$TARGET_DIR/$NVIM_FILENAME"

mkdir -p "$TARGET_DIR"

if [ -f "$TARGET_PATH" ]; then
  printf 'Neovim AppImage already exists at %s\n' "$TARGET_PATH"
else
  printf 'Downloading Neovim %s to %s\n' "$NVIM_VERSION" "$TARGET_PATH"
  wget -O "$TARGET_PATH" "$NVIM_URL"
  chmod u+x "$TARGET_PATH"
fi

# Run the AppImage from the repository .bin folder
exec "$TARGET_PATH"
