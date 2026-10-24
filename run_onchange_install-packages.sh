#!/bin/bash
set -euo pipefail

echo "Installing packages and other tools.."
sudo apt update && sudo apt install -y \
    build-essential \
    curl \
    wget \
    git \
    zsh \
    tmux \
    fzf \
    ripgrep \
    fd-find \
    bat \
    jq \
    htop \
    tree \
    unzip \
    lazygit \
    postgresql \
    postgresql-contrib \
    sqlite3

# Oh My Zsh, powerlevel10k and tpm are installed via .chezmoiexternal.toml

echo "Installing Node Version Manager..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | PROFILE=/dev/null bash
