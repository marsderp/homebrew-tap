# Nidi for Mac

Nidi installs through Homebrew. It needs macOS 14 (Sonoma) or later, on Apple Silicon or Intel.

## Before you start

You need Homebrew. If `brew --version` in Terminal says "command not found", install it from [brew.sh](https://brew.sh) first.

## Install

```sh
brew install --cask marsderp/tap/nidi
```

Then open Nidi from Applications or Spotlight.

Homebrew asks you to trust a tap before it runs anything from it. Installing with the full name `marsderp/tap/nidi`, as above, counts as trusting it.

## Updates

Nidi updates itself. When a new version is out, an arrow button appears in the sidebar. Click it, then Install, and Nidi restarts on the new version. You don't need `brew upgrade` for Nidi, and a plain `brew upgrade` leaves it alone.

To make Homebrew reinstall the newest version anyway:

```sh
brew update
brew upgrade --cask --greedy nidi
```

## Uninstall

Remove the app but keep your services, logins and settings (useful if you plan to reinstall):

```sh
brew uninstall --cask nidi
```

Remove the app and all of its data (logins, settings, caches):

```sh
brew uninstall --zap --cask nidi
```

To also remove this tap from Homebrew:

```sh
brew untap marsderp/tap
```

## If macOS still blocks the first open

The install clears the macOS download flag, so Nidi normally opens with no warning. If you see "Nidi cannot be opened" or "Apple could not verify Nidi":

1. Open System Settings > Privacy & Security.
2. Scroll down to the message about Nidi and click Open Anyway.
3. Confirm with your password or Touch ID.

Or run this once in Terminal, then open Nidi again:

```sh
xattr -dr com.apple.quarantine /Applications/Nidi.app
```

You only need to do this once. Updates keep working afterwards.

## For the maintainer

Nidi's release workflow sets the version and checksum in `Casks/nidi.rb`. Don't edit them by hand.
