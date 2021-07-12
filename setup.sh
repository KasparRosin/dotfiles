#!/usr/bin/env

# Ask for sudo beforehand, so that the script doesn't halt during installation.
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Create symlinks
echo Creating symlinks
sh ./scripts/stow.sh

# Install essential packages and applications
echo Installing packages
sh ./scripts/install.sh