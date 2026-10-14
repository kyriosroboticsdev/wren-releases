#!/bin/bash
# Installs Wren OS (beta) on Debian 13: wget -qO- https://kyriosroboticsdev.github.io/wren-releases/get.sh | sudo bash
set -euo pipefail
[ "$(id -u)" = 0 ] || { echo "Run it with sudo."; exit 1; }
[ -n "${SUDO_USER:-}" ] || { echo "Run it with sudo from your own account (not as root)."; exit 1; }
base=https://kyriosroboticsdev.github.io/wren-releases
dir=$(mktemp -d)
mkdir -p "$dir/repo"
wget -q -O "$dir/install.sh" "$base/install.sh"
wget -q -O "$dir/repo/wren-archive-keyring.gpg" "$base/repo/wren-archive-keyring.gpg"
bash "$dir/install.sh" --repo "$base" --suite beta
