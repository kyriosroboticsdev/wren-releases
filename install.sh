#!/bin/bash
# Turns a Debian 13 system into Wren OS: Wren's login screen at boot (greetd,
# shown in cage + cog), then the desktop: labwc with Wren's page (cog, WPE WebKit)
# pinned underneath and apps from Flathub opening as windows on top.
#
# Run from your own account:  sudo bash install.sh [--suite beta] [--repo URL]
#
# It adds Wren's package repository and installs the wren-os package, so from
# then on Wren updates like the rest of the system (apt, or Settings › Updates).
# With wren_*.deb and wren-os_*.deb next to this script it installs those instead,
# still adding the repository for later updates (offline installs, testing).
# To go back to the text console:  sudo apt remove wren-os
set -euo pipefail
[ "$(id -u)" = 0 ] || { echo "Run it with sudo: sudo bash $0"; exit 1; }
user=${SUDO_USER:?run this with sudo from your own account, not as root}
here=$(dirname "$(readlink -f "$0")")

# Where Wren's packages are published (distro/repo/mkrepo.py builds the tree).
repo=${WREN_REPO:-https://raw.githubusercontent.com/kyriosroboticsdev/wren-releases/main}
suite=stable
while [ $# -gt 0 ]; do
    case "$1" in
        --repo) repo=$2; shift 2 ;;
        --suite) suite=$2; shift 2 ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

. /etc/os-release
if [ "${VERSION_CODENAME:-}" != trixie ] && ! grep -qs trixie /etc/debian_version; then
    echo "Note: Wren OS is built for Debian 13 (trixie); this is ${PRETTY_NAME:-unknown}. Continuing."
fi

echo "== Wren's package repository ($repo, $suite)"
install -D -m 644 "$here/repo/wren-archive-keyring.gpg" /usr/share/keyrings/wren-archive-keyring.gpg
cat > /etc/apt/sources.list.d/wren.sources <<SRC
Types: deb
URIs: $repo
Suites: $suite
Components: main
Signed-By: /usr/share/keyrings/wren-archive-keyring.gpg
SRC

echo "== Packages"
# Debian's own lists must be fresh for the dependencies; Wren's repository can
# be unreachable for an offline install from local packages.
newest() { ls -v "$here"/$1 2>/dev/null | tail -n 1 || true; } # none is fine
wren_deb=$(newest 'wren_*.deb'); os_deb=$(newest 'wren-os_*.deb')
if [ -n "$wren_deb" ] && [ -n "$os_deb" ]; then
    apt-get update || echo "Couldn't reach every repository; installing the local packages anyway."
    apt-get install -y --no-install-recommends --allow-downgrades "$wren_deb" "$os_deb"
else
    apt-get update
    apt-get install -y --no-install-recommends wren-os
fi

echo "== Apps for $user"
sudo -u "$user" -H env XDG_RUNTIME_DIR="/run/user/$(id -u "$user")" /usr/lib/wren/user-setup

echo
echo "Done. Reboot (sudo reboot) to see Wren's login screen."
