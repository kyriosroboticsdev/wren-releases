# Wren OS — v0.1 beta

Wren is a lightweight, AI-centered desktop that turns Debian 13 into its own
operating system. The minimum spec reference machine is a 2014 Acer Chromebook
R11 (2 GB RAM, 14 GB storage): if Wren runs well there, it runs on almost anything.

This repository holds the **signed packages and installer**. Wren's source code is private.

> **Beta.** Wren is new and still changing quickly. Keep backups of anything
> important, and expect rough edges.

## What's in v0.1

- **A desktop built around an AI assistant:** a command bar (Ctrl+K), a top bar
  with live CPU, memory and temperature, a dock with your open apps, and Wren's
  own Files, Settings, Terminal and App Store (Flathub).
- **Choose your AI:** local models (Ollama), Claude, or Claude Code, with a model
  router, cost tracking and budget caps. Every action Wren takes is recorded and
  can be undone, and anything risky asks for your approval first.
- **Permissions:** Wren only reaches the folders you grant it, grants expire, and
  commands run in a sandbox.
- **Updates and restore points:** Settings › Updates installs signed updates, and
  a restore point is saved before each one. If an update ever goes wrong, go
  back from Settings, or from the boot menu if the computer won't start.
- **Smart Connect:** pair Wren devices on the same network (both screens show
  the same code). Press Scroll Lock to move a Windows PC's keyboard and mouse to
  a Wren OS laptop and back, and play the laptop's sound on the PC.
- **Your phone:** pair it by QR code for approvals, notifications and screen control
  from its browser (an Android app is coming).

## Requirements

- A 64-bit PC (amd64) running a fresh **Debian 13 "trixie"**, installed from the
  netinst image with no desktop selected (only *SSH server* and *standard system
  utilities*).
- For restore points: choose **btrfs** for the root partition during installation.
- Wi-Fi or Ethernet during installation (about 4 GB is downloaded, mostly apps).

## Install

Log in to your new Debian system and run:

```
wget -qO- https://kyriosroboticsdev.github.io/wren-releases/get.sh | sudo bash
```

When it says **Done**, restart with `sudo reboot`. You'll see Wren's login screen.

The installer adds this repository (packages are verified against the key in
`repo/wren-archive-keyring.gpg`), installs the `wren-os` package, and sets up the
apps for your account. After that, Wren updates through **Settings › Updates**
like the rest of the system.

## Remove

`sudo apt remove wren-os` goes back to the text console, and `sudo apt remove wren`
removes the rest.

## License

Free to use, all rights reserved: see [LICENSE](LICENSE). Wren includes
open-source components under their own licenses, listed in
[THIRD-PARTY-NOTICES.txt](THIRD-PARTY-NOTICES.txt).

## Feedback

Found a bug or have an idea? [Open an issue](https://github.com/kyriosroboticsdev/wren-releases/issues).
