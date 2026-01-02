#!/usr/bin/env bash

set -ue

curl -LO https://github.com/wezterm/wezterm/releases/download/20240203-110809-5046fc22/WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage
chmod +x WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage

mkdir -p /usr/local/bin/
mv ./WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage /usr/local/bin/wezterm
