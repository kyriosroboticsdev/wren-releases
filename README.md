# Wren — v0.2 beta

Wren is an AI-centered desktop. It runs as its own lightweight operating system on
Debian 13, as an app on Windows, and pairs with your phone. The reference machine
is a 2014 Acer Chromebook R11 (2 GB of RAM, 14 GB of storage): if Wren runs well
there, it runs on almost anything.

This repository holds the **signed packages, installers and apps**. Wren's source
code is private.

> **Beta.** Wren is new and still changing quickly. Keep backups of anything
> important, and expect rough edges.

## Get Wren

| | | |
|---|---|---|
| **Wren OS** | Turns a fresh Debian 13 PC into Wren | [Install below](#install-wren-os) |
| **Wren for Windows** | Tray app: Ctrl+Space opens Wren anywhere | [Download for Windows](https://github.com/kyriosroboticsdev/wren-releases/releases/download/v0.2.0-beta.1/Wren_0.2.0-beta.1_x64-setup.exe) (4 MB) |
| **Wren for Android** | Your computer from your phone | [Download for Android](https://github.com/kyriosroboticsdev/wren-releases/releases/download/v0.2.0-beta.1/wren-0.2.0-beta.1.apk) (1.6 MB) |

## What Wren does

- **An assistant at the center of the desktop:** ask from the top bar or with
  Ctrl+Space, run several tasks side by side, each on its own model. Use local
  models (Ollama), Claude, or Claude Code; a router picks a model for each
  message, and a meter tracks cost with budget caps.
- **Safe by design:** Wren reaches only the folders you grant (grants expire),
  runs commands in a sandbox, asks before anything risky, and records every
  action so it can be undone. Restore points let you roll back the whole system,
  from Settings or the boot menu.
- **A complete desktop:** command bar (Ctrl+K), live system stats, a dock with
  your apps, Files, Settings, Terminal with an error catcher, project tabs that
  run your builds and tests, and an App Store (Flathub on Wren OS, winget on Windows).
- **Smart Connect:** devices pair by showing the same 6-digit code (end-to-end
  encrypted). A shared clipboard, files in both directions, one keyboard and mouse
  across a PC and a Wren laptop (Scroll Lock), and the laptop's sound on the PC.
- **Your phone:** tasks, chat and approvals with notifications; see and control
  the computer's screen, switch its windows, and **ask Wren about what's on the
  screen**. Share files from any app to a computer. Away from home it reaches your
  computer through [Tailscale](https://tailscale.com), automatically.

## Install Wren OS

You need a 64-bit PC (amd64) with a fresh **Debian 13 "trixie"**, installed from
the netinst image with no desktop selected (only *SSH server* and *standard system
utilities*). Choose **btrfs** for the root partition to get restore points. About
4 GB is downloaded, mostly apps.

Log in to the new system and run:

```
wget -qO- https://raw.githubusercontent.com/kyriosroboticsdev/wren-releases/main/get.sh | sudo bash
```

When it says **Done**, restart with `sudo reboot`. You'll see Wren's login screen.
After that, Wren updates through **Settings › Updates**. Packages are verified
against the key in `repo/wren-archive-keyring.gpg`.

To remove it: `sudo apt remove wren-os` goes back to the text console, and
`sudo apt remove wren` removes the rest.

## Install Wren for Windows

Windows 10 or 11, 64-bit. Run the installer: it installs for your account
only, no administrator needed. The installer isn't code-signed yet, so Windows may
say *Windows protected your PC*: choose **More info › Run anyway**.

Wren starts in the tray when you sign in; **Ctrl+Space** opens it anywhere, and
the tray menu has the full window, Start when I sign in, and Quit.

## Install Wren for Android

Android 8 or newer. Open the `.apk` on the phone and allow installing from your
browser when Android asks. Then pair it with your computer:

- **Phone link** (tasks, chat, approvals, screen): on the computer, Settings ›
  Devices › Phone › Show QR code, then *Scan QR code* in the app.
- **Smart Connect** (clipboard, files): Devices in the app, then pair with the
  computer listed under Nearby.

The app tells you when a new version is out. For use away from home, install
Tailscale on the computer and the phone and sign in with the same account.

All versions: [Releases](https://github.com/kyriosroboticsdev/wren-releases/releases).

## License

Free to use, all rights reserved: see [LICENSE](LICENSE). Wren includes
open-source components under their own licenses, listed in
[THIRD-PARTY-NOTICES.txt](THIRD-PARTY-NOTICES.txt).

## Feedback

Found a bug or have an idea? [Open an issue](https://github.com/kyriosroboticsdev/wren-releases/issues).
