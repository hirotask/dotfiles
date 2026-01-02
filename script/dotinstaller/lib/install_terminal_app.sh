#!/usr/bin/env bash

set -ue

curl -LO https://github.com/wezterm/wezterm/releases/download/nightly/WezTerm-nightly-Ubuntu20.04.AppImage
chmod +x WezTerm-nightly-Ubuntu20.04.AppImage

mkdir -p /usr/local/bin/
mv WezTerm-nightly-Ubuntu20.04.AppImage /usr/local/bin/wezterm
